# TERRA07 reconstruction report

Date: 9 October 2026

## Why this is a reconstruction

The original `/workspace/scratch/.../heatlens-project` repository described in the handoff was not mounted in this conversation and could not be recovered from the accessible Library/Drive. The uploaded full chat and the 9 October handoff were therefore treated as the product specification, and a fresh source tree was generated without claiming byte-for-byte continuity with the historical commit.

## Delivered system

The reconstruction includes:

- Next.js/React/TypeScript multi-page web application.
- Immersive MapLibre globe with terrain/hillshade and mapped-building context.
- Live weather with primary/fallback provider handling and stale-reading rejection.
- Five-point regional sampling plus IDW estimates applied to real OSM roads.
- Close-zoom minor-road/lane loading and current-street selection.
- Search suggestions plus independent submitted search and reverse geocoding.
- Device/native live location abstraction.
- ECMWF AIFS advanced forecast adapter.
- IMD district heat warning and NDMA SACHET official-alert adapters.
- Optional Heat Safety Profile and explainable conservative personal guidance.
- Fixed/source-versioned public-health content registry with fluid-restriction protection.
- Emergency heat workflow and India 112 link.
- Real walking-route comparison using the OSM foot-routing graph, ranked by time outdoors until verified shade exists.
- City Action map, OSM building/green proxies, transparent partial planning index and field-verification queue.
- PWA manifest/service worker without prohibited OSM tile prefetching.
- Capacitor location/local/push notification integration boundaries.
- D1 profile schema, profile Worker and alert-audit Worker scaffold.
- Architecture, data-source, governance, privacy, dependencies, validation and runbook documentation.

## Hardening fixes made during final validation

- Missing weather estimates render roads neutrally instead of inheriting the lowest heat colour.
- MET Norway fallback is explicitly air-temperature fallback; it is not mislabeled provider-native feels-like temperature.
- Forecast peak falls back to the primary weather hourly feed if AIFS is unavailable.
- Route-provider failure is surfaced to the user rather than looking like an empty successful route.
- Default profile answers use unsure/prefer-not-to-say states instead of silently assuming a healthy adult.
- All Learn-page public-health wording now comes from the controlled source-versioned registry.
- WHO source dates were checked for the October 2024 heatwave Q&A and May/June 2026 hot-weather guidance.
- Pure logic regression tests were made reproducible as `pnpm test:pure`.

## Validation completed here

- `node scripts/qa.mjs` — PASS.
- `node scripts/test-pure.mjs` — PASS.
- TypeScript parser pass — 50 TS/TSX files, zero syntax diagnostics.
- NPM registry connectivity test — blocked in this sandbox with DNS `EAI_AGAIN`, so dependency installation and a real Next production build cannot truthfully be marked passed here.

## Explicitly incomplete rather than fabricated

The following require external data, credentials, professional review or physical devices and remain visible integration boundaries:

- Satellite LST/NDVI/canopy processing.
- Authoritative ward/street demographic vulnerability.
- Verified shade coverage and shadow modelling.
- Local IoT sensor calibration and empirical street-temperature validation.
- Verified cooling-centre operational status/capacity.
- Quantified intervention impact.
- Production FCM/APNs background push, geofencing and delivery receipts.
- Real Android/iOS signing and physical-device QA.
- Authenticated cloud health-profile deployment.
- Licensed medical/public-health approval and reviewed translations.

These omissions are intentional: TERRA07 must show unavailable/not connected instead of manufacturing values.
