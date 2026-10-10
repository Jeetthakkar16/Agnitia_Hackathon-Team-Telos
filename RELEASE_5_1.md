# SAAYA Mobile 5.1 — usability and accessibility pass

Source: SAAYA Mobile v5.0 Earth/Ocean/Climate release (unchanged provider and map engines).

Changes: increased light and dark contrast through semantic tokens; 48px touch targets for primary navigation; flexible narrow-screen text; reduced map-control collision risk; reduced-motion support; accessible selected-state and location controls; gated Earth-only secondary routes when an Ocean or Climate profession is active.

Limitations: routes are client-side experience organization, **not security authorization**. Signup requires configured Supabase. 3D globe depends on WebGL/network maps. Live provider, native signing, physical device layout tests and production hosting have not been verified here.

### Local check
Run START-SAAYA.bat, then `npm run check` and `npm run build` with dependencies installed. Test 320px, 375px, 430px screens, light/dark modes and all professions.

### Verification performed in this workspace
- PASS: `node scripts/qa.mjs` (194 files)
- PASS: `node scripts/test-pure.mjs`
- PASS: `node scripts/test-focused-lanes.mjs`
- Legacy `test-unified-ui`, `test-v4-experience` and `test-platform` fail because they assert old hardcoded href navigation links. New role-aware navigation uses onClick and route checks. Those outdated checks still need rewriting as behavior-based tests.
- Full TypeScript/build and integration tests not run (dependencies are not installed in this workspace).
