# Prior SAAYA release notes (v5.x)

**This file describes an earlier version. For the current occupation intelligence v7.0 release, read [START_HERE.md](START_HERE.md), [SAAYA_V7_RELEASE.md](SAAYA_V7_RELEASE.md), and [OCCUPATION_RESEARCH.md](OCCUPATION_RESEARCH.md).**

---

# SAAYA Mobile v5.0 — TERRA07 continuation

A focused, mobile-first environmental app with separate Earth, Ocean and Climate roles.

## Local development (Windows)

1. Install Node.js 22+ and ensure internet access for initial dependencies.
2. Double-click `START-SAAYA.bat`.
3. Open `http://localhost:3010/welcome`.
4. Sign-up is optional. Continue privately, select your occupation, concerns and location, then enter the relevant mode.

## What changed

- SAAYA branding and mobile iOS/Android-style responsive UI.
- Full-screen welcome and a truthful optional sign-up gateway.
- Existing occupation survey and occupation-aware domain selection.
- Each main route is a compact 3D MapLibre globe with live-on-request public API forecasts and a weather-model-based color layer.
- Earth: Open-Meteo weather, official warning connectors, original street-only map geometry.
- Ocean: Open-Meteo marine and wind; wave/current cards and marine warnings link.
- Climate: Open-Meteo CMIP model-year scenarios and NOAA ENSO observations.
- New thermal blanket is generated in a browser canvas from gridded model readings; missing corner samples remain transparent.
- Original maps and contour lines remain. Selected street colors are a regional estimate, not true measured lane temperatures.
- App automatically checks providers periodically when open; API caching still defines actual source freshness.

## What is not yet production-ready

- Live provider and map browser integration could not be tested in this build environment.
- Full `next build` and TypeScript typecheck still require dependencies to be installed.
- Email signup only works if Supabase project URL and public anon key are supplied in `.env.local`. Guest usage needs no account. Do not claim guest data is synchronized across phones.
- Android/iOS store binaries are not built or signed. Capacitor remains a wrapper starter that requires a deployed HTTPS server.
- No background alert or always-on background location monitoring is promised. Browser notifications need permission and an open app.
- The app is not a certified navigation or medical warning system. Official warnings take priority.

## Verifying on your device

1. Run `npm run typecheck`, `npm run build`, and available regression checks after dependencies install.
2. Test each occupation and verify users cannot enter unrelated routes.
3. Test Earth/Ocean/Climate globe, contours, heat blanket, light and dark modes on mobile widths 320–430px.
4. Disconnect the network and confirm no fake temperatures, alerts or colors appear.
5. Verify native/signed Android/iOS builds separately.

## Public hosting

Deploy the Next.js project to Vercel (import project, framework Next.js); set `.env.local` variables as hosting environment variables. Live publication requires your hosting account authorization and successful build.

## Design

The name SAAYA evokes shade and protection. The brand graphic is a custom sun-and-shadow mark. The design uses fluid rounded panels and system-native typography. Data-model raster opacity is intentionally restrained and never overrides labels or streets.
