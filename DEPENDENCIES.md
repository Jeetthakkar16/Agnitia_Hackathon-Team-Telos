# TERRA07 dependency map

## Runtime

- **Next.js 16.3.4** — App Router, API routes, Vercel deployment.
- **React 19.2.6 / React DOM 19.2.6** — UI.
- **MapLibre GL JS 6.13.0** — WebGL vector maps, globe projection, terrain, raster imagery and data layers.
- **lucide-react** — interface icons.
- **zod** — validation utilities.
- **drizzle-orm** — retained for future authenticated persistence; the investor web build does not pretend cloud profile storage is connected.
- **Capacitor packages** — retained because the same product tree also supports the Play Store/native direction.

## Development

- TypeScript 5.9.3
- Drizzle Kit 0.31.10
- Capacitor CLI 8.x

## External runtime services

- Open-Meteo
- MET Norway
- OpenFreeMap
- EOX satellite raster
- Mapterhorn raster DEM
- OpenStreetMap / Overpass
- Photon + Nominatim
- OSM pedestrian routing service
- IMD + NDMA/SACHET where available

## Production replacements to budget for

Public best-effort map/OSM infrastructure should not be treated as an enterprise SLA. A funded rollout should self-host or contract appropriate capacity and add monitoring, quotas, caching and failover.
