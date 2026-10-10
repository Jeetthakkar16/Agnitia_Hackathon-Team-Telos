# TERRA07 Focused Lanes — validation

## Verified in this environment

- Static TypeScript/TSX syntax parse and local relative/@ path import checks: pass (60 TS/TSX files, 64 local import edges).
- TERRA07 project QA: pass (98 files checked).
- Existing pure heat/safety logic test suite: pass (official warning cannot be weakened; fluid restrictions respected; no fictitious city score without evidence).
- New geospatial lane selection tests: pass (nearest four, 450 m circle clipping, distant way exclusion, duplicate named OSM way handling).
- Code inspection: Earth page no longer fetches `/api/thermal` global field and route page no longer loads the large wave overlay. On Earth local mode, OSM road geometry and one nearby weather-model estimate are requested separately.
- Core theme/navigation structure retained, worker panel inserted inside existing Earth weather card.
- No actual user GPS history is written to disk by TERRA07 worker mode. GPS is on only after user action, stopped on user action/tab shutdown, and may stop when browser is suspended.

## Still requires testing on the user's PC

The build sandbox could not reach npmjs.org (`EAI_AGAIN`). Therefore installing the full Next.js dependency tree, running dependency-aware `pnpm typecheck`/`pnpm build`, and live browser/map-provider QA were not possible here. The install and build should be checked on Windows with `RUN-TESTS.bat` and a live test using `http://localhost:3000`. A successful static source check does NOT guarantee bug-free production behavior.

Also test real search/GPS at Rajwada, Indore; permission prompts; switching app pages during an active worker shift; long-running timers; map-provider failures; official warning accuracy; Android battery behavior; mobile rendering and accessibility. Local four-lane overlays depend on Overpass OSM way availability and may be fewer than four.

This is a prototype for user pilots, not a calibrated street-thermal monitoring system or certified occupational heat protection app.
