# TERRA07: nearby lanes + outdoor worker mode

## What changed (9 October 2026)

This release edits the user-provided `TERRA07-LOCALHOST(3).zip`. It does NOT replace the established TERRA07 visual layout.

### Heat / mapping

- Earth starts in **Local detail** centered on Indore until a search or GPS permission picks a specific position.
- The initial map no longer makes the large 231-point world temperature-grid request or draws atmospheric color waves across continents.
- The OSM layer requests a small 650 m-radius candidate region via Overpass and selects **at most four distinct nearby roads**, clipped to a roughly **450 m radius**. Original OpenStreetMap road geometry is used, never invented lines.
- Bright colored line overlays hug the chosen road geometries; an unavailable OSM feed leaves the real map visible and reports unavailable roads. Named roads appear by their source name, unnamed paths by their mapped highway class.
- The current weather is fetched as **one local Open-Meteo point**. Every highlighted lane gets the SAME model-estimated nearby temperature. This is scientifically honest: one regional weather field cannot justify four different street thermometers.
- The forecast scrubber uses nearby hourly Open-Meteo forecasts. If a frame is unavailable, road estimates go neutral instead of repeating current heat as if it were a forecast.
- The 3D Earth button remains accessible but has **no globe-wide heat wash**. Satellite imagery/terrain are lazy-loaded only after selecting 3D Earth.
- TERRA07 weather results and official warning requests run independently, reducing time to first usable weather reading.
- Cool Routes renders the mapped paths without the previous full-viewport heat-wave overlay.

### Outdoor work

- The existing **My location** button now toggles opt-in foreground continuous tracking; it is not silently enabled.
- The extra **Outdoor worker mode** panel is in the original Earth card. It provides: start/end shift, elapsed-time clock, rest/resume, 20/30/45/60 minute check-ins, optionally browser notifications (requiring explicit permission), GPS accuracy/last fix, follow-location toggle, and a simple worksite shade/water/buddy checklist.
- GPS location is used by map/weather requests when needed; location history is not saved by the app or silently shared with contacts.
- Weather and nearby geometry are refreshed only after meaningful movement/time; the blue worker beacon moves with available GPS fixes.
- The location watcher and shift state persist across TERRA07 page navigation while the app tab is active. Browser `watchPosition` is still **foreground/session-based**: browser suspension and screen lock can interrupt tracking and reminders. This is not a native continuous-background GPS product.
- No app feature diagnoses heat illness, predicts an individual's exact illness temperature, substitutes for local safety protocols, or suppresses official IMD/NDMA alerts.
- For suspected severe heat illness (confusion, collapse, seizures), seek emergency care immediately; India emergency number 112.

### Scope & uncertainties

Real OSM lane detail depends on Overpass availability and local OSM completeness. Traffic lanes inside one road may not be separately mapped. The displayed ways are the nearest distinct mapped road/footway corridors, NOT dynamically discovered physical lane boundaries. There is **no measured shade**, calibrated street sensor grid, individualized medical model, emergency dispatch, workplace compliance certification, native background geofencing, or verified indoor/outdoor worker tracking.

Satellite imagery and terrain need online map access. Google Maps keys are not required. External map services may rate-limit requests, so the interface keeps ordinary map view and clearly reports missing road overlays.

## Run

Windows: extract the ZIP, then double-click `START-TERRA07.bat`. Open `http://localhost:3000`. Allow location access only when using My location or starting a worker shift. Keep the terminal open.

Test after installation:

```powershell
npx pnpm@11.25.0 qa
npx pnpm@11.25.0 test:pure
npx pnpm@11.25.0 test:focus
npx pnpm@11.25.0 typecheck
npx pnpm@11.25.0 build
```

`pnpm-workspace.yaml` uses pnpm 11 `allowBuilds` to authorize build scripts for `esbuild` and `sharp`, leaving protections for all other dependencies in place.
