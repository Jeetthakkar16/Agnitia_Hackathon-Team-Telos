# TERRA07 Release 02.2 — clean search

## Reported defect

After selecting a location, an entire geocoder suggestion list appeared below the
Earth search field and covered the map. The previous SearchBox effect restarted
when `q` or the map's location bias changed; late suggestion responses reopened
the popup after successful search.

## Fix

- Earth/3D main page: suggestions disabled entirely. Use the Search button or Enter.
- Search results: select the first actual geocoder match and keep its true label.
- Routes and City Intelligence: optional suggestions only while actively typing.
- Once a result is selected/submitted, late suggestion responses cannot reopen it.
- Outside tap/click and Escape close the list.
- Empty or failed suggestion requests do not block normal submitted search.
- Failed place lookups are reported to screen readers without opening a giant panel.
- Original TERRA07 layout and the approved thermal-road/worker behavior remain unchanged.

## Tests

`npm run test:search` (Node >=22.13 required) covers Earth disabling, pre-search
suggestions, post-submit suppression, changes in map bias, focus, short queries,
empty provider results and fresh edits. Other tests: `npm run qa`,
`npm run test:pure`, `npm run test:focus`, `npm run test:street`, `npm run test:names`.

The full Next.js build must still be run in a connected environment with installed
node_modules.
