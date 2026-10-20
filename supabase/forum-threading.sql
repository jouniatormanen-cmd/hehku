-- HEHKU: keskusteluketjut. Suorita kokonaisuudessaan Supabasen SQL Editorissa.
-- Nykyiset viestit säilyvät aloituksina (parent_id IS NULL).
BEGIN;
DO $$
DECLARE id_type text;
BEGIN
 SELECT format_type(a.atttypid,a.atttypmod) INTO id_type
 FROM pg_attribute a
 WHERE a.attrelid='public.hehku_forum_messages'::regclass
 AND a.attname='id' AND NOT a.attisdropped;
 IF id_type IS NULL THEN RAISE EXCEPTION 'Viestitaulun id puuttuu'; END IF;
 IF NOT EXISTS (SELECT 1 FROM pg_attribute WHERE attrelid='public.hehku_forum_messages'::regclass AND attname='parent_id' AND NOT attisdropped) THEN
 EXECUTE format('ALTER TABLE public.hehku_forum_messages ADD COLUMN parent_id %s REFERENCES public.hehku_forum_messages(id) ON DELETE RESTRICT',id_type);
 END IF;
END $$;
CREATE INDEX IF NOT EXISTS hehku_forum_parent_created_idx
 ON public.hehku_forum_messages(parent_id,created_at,id);
CREATE OR REPLACE FUNCTION public.hehku_validate_forum_thread()
RETURNS trigger LANGUAGE plpgsql SET search_path=public AS $$
BEGIN
 IF TG_OP='UPDATE' AND NEW.parent_id IS DISTINCT FROM OLD.parent_id THEN
  RAISE EXCEPTION 'Viestin keskusteluketjua ei voi vaihtaa';
 END IF;
 IF NEW.parent_id IS NOT NULL THEN
  IF NEW.parent_id=NEW.id THEN RAISE EXCEPTION 'Viesti ei voi vastata itseensa'; END IF;
  IF NOT EXISTS (
   SELECT 1 FROM public.hehku_forum_messages p
   WHERE p.id=NEW.parent_id AND p.parent_id IS NULL AND p.status='approved'
  ) THEN RAISE EXCEPTION 'Vastata voi vain julkaistuun aloitukseen'; END IF;
 END IF;
 IF TG_OP='INSERT' AND current_user IN ('anon','authenticated') THEN
  NEW.status := 'pending';
 END IF;
 RETURN NEW;
END $$;
DROP TRIGGER IF EXISTS hehku_forum_thread_validation ON public.hehku_forum_messages;
CREATE TRIGGER hehku_forum_thread_validation
 BEFORE INSERT OR UPDATE OF parent_id ON public.hehku_forum_messages
 FOR EACH ROW EXECUTE FUNCTION public.hehku_validate_forum_thread();
-- Aiemmat RLS-oikeudet pysyvät voimassa. Tämä päivitys ei avaa uusia käyttöoikeuksia.
NOTIFY pgrst, 'reload schema';
COMMIT;
