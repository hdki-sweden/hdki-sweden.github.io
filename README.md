# HDKI Sweden

Första utkast till en fristående, statisk förstasida för GitHub Pages.
Öppna index.html i en webbläsare för att se sidan. Ingen installation eller byggprocess behövs.

## Publicera på GitHub Pages

1. Skapa ett offentligt repository, exempelvis hdki-sweden.
2. Lägg index.html och .nojekyll i repositoryts rot på grenen main.
3. Öppna Settings → Pages → Build and deployment.
4. Välj Deploy from a branch, grenen main och mappen / (root). Spara.
5. GitHub visar webbplatsens adress när publiceringen är klar.

Lägg till den nya domänen under Settings → Pages → Custom domain först när domänen har registrerats och dess DNS ska konfigureras. Någon CNAME-fil för en oregistrerad domän ingår inte.

## Innehåll att granska

Klubbnamn och kontaktuppgifter kommer från https://hdki.se/ (hämtade 1 november 2026). Layout och inledning är nya. Gatunamnet Husieväge har normaliserats till Husievägen och postnummer har formaterats. Kontrollera adressen före lansering.

Viktigt: bekräfta särskilt att e-postadresser på hdki.se fortfarande är under klubbarnas kontroll. Domänen är enligt beställaren inte längre föreningens. Inga nya e-postadresser har hittats på.

Extern länk- och kontaktfunktion har inte verifierats mot mottagarna. Facebooklänkar, kalender, WordPress-funktioner och trasiga bilder har inte förts över i detta första utkast.

HDKI-ordmärket med cirkeln är en tillfällig typografisk utformning, inte en återgiven officiell logotyp. Byt till föreningens riktiga logotyp när den finns tillgänglig.

Sidan använder lokala systemtypsnitt, har inga externa bildberoenden, inga spårningsskript och ingen databas. All layout finns i index.html.
