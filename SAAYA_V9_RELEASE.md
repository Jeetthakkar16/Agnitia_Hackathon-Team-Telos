# SAAYA 9.0 — Everyday Action & Safety Companion

**Status:** Source release with passing tests. Not claimed to be production-ready, a medical device, a certified weather-warning service, or a clinical AI.

## Main changes from v8

- Simplified occupation onboarding: **2 essentials steps** (occupation and location/alerts) with collapsible role groups. Optional health survey remains separate.
- **21 occupation profiles**, adding sports/fitness and driver/commuter to the original 19.
- Common personal dashboard for all occupations (including maritime roles). Today's focus: short, actionable glass-style **SAAYA action card**, a few temperature readings, then detailed plans and specialist tools on demand.
- **In-app guidance instead of external reading links** on the rebuilt primary journeys. Rules adapt to occupation, forecast availability, modeled apparent temperature, forecast UV where available, and official-alert matching. Model thresholds are illustrative planning bands, **not medical thresholds or official heatwave declarations**.
- Emergency-appropriate symptom selector: self-report only, never automatic medical diagnosis.
- Stronger foreground warning UX: glass alert bar with primary action and expanded detail. Local notifications are permission-based and only reliably checked while the app is visible. Alert notifications depend on weather/official-feed availability.
- Optional sound and browser vibration test; support depends on OS/browser and user interaction.
- New **Marine compass** (device motion sensor heading where available), model-based sea/wind summary with sea-grid distance guard, and cautionary navigation messaging.
- **Watch module**: optional live BLE Heart Rate GATT where supported and the sensor advertises standard heart-rate service; manual readings from a validated BP cuff; basic AHA-derived education for very high readings. Does not claim Apple Watch, HealthKit, Health Connect, BP prediction, or physiological diagnosis.
- **Camera visual inspector**: requests camera permission when tapped, displays unrecorded camera preview, provides **no invented infrared/°C measurement**. Actual radiometric thermal imaging requires calibrated hardware and compatible SDK.
- Install-app action under Preferences; browser PWA installation where supported, not native store distribution.
- Corrected permissions policy to allow on-origin camera, device motion, location and Bluetooth requests where platforms support them. Microphone remains disabled.
- More defensive text wrapping, sizes, status banner position, mobile tabs, dark-theme tool styling, and service worker cache `saaya-mobile-v9`.
- Optional Supabase sign-in page via OTP email or compatible token-fragment redirect; guest mode works without credentials. **No account-backed server data service has been constructed**, no protected personal records are synchronized.

## Hard boundaries (intentionally no fabricated features)

1. A standard camera cannot measure objects' absolute temperatures. Thermal image capture + accurate Celsius needs a calibrated IR sensor/SDK, permissions, radiometric calibration, and validation.
2. Consumer smartwatch HR/BP cannot reliably diagnose or forecast heatstroke, hypertension or medical conditions. High/low HR alone is ambiguous. BLE standards are not supported by every watch or browser.
3. No global official weather alert coverage. India's IMD/NDMA feeds are implemented with limitations; official sources for Middle Eastern countries must be licensed/integrated country by country.
4. Regional model air temperature/feels-like is *not* street-level temperature, workplace WBGT, engine-room temperature, soil temperature, or vessel weather observations.
5. No claim a particular route is cooler without validated local evidence. No blanket 'good day to drive' clearance.
6. Background alarms are **not guaranteed** after a browser/PWA is suspended. Dependable persistent push needs production push infrastructure, user permission, country coverage, retries, high-quality geospatial warning matching, and native device validation.
7. No medically perfect autonomous diagnostic guide. The current rules are transparent, auditable, sourced, and need professional medical review before clinical use.

## How to run (Windows)

Extract ZIP -> `SAAYA-MOBILE` -> double-click `START-SAAYA.bat`. First run requires internet to download dependencies. App on http://localhost:3010/welcome (or /login for email login, / for existing local profile). 

`TEST-SAAYA.bat` runs source/regression tests; `VERIFY-BUILD.bat` checks actual typecheck and production build **on your computer**. No production build was verified here because dependency installation stalled. Manual visual tests on Android, iOS, desktop and light/dark theme are still required.

## Required real-device QA

1. iPhone Safari (normal + added home-screen PWA) and Chrome Android: 320px, 360px, 390px, 430px widths; enlarged 200% text; both themes; scrolling and no obscured footer.
2. Signup/guest, role switch land -> ocean -> sports -> government, alerts on/off, permission rejection, inaccurate GPS, unavailable provider and timezone change.
3. Camera start, camera denied, camera stop, background/unmount stream teardown.
4. Compatible BLE HR sensor and unsupported smartwatch; verify real reading only and disconnect, BP educational prompts and no phantom HR.
5. Compass with and without magnetometer, iOS permission prompt, true/magnetic heading limits, no navigation claims.
6. Clear and stale official warnings; dry forecast; >40C feels-like; unreadable feeds; heat illness emergency wording. Test alarms on Android and iOS including app in background; note unsupported behaviors.
7. Check screen-reader traversal, large tap targets and reduced-motion support.

## Architecture

`lib/situation-engine.ts` single deterministic action layer. `components/situation-companion.tsx` short guidance card. `components/heat-alert-center.tsx` on-screen alert UI + optional local notification. `components/saaya-tools.tsx` camera, compass, BLE HR and manual cuff readings. `components/sea-quick-brief.tsx` sea model snapshot. `components/saaya-login.tsx` optional auth, guest sign-in. Original Earth/Marine/Climate/maps, role workspace, farmers' farms and scientific honesty logic retained.

## Source baselines

- WHO 2026 Heat & Health and #KeepCool guidance: prevention, cooling, urgent heatstroke escalation.
- OSHA Heat Exposure + Water.Rest.Shade: water, cool breaks, acclimatization and on-site WBGT limitations.
- American Heart Association blood-pressure emergency guidance for validated cuff readings, including >180 systolic and/or >120 diastolic and symptoms.
- MDN Web Bluetooth requestDevice support and HTTPS restrictions.
- Existing FAO-based illustrative crop-water guidance, IMD/NDMA feeds and Open-Meteo data adapters remain subject to original source and license limitations.

For references see project data-source and medical governance documentation. Additional independent healthcare review and ongoing source update are prerequisites for real clinical claims.
