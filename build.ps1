$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$utf8 = [System.Text.UTF8Encoding]::new($false)
$template = [IO.File]::ReadAllText((Join-Path $root 'page-template.html'))
$translations = [ordered]@{
    'Vår Hombu Dojo på Irland' = 'Our Hombu Dojo in Ireland'
    'HDKI är en internationell gemenskap som bygger på respekt, rättvisa och strävan efter högsta kvalitet. Med styrka från våra gemensamma traditioner formar vi en livskraftig, hållbar och nytänkande generation av framtidens karateutövare. Vi finns i 30 länder.' = 'The HDKI is an international community built on respect, fairness and excellence. We draw strength from our combined traditions to build a vibrant, sustainable and innovative generation of future karate-ka. We are present in 30 countries.'
    'HDKI Sweden · Karate & gemenskap' = 'HDKI Sweden · Karate & community'
    'HDKI Sweden – tradition, innovation, respekt och samarbete. Hitta din karateklubb och ta kontakt för att veta mer om träningen.' = 'HDKI Sweden – tradition, innovation, respect and collaboration. Find your karate club and get in touch to learn more about training.'
    'Hoppa till innehållet' = 'Skip to content'
    'Våra klubbar i Sverige:' = 'Our clubs in Sweden:'
    'Klubbens hemsida' = 'Club website'
    'Kontakta klubben' = 'Contact the club'
    'Hitta hit' = 'Directions'
}
$english = $template.Replace('<html lang="sv">', '<html lang="en">')
foreach ($item in $translations.GetEnumerator()) {
    if (-not $english.Contains($item.Key)) { throw "Missing translation source: $($item.Key)" }
    $english = $english.Replace($item.Key, $item.Value)
}
$swedish = $template.Replace('{{sv-current}}', ' aria-current="page"').Replace('{{en-current}}', '')
$english = $english.Replace('{{sv-current}}', '').Replace('{{en-current}}', ' aria-current="page"')
[IO.File]::WriteAllText((Join-Path $root 'index.html'), $swedish, $utf8)
[IO.File]::WriteAllText((Join-Path $root 'en.html'), $english, $utf8)
Write-Output 'Updated index.html (Swedish) and en.html (English).'
& (Join-Path $root 'build-variants.ps1')
