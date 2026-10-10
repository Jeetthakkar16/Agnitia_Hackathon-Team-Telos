> **Historical v3.2 UI incident reference only. Current version: TERRA07 4.0, see `START_HERE.md`.**

# TERRA07 Platform v3.2 — Ocean / Climate layout + stale server fix

## What was wrong?
Previous v3.0 supplied component class names such as `.pPage`, `.pHeroGrid` and `.pMapCard` without their CSS. The v3.1 CSS exists, but the v3.0 app or old cached Next assets could still be served by the localhost:3000 server/PWA. The screenshot matches the old `Environmental intelligence` header, not v3.1. A screenshot alone cannot establish which server or cache was responsible.

## What is now different?
- Fresh **port 3009** and single Windows launcher; no chance of accidentally using the port-3000 app when following the launch instructions.
- Separate `app/platform.css` imported from `app/layout.tsx` so all Ocean/Climate p* dashboard rules are explicitly loaded.
- Visible **v3.2** badge and `/api/version` diagnostic endpoint.
- Local development automatically unregisters the old TERRA07 service worker and deletes only TERRA07 caches for the current origin.
- Production service worker does not cache compiled Next assets or current marine/weather/API data, and navigations are network-first.
- Three-mode top switcher, source-honest data labels, and previous Earth behavior preserved.

## Windows
Extract this ZIP to a **new folder**, not over v3.0 or v3.1.
Double click `START-TERRA07.bat`. Open `http://localhost:3009/ocean` and `http://localhost:3009/climate`.
To verify correct version: open `http://localhost:3009/api/version` and check `"version":"3.2.0"`.
If `http://localhost:3000` remains open, that is the old app; please use port 3009.

## Caution
Source static tests and CSS parser checks do not replace running a real production Next.js build/browser acceptance test. Installing dependencies requires working npm registry connectivity. Do not treat absent marine/climate provider data as a valid forecast.
