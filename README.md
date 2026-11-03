# GeoUy

Mapas interactivos y herramientas para la geología del Uruguay: unidades geológicas, ubicación de fotografías de campo y visualizaciones 3D de horizontes sísmicos del margen continental uruguayo.

Los mapas HTML se publican con GitHub Pages en **https://rubensdmp.github.io/GeoUy/**.

## Contenido

### Mapas geológicos (R + Leaflet / mapview)
| Archivo | Descripción |
|---|---|
| [`Index.html`](https://rubensdmp.github.io/GeoUy/Index.html) | Mapa principal de unidades geológicas con fotos de campo |
| [`Formaciones.html`](https://rubensdmp.github.io/GeoUy/Formaciones.html) | Unidades geológicas del Uruguay (fichas por formación) |
| [`MapFmUy.html`](https://rubensdmp.github.io/GeoUy/MapFmUy.html) | Mapa de formaciones |
| `GeoUy.html`, `GeoUy2.html`, `GeoUy3.html` | Versiones del mapa general |
| `Carto.html`, `TravesiasKronon.html`, `PozosRaigon.html`, `ICG066.html` | Mapas temáticos (cartografía, travesías, pozos, colección ICG) |
| `FmUyFotosMap.R` | Script R que lee los shapes de `uy/` y genera los mapas con fotos en popups |

### Horizontes sísmicos del margen uruguayo (Plotly 3D)
| Archivo | Descripción |
|---|---|
| `SDRs_MCU_Rubens_Merlino_2025.html` | SDRs (*seaward dipping reflectors*), Margen Continental Uruguayo, 2025 |
| `SDRs_MCU_Rubens_Merlino_2D_2025.html` / `..._3D_2025.html` | Vistas 2D y 3D de los SDRs |
| `BASE_SDRs.html`, `TOPE_SDRs.html`, `BASE_Y_TOPE_SDRs.html` | Superficies de base y tope de los SDRs |
| `BASAMENTO.html`, `RM_BREAKUP.html`, `BREAKUP-3DSurveys.html` | Basamento, *breakup* y relevamientos 3D |
| `ultimoCaudal.html` | Visualización de caudales |

### Notebooks (Python / Colab)
| Archivo | Descripción |
|---|---|
| `GetLoc&Links*.ipynb` | Extraen la geolocalización (EXIF) de fotografías y generan enlaces y KML (variantes por campaña: FCIEN, Kronon, Campismo) |
| `Lectura - Escritura KML.ipynb` | Lectura y escritura de archivos KML |

### Datos
- `uy/`: shapefiles de unidades geológicas, diques y estructuras del Uruguay (UTM y geográficas), más fotos de muestra.
- `Cerro Largo.kml`, `Cuenca Norte.kml`, `testmod.kml`: capas KML.
- `fotos.csv`, `Salida3.csv`: tablas de ubicación de fotografías.

## Requisitos
- **R**: `sf`, `mapview`, `leaflet`, `leafpop`, `tidyverse`, `RColorBrewer`.
- **Python**: los notebooks están pensados para Google Colab.

## Autor
[Rubens Merlino](https://www.linkedin.com/in/rubens-merlino-uy/)
