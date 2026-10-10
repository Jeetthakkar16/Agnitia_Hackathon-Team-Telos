# TERRA07 Release 02.1 — Real street / area labels

This is an additive labeling correction to Release 02. Checkpoint 01 remains byte-for-byte unchanged.

## What changed

- Genuine OSM name, English name, official/alternate/local/short name, Hindi name and mapped route reference are accepted as authentic labels.
- Road classes (`secondary`, `residential`, `tertiary`, etc.) are used only for internal geometry selection. They must never be manufactured into street names.
- For an unnamed mapped road, the list and tap popup show `Unnamed road · near <verified area>` when the selected location or reverse-geocoded neighbourhood/suburb/district is known; otherwise `Unnamed road · name not mapped`.
- The road-label layer itself only prints verified OSM road names, avoiding repeated generic labels over the map.
- When available, Overpass geometry with more authentic names may replace an earlier unnamed set from vector tiles even if it has fewer road segments.
- Existing 450 m selection radius, max 18 nearby roads, dark map, 3D globe, road-only thermal layer, worker mode, and other UI/UX are unchanged.

## Scientific/data honesty

An area is shown as proximity context, **not** represented as the road's name. The app does not guess names for unnamed OSM ways, and one regional heat-model estimate can apply to multiple nearby roads.

## Run

On Windows: extract to a new folder and double-click `TERRA07-LOCALHOST/START-TERRA07.bat`.
Run `node scripts/test-street-names.mjs` or `npx pnpm@11.25.0 test:names` for naming checks.

## Release limitations

Source checks and logic tests passed; full Next.js build, browser map rendering and current third-party API availability must be tested in the target environment.
