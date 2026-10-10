# TERRA07 data sources and honesty labels

| Layer | Current provider | Used for | User-facing claim boundary |
|---|---|---|---|
| Global/current thermal field | Open-Meteo forecast API | air temperature and apparent-temperature grid | **weather-model estimate**, not a physical sensor at every point |
| 0–24 h thermal frames | Open-Meteo hourly forecast | forecast scrubber | model forecast; timestamp is shown |
| Local weather | Open-Meteo | current temperature, apparent temperature, humidity, wind | current model conditions; stale/malformed results are rejected |
| Weather fallback | MET Norway | air temperature/humidity/wind if primary fails | fallback provider; no fake feels-like value is invented |
| Advanced forecast | ECMWF AIFS via Open-Meteo | additional forecast context | model forecast at regional resolution |
| Detailed vector map | OpenFreeMap / OpenStreetMap data | roads, labels and map context | mapped community/open data; coverage varies |
| Textured Earth | EOX Sentinel-2 cloudless raster | satellite-like Earth texture | cloudless imagery composite, **not live satellite video** |
| Terrain | Mapterhorn raster DEM | globe/local 3D elevation | terrain model, not a building survey |
| Street geometry | OpenStreetMap via Overpass | actual mapped road lines | geometry is mapped; street heat colour is model-estimated |
| Buildings / green proxies | OpenStreetMap via Overpass | close-zoom urban evidence | mapped footprints/land-use, not complete remote sensing |
| Search submit | Nominatim | submitted place/street search | OpenStreetMap geocoding |
| Type-ahead suggestions | Photon | search suggestions | provider result, not guaranteed complete |
| City fallback search | Open-Meteo geocoder | city/town fallback | provider result |
| Walking routes | routing.openstreetmap.de foot graph | pedestrian alternatives | no verified shade claim unless shade data is connected |
| India warnings | IMD district-warning API | heat-wave/hot-day/warm-night warnings | official feed where available |
| National warnings | NDMA SACHET RSS/CAP | active official alerts | official feed where available |

## Thermal rendering method

The Vercel API requests an adaptive grid of real weather-model coordinates from Open-Meteo. The browser renders that field over a MapLibre globe/map using a continuous cold-to-hot palette. At local street zoom, TERRA07 interpolates the valid weather samples to the midpoint of each **real mapped OSM road segment**. Zoom reveals more geometry; it does not pretend the underlying model suddenly becomes a street sensor.

## Deliberately not fabricated

- authoritative census vulnerability at ward/street scale;
- verified full-route shade coverage;
- verified operational cooling-centre capacity;
- satellite LST/NDVI/tree-canopy processing in the current investor build;
- calibrated local IoT/station street accuracy;
- causal intervention-impact claims.

The **City Intelligence** view therefore exposes connected evidence and verification tasks rather than an opaque public risk score.

## Production provider note

The investor build intentionally works without paid map keys. Before paid scale, replace public best-effort map infrastructure with self-hosted tiles or a provider contract/SLA, while keeping the same provider abstraction and UI.
