# TERRA07 Vercel architecture

```text
Browser / PWA / future native shell
             |
             v
       Next.js 16 on Vercel
             |
   +---------+-------------------------------------------+
   |         |          |          |          |          |
Thermal   Weather     Search      OSM       Routes     Alerts
 API       API         API        APIs        API        API
   |         |          |          |          |          |
Open-     Open-      Photon /   Overpass   OSM foot   IMD +
Meteo     Meteo      Nominatim     |        graph     NDMA
   |       + MET.no      |      streets /
   |                    |      buildings /
   |                    |      green/resources
   v                    v
10-min Vercel edge/CDN cache
   |
   +-----------------------> Thermal Earth / Local heat
                              MapLibre GL JS
                              + OpenFreeMap vectors
                              + EOX satellite texture
                              + Mapterhorn terrain
                              + real OSM street overlays

Optional personal context
        |
        v
Explainable safety rule engine
        |
Fixed/versioned health content + official-warning floor
```

## Frontend rendering order

The map is intentionally decoupled from weather loading:

1. application shell renders;
2. vector/satellite/terrain map starts immediately;
3. thermal API loads independently;
4. heat field fades in;
5. local street geometry and close-zoom urban evidence load progressively.

A thermal-provider failure therefore does not blank the map or the safety tools.

## Thermal API

`GET /api/thermal`

- supports `global` or viewport scope;
- air-temperature or apparent-temperature metric;
- adaptive grid size by zoom level;
- current frame plus optional 0–24 h frames;
- requests multiple coordinates per Open-Meteo call;
- Vercel cache: 10 min fresh + stale-while-revalidate window;
- explicit 503 unavailable response instead of synthetic readings.

## Trust boundaries

- Provider responses are validated before display.
- Street heat is an interpolation from valid weather-model coordinates, never called a street sensor measurement.
- User health context does not produce a diagnosis or exact illness threshold.
- Official warnings form a non-suppressible safety floor.
- Fluid-restriction users are never given a generic litre target.
- Sensitive profile details are not put in lock-screen notification wording.
- Persistent cloud health-profile storage remains disabled until real authenticated storage and consent are configured.

## Scale boundary

OpenFreeMap/public Overpass/routing endpoints are suitable for an investor demonstration and early controlled pilot, not an unlimited production SLA. The funded architecture should introduce provider contracts or self-hosted capacity, observability, rate controls and city-specific validation without changing the product-level interfaces.
