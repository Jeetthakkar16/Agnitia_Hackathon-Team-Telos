# TERRA07 v4.1 — Verification

## Verified in the artifact working directory
- Earth missing-import crash cause repaired: experience helpers explicitly imported.
- Removed keyed CARTO raster style; Ocean/Climate now use keyless OpenFreeMap style, same source family as Earth.
- Optional domain-restricted MapTiler browser key with graceful free-map fallback is implemented.
- Ocean large numeric reading now follows selected forecast variable.
- Specialist resource lists collapse under expandable details; plain-language page headings and data provenance kept.
- Port moved from 3007 to 3008; browser SW cache version bumped.
- `node scripts/qa.mjs`: PASS.
- Pure calculations, nearby lane geometry, six/two street dynamic counts, isothermal road coloring, street-names, exact selected-street filtering, search policies, field tools, platform data and NOAA/marine parsers: PASS.
- New map and user-experience source contract tests: PASS.
- All JSX/TypeScript files syntax parse; static local-import integrity: PASS.
- All 3 CSS files parsed without syntax errors.
- Verified keyless map style by running module with missing key and separately with a test-only key.
- The original Checkpoint 01 ZIP SHA-256 remains `ec4f20316c051d9ec60628f1888cf9524425ff7f1d82f56d813b501fc615a3df`.

## NOT verified here
- Installing all npm/pnpm packages and running the Next.js production build.
- Actual browser rendering and real provider responses; this working environment cannot access the provider/registry network.
- A guarantee that any external map/weather API is available in the user's browser; outages remain possible.
- Full functional acceptance on Android/iOS.

Run `RUN-TESTS.bat` after installing dependencies on a connected computer and test welcome, Earth, Ocean and Climate at `http://localhost:3008`.
