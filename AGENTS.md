# Website editing

Work locally in this folder. The user reviews Swedish first. Every change must also be reflected in English during the same task.

- `page-template.html` is the shared page source, with Swedish text and shared club information.
- `styles.css` controls both language versions.
- `build.ps1` contains English translations and generates `index.html` (Swedish) and `en.html` (English). Run it after each content change. Update translation keys and English text when Swedish copy changes; add translations for new copy.
- Do not edit the generated pages directly. Check both outputs after generation, including new text, section links, and language links.
- Keep club names, addresses, email addresses, and phone numbers identical in both versions.
- User-provided images are in `bilder/`. Choose images as part of requested design changes.
- Do not publish during local review unless requested.
- `index-original.html`, `en-original.html`, `styles-original.css`, `page-template-original.html`, and `build-original.ps1` are the frozen original snapshot; preserve them.
- Three design studies use `design-variants.css` and `build-variants.ps1`. `build.ps1` also regenerates all six variant pages. Never edit those generated pages directly. Language switches stay within each design.
- `bilder/karate-hero-original.png` preserves the approved transparent, color-corrected portrait. Keep it unchanged. The Nordic hero layers `karate-hero.png` over `dojo-background.png` within the content width.
