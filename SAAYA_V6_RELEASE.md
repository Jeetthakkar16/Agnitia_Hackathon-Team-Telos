# SAAYA 6.0 — Guidance First (10 October 2026)

## The new job of the product

**Weather data → user context → interpretable conditions → specific suggested actions → source and uncertainty.** Unlike v5.1, the default `/` page no longer opens on a globe with a single temperature score. The first view is a task-oriented mobile dashboard with Today, My Plan, and Live Earth.

## Changes from uploaded SAAYA-MOBILE-v5.1

- New isolated mobile UI `components/guided-home.tsx`, styles `app/guidance.css` and entry page `app/page.tsx`; light and dark theme support, responsive layouts, reduced-motion preference, accessible controls.
- New typed deterministic environmental decision engine `lib/decision-engine.ts` for individuals, farmers, outside workers, delivery riders, government teams, healthcare workers and students. No generative medical or crop claims.
- New `/api/guidance` integration, using Open-Meteo current/7-day forecast values with explicit source, model time, statuses and missing values.
- Farm profiles saved only on this device (up to 10), with address or exact user-provided coordinate/GPS point, crop, growth stage, water category and optional area. 3D globe centers on chosen point; the field is **not** delineated or instrumented.
- Seven-day rain and **illustrative** crop ETc using crop-stage Kc, with a distinct short-range dry-spell *watch*. Does not label drought and cannot prescribe irrigation volumes.
- Government workspace with local readiness checklist (not a verified operations system), exportable plain-text planning brief and access to existing City Evidence tool.
- Official warning feed display on the new home includes provider-health labels and a clear no-all-clear warning. Existing warning adapters remain unchanged.
- Existing safety survey, walking routes, workday toolkit, city evidence, marine forecast and climate exploration are preserved. Users see work-relevant navigation. Role guard also limits legacy pages based on occupation.
- Previous bug where absence of personal weather data could result in a comfortable label was changed to `unknown`; missing Open-Meteo hourly numeric fields no longer automatically become 0°C.
- New dedicated Windows launch, check, build batch files; updated privacy and local-data deletion to include new SAAYA storage keys.

## Role-specific destinations

| Role | Homepage | Other allowed tools |
|---|---|---|
| Farmer | Local farm and crop planning | Safety survey, field toolkit, Learn |
| Outdoor worker | Outdoor workday | Safety, routes, field toolkit, Learn |
| Delivery rider | Outdoor journey | Safety, routes, Learn |
| Government | Heat-action readiness | City evidence, Learn |
| Healthcare | Heat-related community guidance | Safety, Learn |
| Student | Heat-aware school day | Safety, Learn |
| General | Everyday environmental decisions | Safety, routes, Learn |
| Fisher / sailor | Ocean forecast page | Dedicated marine mode |
| Researcher | Climate page | Dedicated climate mode |

## Product boundaries

- Mobile-first responsive web application / PWA, **not** a compiled native app.
- Government readiness checkmarks are local to one device, **not** shared records, deployed public alerts or official government approvals.
- Crop coefficients are published *typical* or approximate illustrative values; growth stages are user-selected; missing soil water, field sensors and effective rain preclude prescription.
- GPS pin can be accurate as a selected coordinate, but its associated weather is a regional grid forecast, not a point measurement.
- Real-time means *latest retrieved provider forecast*, not continuously observed per-second heat.
- Role rules are deterministic planning heuristics, **not machine-learned and not medically calibrated**.
- Sign-up remains optional; the inherited conditional Supabase email-OTP request is not full account session and server-profile management. Do not claim secure cloud synchronization.
- No push delivery guarantee while closed, no SMS escalation, no automatic emergency services call.
- No production deployment or full device/build verification was performed in this environment.

## Next engineering priorities (before user pilots / Stage C)

1. Full Next.js build and Android/iOS physical device UI and performance verification with installed npm dependencies.
2. Clinical/agronomic review and local calibration; crop-specific thresholds only after authoritative region- and variety-specific research.
3. Harden IMD/NDMA alert matching and freshness across districts; avoid false negatives.
4. Longer-term water stress using rainfall anomalies and soil moisture + in-situ observations; this release does **not** predict drought dates.
5. Weather-provider license/commercial suitability and production API quota/caching strategy.
6. Verified public facilities, shade and cooling resources; no unsupported heat-safe route assertions.
7. Secure identity and multi-user organisation accounts if needed, followed by controlled field studies (Stage C).
