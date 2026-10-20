begin;
alter table public.hehku_forum_messages
  add column if not exists reply_to_id uuid
  references public.hehku_forum_messages(id) on delete set null;
grant insert (reply_to_id) on public.hehku_forum_messages
  to anon, authenticated;
create or replace function public.hehku_check_reply_target()
returns trigger language plpgsql set search_path = '' as $$
begin
  if new.reply_to_id is not null and not exists (
    select 1 from public.hehku_forum_messages m
    where m.id = new.reply_to_id
      and m.status = 'approved'
      and coalesce(m.parent_id, m.id) = new.parent_id
  ) then
    raise exception 'Vastauskohteen on oltava samassa julkaistussa keskustelussa';
  end if;
  return new;
end;
$$;
drop trigger if exists hehku_reply_target_check
  on public.hehku_forum_messages;
create trigger hehku_reply_target_check
  before insert or update of reply_to_id, parent_id
  on public.hehku_forum_messages
  for each row execute function public.hehku_check_reply_target();
notify pgrst, 'reload schema';
commit;