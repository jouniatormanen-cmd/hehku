# HEHKU – tuotetietojen hallinnan suunnitelma (luonnos 18.10.2026)

## Tavoite
HEHKUn valikoima voidaan kasvattaa noin 500 tuotteeseen ilman jokaisen tuotesivun käsin ohjelmointia. Nykyinen julkaistu sivusto ja testikassa säilyvät toistaiseksi ennallaan.

## Ehdotettu rakenne
- `data/tuotteet.json`: tuoteluettelo ja vain hyväksytyt, julkaistavat tuotetiedot.
- `tuote.html?id=TUOTETUNNUS`: yksi yhteinen tuotesivupohja, joka lukee tuotetiedot luettelosta (toteutetaan myöhemmin).
- Etusivun tuoteluettelo lukee saman datan (toteutetaan myöhemmin).
- Tuotteille yksilöllinen, pysyvä tunnus; ei riippuvuutta listan järjestysnumerosta.
- Demotuotteet pidetään erillään todellisista tuotteista.

## Tuotetiedot
Pakolliset kentät: `id`, `nimi`, `kategoria`, `tila` (`luonnos` / `julkaistu`), `on_demo`.
Kun oikea tuote julkaistaan, tarvitaan lisäksi varmennetut `hinta_eur`, `valuutta`, `kuva_url`, `kuvaus` ja tuotekohtaiset turvallisuus- ja käyttöohjeet.
Mahdollisia lisäkenttiä: `tuotemerkki`, `toimittajan_tuotekoodi`, `ean`, `materiaali`, `mitat`, `varastotila`, `toimitusaika`, `toimittaja`, `päivitetty`.

## Periaatteet
1. Ei julkaista keksittyjä teknisiä tietoja, varastosaldoja, toimitusaikoja tai asiakasarvioita.
2. Tavarantoimittajan kuvat ja tekstit otetaan käyttöön vasta käyttöoikeuksien ja ehtojen varmistamisen jälkeen.
3. Saatavuus ja hinnat perustuvat vahvistettuun tietolähteeseen; tarvittaessa päivitys automatisoidaan myöhemmin.
4. Demo-ostoskori ja testikassa eivät kerää henkilötietoja eivätkä vastaanota maksuja.
5. Toteutetaan muutokset vaiheittain, jotta nykyinen mobiiliversio pysyy toimivana.

## Seuraava toteutusvaihe
Laaditaan oikea `data/tuotteet.json` -malli nykyisistä kuudesta selvästi kuvitteellisesta testituotteesta. Testataan lukeminen ensin erillisessä kehitysversiossa ennen etusivun tai tuotesivun muuttamista.
