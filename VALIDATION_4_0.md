# TERRA07 Platform 4.0 — Packaged validation

Automated source QA, Earth geospatial regression tests, exact selected-road filtering, street-name and search state tests, Field Toolkit tests, marine/climate source-parser tests, profile/alert policy tests, TypeScript/JSX syntax parsing, local module import checks, and CSS parsing all **passed**.

**Checkpoint preservation:** SHA-256 of the included original `TERRA07-CHECKPOINT-01-STREET-ONLY-LOCKED.zip` is identical to the supplied checkpoint (`ec4f20316c051d9ec60628f1888cf9524425ff7f1d82f56d813b501fc615a3df`).

**NOT VERIFIED:** Full `npm install` / `pnpm install`, `next build`, full TypeScript semantic typecheck, actual browser visual layout, external weather/Ocean/NOAA API calls, native Android/iOS builds, production hosting and round-the-clock alert delivery. The package does not include installed third-party dependencies. An offline npm dependency install failed with ENOTCACHED. Internet and upstream provider connectivity are necessary for live conditions.

**Required commands on a connected machine:**

```
npm install
npm run test:all
npm run test:v4
npm run typecheck
npm run build
```

Then conduct the live browser acceptance checklist in `docs/TESTING_4_0.md` before sharing a public site.
