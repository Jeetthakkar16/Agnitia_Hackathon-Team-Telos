# AAVRA v13 — The user-supplied SAAYA v10 app, updated

This package is based **directly on the uploaded `SAAYA-V10-SIMPLE-MOBILE-ANDROID-IOS-FULL-SOURCE (1).zip`**, not the separate AAVRA static demonstration previously delivered.

## Windows: Start here

1. Extract the entire ZIP (do not run from inside the ZIP).
2. Open the `AAVRA-V13-SAAYA-V10-INTEGRATED` folder.
3. Double-click **START-AAVRA.bat**.
4. Install Node.js 22+ first if necessary. The first start requires internet to download the Next.js packages; subsequent starts reuse `node_modules`.
5. Visit `http://127.0.0.1:3010/welcome` if the browser did not open. Choose a profession and place, or select the optional account flow.
6. On **Today**, check the original SAAYA weather and heat guidance. On **My day**, use **Before you go** to evaluate a planned activity using **SAAYA Core**. Select **Demo scenario** to show a clearly labelled synthetic example without the live forecast provider. See **Map** for the original 3D thermal/geographical map and a separate compact HUD. See **More** for occupation tools and settings.

The old launcher `START-SAAYA.bat` remains solely for compatibility. Prefer `START-AAVRA.bat`.

## What changed

- Product identity updated to **AAVRA**, with visible **Powered by SAAYA Core** branding.
- Main experience continues to use the original SAAYA v10 Next.js mobile application, map and role-aware screens.
- Brought over the v11 light/dark toggle, optional companion, local planner, animated environmental mood, compass and astronomical sun-time HUD.
- Integrated the **actual SAAYA Core evaluation engine** (portable JavaScript modules) under `lib/saaya-core`, rather than presenting a hardcoded demo result.
- Created `POST /api/saaya/evaluate` and `GET /api/saaya/forecast`, supporting live Open-Meteo forecasts and **explicitly labelled synthetic demo mode**. Responses include flags, period comparisons, reasons, timestamps, source labels and limitations.
- Integrated SAAYA Core into the v10 **My day** tab with an activity planner: walking, running, cycling, outdoor events and field work. Marine professions keep their marine tools rather than receiving a misleading land-work safety assessment.
- Added `public/saaya-client.js` as a light developer integration client, with the Chromium `fetch` binding bug already corrected.
- Added quick access from Today to plan evaluation and save evaluated plans locally.
- Original existing profile setup, optional account flow, 21 roles, privacy choices, routes, ocean tools, 3D map and native wrapper configuration retained. Theme and density improvements are layered through `app/aavra-v13.css`.
- Updated app icon and PWA cache name to avoid old UI assets.

## API example

```js
import { SaayaClient } from '/saaya-client.js';
const saaya = new SaayaClient({ baseUrl: '' });
const result = await saaya.evaluate({
  location: { latitude: 19.076, longitude: 72.878 },
  activity: 'running', startLocal: '2026-10-11T08:30',
  durationMinutes: 45, flexibilityMinutes: 120,
  intensity: 'moderate', mode: 'live'
});
console.log(result.assessment, result.provenance);
```

Dates and times must be within the provider's hourly forecast coverage **in the target location's local time**. `mode: 'demo'` uses **synthetic** data; it is not a forecast for the supplied coordinates. This API is for prototyping; it has no tenant isolation, usage quota, auth or production SLA.

## Validation completed in this workspace

- Reused SAAYA v6–v10 guidance/occupation/action/mobile regression checks **PASS**.
- SAAYA Core additional automated integration/regression tests **9/9 PASS**.
- Existing source QA script **PASS**.
- TypeScript/TSX/JS source syntax parsed using the TypeScript compiler: **no syntax diagnostics**.
- CSS file parsed: **no stylesheet syntax errors**.
- ZIP CRC/integrity checked on output.

**Not validated here:** Full `next build`, `tsc` resolution with installed dependencies, rendered browser QA of the Next.js UI, actual forecast-provider internet response, physical Android/iOS build or public HTTPS deployment. The environment cannot reach the npm registry, so a functioning Next.js runtime could not be installed here. Do not describe this as a fully tested production app.

## Important boundaries

- Browser reminders are not guaranteed when the web app is closed; native reminders require a real Capacitor build and configuration.
- Optional Supabase sign-in needs valid environment keys. Without them, use persistent guest mode.
- No validated wearable measurements, autonomous medical diagnosis, or official marine departure clearance.
- The map uses existing v10 providers and model-based regions, not a thermal camera or guaranteed street temperature.
- SAAYA Core prototype screening thresholds are **not validated** personalised medical or occupational limits, and do not ingest official warnings. Existing v10 warning systems are separate.
- The newly added SAAYA activity planner is English-first. Previous v10 core localisation is retained for supported main-screen content.
- The project requires a deployed HTTPS Next.js server for a working native remote WebView; native shells do not embed the server API.
- For a public deployment use `npm run build` and secure provider access, source licences, server monitoring and rate limits. Cloud hosting credentials have not been supplied, so **no public deployment has been made**.
