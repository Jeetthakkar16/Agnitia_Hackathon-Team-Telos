# TERRA07 v4.2 — Error Fix + Simple Interface

## Start here
1. Extract this release to its own directory. Do not overwrite v4.0.
2. Open `TERRA07-PLATFORM-v4.2-PRACTICAL-FIX` and run `START-TERRA07.bat`. Node.js 22+ and internet access are required the first time.
3. Open `http://localhost:3009/welcome`. To check that this is the updated app open `http://localhost:3009/api/version`: `4.2.0`.
4. Earth: `http://localhost:3009/`; Ocean: `/ocean`; Climate: `/climate`.

## Fixed
- Earth crash `readExperience is not defined`: added the missing experience store imports.
- Ocean and Climate: removed CARTO's unauthorized/watermarked map tiles and load a keyless OpenFreeMap style. No secret map key is embedded.
- Optional provider: set `NEXT_PUBLIC_MAPTILER_KEY` in `.env.local` only if you have your OWN MapTiler key. Restrict it to your application domain via provider settings. The fallback is a free OpenFreeMap style.
- Forecast consistency: the large Ocean reading now follows the selected Waves, Wind, Sea temperature or Currents tab.
- UI: simplified page names; moved numerous links and specialist resources into an expandable 'More' section.
- Fresh localhost port 3009 and updated PWA cache version prevent stale page mixing.
- Existing street geometry, approximate weather color semantics, selected lane filtering, 3D globe, alerts and safe fallback behavior retained.

## Honest scientific limitations
- Road colors are regional model estimates shown on real road geometries, NOT per-road thermometers or precise isotherms.
- The Ocean and Climate map pin represents a selected model grid location only; the gradient reference legend is NOT a measured global heatmap.
- Weather depends on external APIs and network availability. The app must not pretend to display live values when services fail.
- Marine forecasts are not certified navigation information. Official warnings have priority.
- Browser notifications do not guarantee background alarm delivery.

## Validation
Pure logic tests, geospatial/source tests, UI contract checks, and TypeScript syntax/import checks can run offline. `npm install`/`pnpm install`, full Next.js typecheck/build, browser painting, and live upstream API requests require network access and have NOT been verified by this package's offline checks. Run `RUN-TESTS.bat` on your PC with network access and review the logs; retest all three modes in Chrome.

## Optional map provider key setup
1. Register and create a browser map key on MapTiler if desired (not required).
2. Copy `.env.example` to `.env.local` and add `NEXT_PUBLIC_MAPTILER_KEY=your-key` (no quotes).
3. Restart `START-TERRA07.bat`; restrict the key's allowed websites in MapTiler's dashboard before public deployment.
4. No key provided by you was present in these files. We did not create or claim to install one.

## Browser smoke test
- Open `/api/version`: expect `4.2.0`.
- Navigate Welcome → Survey → Choose → Earth; ensure no runtime error.
- Check Earth search suggestions close after selecting a street.
- Open Ocean: map has no CARTO API KEY REQUIRED watermark; toggle Waves/Wind/Sea Temperature and verify large number follows selection.
- Open Climate: location, scenario-year, chart appear correctly.
- Disconnect internet: unavailable messages replace missing model information.
