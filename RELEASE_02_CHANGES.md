# Release 02 — Unified Earth / variable nearby streets / installable app

**Base:** locked Checkpoint 01 (`ec4f2031…`). Existing user-approved design is preserved.

## Requested functional differences
- Removed the separate **Local detail method** and its two-mode Earth/local switch.
- A single MapLibre WebGL Earth is used. Open at selected location with 3D tilt and road heat overlays visible. Use `View whole 3D Earth` to zoom out and `Focus nearby streets` to return, without changing map renderer/layer logic.
- Only authentic OSM road/foot-route line geometry is colored; no square, polygon, regional heat blur, or globe-wide area heat is drawn.
- Road count is **data-driven**, not fixed at 4 or 6. Roads beyond 450 m are excluded. To reduce clutter, at most 18 real nearby distinct corridors are shown. Sparse locations can display 0, 1 or 2 if that is all the data supports.
- First query the already loaded OpenFreeMap vector road tiles. Overpass is a non-blocking progressive fallback, not a prerequisite to the first useful frame.
- Temperature palette is fixed to an absolute Celsius scale: low blue/cyan, intermediate green/yellow/orange, high red/crimson. Missing weather data results in grey/unavailable lanes.
- With a single regional weather-model estimate nearby roads legitimately have **the same temperature/color**. The UI never pretends otherwise.
- Existing worker GPS and shift workflow preserved, including user opt-in and foreground-only limitations.

## Downloadable application
- Installable PWA via Chrome/Edge (Android / Windows / desktop) or Safari Add to Home Screen (iOS), with install affordance, updated manifest and raster icons.
- The web application and its Next.js API must be served on localhost or HTTPS (not file://); internet is required for live weather, map tiles and routes.
- Companion `../android/` Android Studio WebView shell from the prior package is included as source for a native APK/AAB **after configuring a real HTTPS deployment**. No APK, AAB, Google OAuth credentials, signing keys or fake live API keys are included.

## Validation
See `RELEASE_02_VALIDATION.md`. Full dependency-aware `next build`, real provider access, physical-device and browser tests remain required before production or app-store submission.
