# HEHKU – jatkomuistio 20.10.2026

Varmuuskopio: backup/hehku-2026-10-20-valmis
Pohjana main-haaran commit 63caafcfda65f484c28414e813b68793451fc9e3.

## Hyväksytty nykytila
Käyttäjä testasi keskustelupalstan ja ylläpidon tietokoneella ja mobiilissa ja vahvisti kaiken toimivan. Ulkoasu hyväksytty; älä muuta sitä ilman uutta pyyntöä.
Etusivu: https://jouniatormanen-cmd.github.io/hehku/
Palsta: keskustelu.html. Ylläpito: yllapito.html.
Etusivun alareunassa Ylläpito-linkki.
Yläpalkissa tumma pinkki Tule mukaan keskusteluun -painike, Kuumat puheenaiheet -teksti.
Etusivun nosto: Kuumat puheenaiheet juuri nyt, enintään kolme hyväksyttyä aloitusta.
Mobiilin keskustelupainiketta madallettiin viimeiseksi; käyttäjä hyväksyi nykytilan.
Palstan otsikko: Puhutaan siitäkin.
Viestit yhtenä tiiviinä listana. Jokaiselle voi vastata; vastauskohde ja katkelma näkyvät. Yksi kirjoituskenttä ketjun lopussa.
Anonyymi kirjoittaminen; viestit ja vastaukset menevät ylläpidon hyväksyntään.
Ylläpito: kirjautuminen, hyväksyminen, hylkääminen, piilottaminen, asiattomuusilmoitukset. Käyttäjä vahvisti toiminnan.

## Tekniikka ja varmuuskopion rajaus
GitHub Pages + erillinen HEHKU Supabase-projekti.
Repossa SQL-päivitykset supabase/forum-threading.sql ja supabase/forum-reply-targets.sql; käyttäjä suoritti ne onnistuneesti sekä parent_id INSERT -käyttöoikeuden.
Tietokantataulut hehku_forum_messages, hehku_forum_admins ja hehku_forum_reports. Viesteissä parent_id on ketjun juuri, reply_to_id suora vastauskohde.
Tämä on koodin ja repossa olevien SQL-tiedostojen varmuuskopio. EI Supabasen viestien, käyttäjien tai koko tietokannan varmuuskopio.
Ensimmäinen taulut ja RLS-säännöt luonut SQL annettiin keskustelussa eikä välttämättä ole repossa. Täydellinen tietokantapalautus vaatii erillisen schema- ja data-viennin.
Salasanoja tai salaisia avaimia ei sisällytetä muistioon.
Roskapostisuoja on nykyisessä julkisessa lomakkeessa selainkohtainen viive ja honeypot; palvelinpuolinen rajoitus on jatkokehitystä.

## Liiketoiminnan sovittu suunta
HEHKU aloittaa DROPSHIPPINGILLÄ. Oman varaston koko ei rajoita valikoimaa.
Tavoite on laaja ja monipuolinen, tarkkaan harkittu valikoima, ei pieni aloitusvalikoima.
Painotukset: laatu, käyttötarkoitus, hintaluokat, kate, toimittajan saatavuus ja toimitusajat.
Mahdollisia ryhmiä: seksilelut eri käyttäjille ja pareille, liukuvoiteet ja hoitotuotteet, asut ja alusvaatteet, BDSM ja aistileikit, HEHKU INTIME.
Tuotteiden/hintojen/kuvien/saatavuuden ylläpito lisätään myöhemmin oikeiden tuotteiden yhteydessä.
Seuraava keskustelu aloitetaan tästä hyväksytystä tilanteesta. Käyttäjä halusi lopettaa tältä erää.
