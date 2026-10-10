# SAAYA v8 — Reliability & Workday Experience Fix

**This version fixes the issues visible in the screenshots of v7.** It is a source-code release and is not claimed as a verified Android/iOS binary or production deployment.

## Windows quick start

1. Extract this ZIP fully. Open `SAAYA-MOBILE`.
2. Double-click `START-SAAYA.bat` (Node.js 22+ and Internet required on first run).
3. Visit http://localhost:3010/welcome for onboarding; existing users use http://localhost:3010/.
4. In the dashboard choose your occupation and actual location. Open `My plan` for specific work guidance; construction/outdoor/farming roles can access Workday Toolkit.
5. Run `TEST-SAAYA.bat` for focused checks, `VERIFY-BUILD.bat` for a production build on a machine with installed dependencies.

## Key fixes

- Guidance now tries the weather fallback when the 7-day provider fails; **fallback air temperature is not mislabeled as feels-like** and cannot be used as a validated occupational safety assessment.
- MET Norway fallback now supplies available future hourly samples for the worksite planner; it still has no farm reference evapotranspiration, measured on-site WBGT or official risk clearance.
- Workday Toolkit reuses the user-selected location; GPS can explicitly be saved to the SAAYA profile for cross-screen reuse. The Indore coordinate is clearly a demo place until the user selects an actual area or starts GPS.
- Better source, timestamp, live refresh and provider failure messages.
- Daylight tool says Nighttime after sunset, rather than showing an unexplained negative solar angle; the next approximate daylight uses **device time zone**, not a verified location civil time zone.
- Four common workday tools first; additional tools expand on demand, with improved phone layouts, touch sizes and contrast-aware styling.
- More compact guidance home with source-aware display even if only air temperature is available.
- No invented farm moisture, irrigation decisions, location-level risk measurements, shade guarantee, vessel conditions, or medical advice.

## Validation and constraints

`npm run test:v8`, `npm run test:occupation`, `npm run test:guidance`, `npm run test:toolkit`, `npm run qa`.

Full dependency installation, actual Next.js production build, browser end-to-end tests and installed-device testing could not be completed in the packaging environment. The above tests are **logic/source checks**, not proof of production readiness. See `SAAYA_V8_FIX_REPORT.md` for known issues and priorities.

Occupation research and data-source citations remain in `OCCUPATION_RESEARCH.md` and `DATA_SOURCES.md`.
