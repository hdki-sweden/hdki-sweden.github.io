$ErrorActionPreference = 'Stop'
$utf8 = [Text.UTF8Encoding]::new($false)
foreach ($language in @('sv','en')) {
    $source = if ($language -eq 'sv') { 'index.html' } else { 'en.html' }
    $page = [IO.File]::ReadAllText((Join-Path $PSScriptRoot $source))
    for ($i = 1; $i -le 3; $i++) {
        $html = $page.Replace('</head>', '<link rel="stylesheet" href="design-variants.css"></head>').Replace('<body>', '<body class="variant-' + $i + '">')
        $switch = [regex]::Match($html,'<div class="wrap top-language">.*?</div>').Value
        $header = '<header class="wrap design-header"><a class="design-brand" href="#innehall"><img src="bilder/HDKI-logo-ren.jpg" alt="" width="44" height="44"><span>HDKI SWEDEN</span></a>' + $switch + '</header>'
        if ($i -eq 1) {
            $about = [regex]::Match($html,'<section class="about">.*?</section>').Value
            $hombu = [regex]::Match($html,'<div class="hombu-link">.*?</div></div>').Value
            $header = '<header class="wrap design-header"><a class="design-brand" href="#innehall" aria-label="HDKI Sweden"><img src="bilder/cropped-HDKI_Flagga_SWEDEN_1000px.jpg" alt="HDKI Sweden" width="1000" height="1182"></a><div class="header-description">' + $about + '</div>' + $switch + '</header>'
            $html = $html.Replace($about,'').Replace($hombu,'')
            $heroAlt = if ($language -eq 'sv') { 'Karateutövare i vit dräkt och svart bälte' } else { 'Karate practitioner in a white gi and black belt' }
            $heroImage = '<img class="hero-portrait" src="bilder/karate-hero.png" alt="' + $heroAlt + '" width="1537" height="1023" fetchpriority="high">'
            $html = [regex]::Replace($html,'<img class="hero-logo"[^>]*>', $heroImage)
            $scrolls = '<div class="dojo-scrolls" aria-hidden="true"><img class="dojo-scroll scroll-karatedo" src="bilder/karatedo-clean.png?v=2" alt=""><img class="dojo-scroll scroll-shuhari" src="bilder/shuhari-matched.png?v=3" alt=""></div>'
            $html = $html.Replace('<section class="hero" aria-label="HDKI Sweden"><div class="wrap">','<section class="hero dojo-scene wrap" aria-label="HDKI Sweden">' + $scrolls + '<div class="dojo-foreground">')
            $hombuAnchor = [regex]::Match($hombu,'<a .*?</a>').Value
            $html = [regex]::Replace($html,'(<h2 id="club-heading">.*?</h2></div>)(</div>)', '${1}<div class="clubs-hombu">' + $hombuAnchor + '</div>${2}')
        }
        $html = $html.Replace($switch,$header)
        $html = $html.Replace('href="index.html"', 'href="variant-' + $i + '-sv.html"').Replace('href="en.html"', 'href="variant-' + $i + '-en.html"')
        [IO.File]::WriteAllText((Join-Path $PSScriptRoot "variant-$i-$language.html"),$html,$utf8)
    }
}
Write-Output 'Updated all three design variants in Swedish and English.'
