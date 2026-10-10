# SAAYA v6 — Verification report

Test environment: build workspace, 10 October 2026. Source code verified against the attached v5.1 archive.

### Passed in this environment

- `node --experimental-strip-types scripts/test-guidance.mjs`: 11 checks pass (missing-data handling, no invented zero farm ETc, heat band, government and occupation prompts, data completeness, dry-spell watch).
- `node scripts/test-pure.mjs`: passes legacy pure-logic tests.
- `node scripts/qa.mjs`: 202 files checked, passes.
- `node --experimental-strip-types scripts/test-field-tools.mjs`: passes.
- `node --experimental-strip-types scripts/test-isotherm-contours.mjs`: passes.
- `node scripts/test-street-names.mjs`: passes.
- `node scripts/test-isothermal-roads.mjs`: passes.
- `node scripts/test-focused-lanes.mjs`: passes.
- TypeScript parser examined 101 non-declaration TS/TSX sources: no syntax parse errors.
- Isolated strict TypeScript check of decision-engine, health profile and shared types: passes.

### Not verified here — do not infer PASS

- Complete `npm install` and full Next.js production build: npm dependency installation did not finish in this runtime; node_modules were not present.
- Interactive screenshot / visual accessibility review in a real browser or phone: not conducted.
- Live third-party API queries: not tested end-to-end from this runtime.
- Old v4/v5 UI structure tests: not authoritative for v6 routes; require migration.
- Android/iOS native compilation, background notification delivery, cloud sign-in or a deployed HTTPS URL: not completed.

To verify the complete runtime on Windows, run `VERIFY-BUILD.bat` after installing dependencies and test on actual mobile devices. This report is intentionally not a claim of a bug-free production release.
