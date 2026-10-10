# TERRA07 v4.2 — Model-based isotherm overlays (2026-10-09)

- Retained the original Earth/Ocean/Climate map styles and provider configuration unchanged.
- Added removable `MapLibre` GeoJSON contour-line sources to all three map experiences.
- **Earth**: uses the existing sampled Open-Meteo global model grid to calculate temperature contours at globe scale. Street-only coloring remains unchanged and does not gain fake lane differences.
- **Ocean**: samples Open-Meteo marine-model sea-surface temperature across a region around the selected marine point; re-samples when the forecast-hour selection changes. Missing offshore values are not turned into 0°C.
- **Climate**: compares selected model annual mean temperature for 2025 and the future sample year over a nearby grid. Contours show *scenario differences*, not present weather or exact future outcomes.
- Added an On/Off button and loading/unavailable/no-gradient status for each overlay, always leaving the basemap visible.
- Added a dependency-free marching-squares contour builder with tests for gaps, uniform fields, and missing data.
- Uses separate model-grid samples and provider timestamps; contours are mathematical interpolation and not instrument-measured lines. Marine coastlines and climate projections need particular caution.
- Moved the localhost development port to 3009 and bumped the service-worker version to avoid loading old releases from the browser cache.
- No additional JS library dependencies.

**Verification:** All available source regression scripts and new contour tests pass. Full Next.js build, browser/map rendering and live-provider connectivity were not verifiable offline.

---

# Release log

## v4.1 — Crash repair, unauthorized map repair, simplified dashboards
- Restored required Earth experience-store imports.
- Replaced keyed CARTO tile style for Ocean/Climate with documented keyless OpenFreeMap. Added opt-in MapTiler browser key via .env.local.
- Fixed selected Ocean metric mismatch.
- Simplified copy, organized optional expert resources under expandable sections, polished map/card CSS.
- Isolated localhost on port 3008, updated PWA cache identity and version endpoint.
- Preserved the original CHECKPOINT 01 in checkpoints/, unchanged.

## v4.0 — Guided onboarding and three interconnected modes
See docs/FEATURE_STATUS_4_0.md and VALIDATION_4_0.md.

## 5.0 SAAYA Mobile (development release)

New branding, welcome/signup entry, role-based mode filtering, simplified mobile Earth/Ocean/Climate screens, 3D globes and a null-aware model thermal raster blanket. Earlier CHECKPOINT-01 remains included for reference. Not production-verified.
