# SAAYA v6 — Science and data provenance

The application intentionally separates **model predictions**, **user-entered field context**, **fixed planning guidance**, **official alerts**, and **unavailable information**.

| Source | Used for | Reference |
|---|---|---|
| Open-Meteo Forecast API | Latest model-based air/apparent temperature, humidity, wind and daily max/min temperature | https://open-meteo.com/en/docs |
| Open-Meteo Forecast API | Daily modeled precipitation and FAO reference evapotranspiration, ETo | https://open-meteo.com/en/docs |
| FAO crop-water method | ETc = Kc × ETo, with stage-specific Kc | https://www.fao.org/4/s2022e/s2022e07.htm |
| FAO AQUASTAT | Irrigation requirement also depends on effective rain and soil-water storage | https://www.fao.org/aquastat/en/data-analysis/irrig-water-use/irrig-water-requirement/ |
| WHO heat and health | Precautions and medical-emergency boundaries | https://www.who.int/news-room/fact-sheets/detail/climate-change-heat-and-health |
| WHO/WMO occupational heat | Heat policy, workload, acclimatization, physical activity and protective clothing | https://www.who.int/news/item/22-08-2025-who-wmo-issue-new-report-and-guidance-to-protect-workers-from-increasing-heat-stress |
| Official IMD and NDMA SACHET providers | Heat warnings and official notices via inherited adapters; may be unavailable | https://mausam.imd.gov.in/ ; https://sachet.ndma.gov.in/ |
| OpenStreetMap/MapLibre | Geocoding, physical roads, map and 3D globe; not land-surface sensors | https://www.openstreetmap.org/ |
| NOAA CPC | Pacific ENSO observed index (in original climate module) | https://www.cpc.ncep.noaa.gov/ |
| Open-Meteo Marine | Waves/current/SST/wind forecasts in original ocean module | https://open-meteo.com/en/docs/marine-weather-api |

## Crop coefficient method

For selected `crop` and `stage`, `ETc (mm over 7 days) ≈ Kc × Σ ETo_daily`.

This uses the FAO average four-stage Kc framework. Coefficients are examples and can need humidity, wind, cultivar, field-management and local agronomy adjustments. Rice coefficients and the 'mixed vegetables' category are especially approximate. The output **is not irrigation water needed**: effective rain, infiltration, irrigation efficiency, crop root depth, soil water storage, groundwater and ponding are unknown. It is not a crop-yield, suitability or planting recommendation.

Seven-day dry-spell watch occurs **only** if all seven forecast daily rain/ET0 readings exist AND at least five days are <1 mm modeled rain AND total modeled rain < 0.5 × modeled reference ETo. The threshold is an explicit SAAYA planning heuristic, not an FAO drought threshold or official drought classification. No inference about seasonal drought, district emergency status or long-term water security is made.

A modeled max air-temperature day ≥35 °C triggers a **general hot-day context count**, not a crop-specific heat injury threshold. FAO ECOCROP provides crop-environment constraints, but suitable crop recommendations require longer climatology, soils, irrigation, cultivar and agronomic validation: https://ecocrop.apps.fao.org/ecocrop/srv/en/home

## Geography

A selected farm GPS pin is displayed at provided lat/lon. Weather and apparent temperature come from forecast grids that may encompass a large geographical area. Neither GPS accuracy nor zoom level increases weather-model resolution. The EOX imagery in the existing globe is visual imagery, **not current thermal remote sensing**. NASA explains why land-surface temperature differs from air temperature: https://science.nasa.gov/earth/earth-observatory/global-maps/land-surface-temperature/

## Safety and missing data

`unknown` is distinct from `routine`. Missing values remain `null`, not 0°C, 0 mm rain or a low-risk signal. Official alerts should be followed even if the modeled band looks lower. This is non-diagnostic health guidance and not a medical device. An external medical/public health advisor must review clinical content and alert policies before public deployment.
