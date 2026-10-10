# TERRA07 — Street-only isothermal rendering (10 October 2026)

## What changed

- **Only mapped roads receive thermal colors.** The visible heat overlay consists of MapLibre GeoJSON **line** layers, not filled polygons, heat circles, square cells, interpolated blobs, or satellite-wide temperature fields.
- The first street source is **OpenFreeMap's already-downloaded OpenStreetMap-derived vector transportation tiles** (`openmaptiles` / `transportation`). This bypasses the unreliable 7–14-second Overpass query when map vector tiles are available.
- If the vector street data is absent or incomplete, a separate Overpass query is attempted after a short delay. One feed failing does not crash the map or invent streets.
- The **four closest eligible mapped corridors** are selected and clipped to a roughly 450-metre neighbourhood around the search or tracked GPS point. Railways, far-away ways and motorway/construction ways are excluded.
- Streets are drawn with legible outlined lines, temperature color, line-following labels, click/tap details and an honest road count. A **Retry roads** control appears when mapping providers fail.
- Local Detail opens first. 3D Earth stays available, but **does not contain a large-area heat overlay**.
- The City Intelligence map uses the same street-only renderer. The small urban-evidence request footprint was reduced so it is not rejected for exceeding the API area guard.

## Accuracy and temperature interpretation

The street lines represent real mapped road geometry; the temperature comes from **the same nearby Open-Meteo or other identified model sample**, never directly from sensors on every lane. All four lanes can—and often should—show the same color. A relative ranking of "cooler street A vs hotter street B" cannot be inferred from one coarse weather-model value. Do **not** add invented temperature offsets by road type, tree cover, shadow, elevation, or random jitter.

The gradient (purple → blue → cyan → green → yellow → orange → red) maps a single °C value to color. It is an isothermal-style *road overlay*, not meteorological isotherm contour lines or an assertion of sub-street climate resolution. A dated and calibrated lane-specific dataset is required before differential street heat can be claimed.

## Key updated files

- `components/thermal-earth-map.tsx` — fast tiled-transportation geometry, fallback, line paint and popup
- `lib/vector-lanes.ts` — conversion of real MapLibre vector road features to selected clipped OSM-derived lanes
- `components/earth-experience.tsx` — lane legend/list and temperature clarity
- `components/city-action.tsx` — matching street-only interpretation
- `scripts/test-isothermal-roads.mjs` — smoke tests for real line geometry and no area heat paint

## How to verify on Windows

Run `START-TERRA07.bat`, open `http://localhost:3000`, ensure **Local detail** is selected, and search **Rajwada Palace, Indore**. Give the basemap a few seconds to retrieve its vector tiles. Check up to four colored line segments. Click a line to open the regional °C estimate and provenance. If road data is not available, TERRA07 should show a provider-unavailable state, not fabricate roads. Run `RUN-TESTS.bat` for project QA, pure logic, geometry and TypeScript checks.

A full Next.js build and network-dependent real road rendering require running on a machine with package access and live mapping services; this package has static and pure-logic validation only in the delivery environment.
