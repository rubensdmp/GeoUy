# INFORMACIÓN GENRAL ------------------------------------------------------

#Este script lee archivos shape de Uruguay y los plotea con Mapview
#También se plotean las ubicación de fotografías pudiendo observarlas como popups




#CARGA DE BIBLIOTECAS -----------------------------------------------------
  
#install.packages("plotKML")

library(sf)
library(mapview)
library(leaflet)
library(leafpop)
library(dlookr)
library(tidyverse)
library(magrittr)
library(RColorBrewer)

library(sp)
library(rgdal)
library(raster)
#library(plotKML)



# CARGA DE DATOS ----------------------------------------------------------

#file.choose()

##Leemos los Shape File
geoEst = read_sf(paste(getwd(),"/uy/Estructuras.shp", sep = ""))
geoDiq = read_sf(paste(getwd(),"/uy/Diques.shp", sep = ""))
geoUnit = read_sf(paste(getwd(),"/uy/Unidades_Geologicas.shp", sep = ""))

geoDiq


##quito columnas que no interesa plotear
geoUnit %<>% dplyr::select(-"Eon",
                           -"Fuente",
                           -"Label",
                           -"Codigo",
                           -"SubLabel",
                           -"SubUnidad",
                           -"Shape_Leng",
                           -"Shape_Area")

geoEst %<>% dplyr::select(-"Tipo",
                           -"Comprobada",
                           -"Shape_Leng")

geoDiq %<>% dplyr::select(-"OBJECTID",
                           -"CodFilon",
                           -"Tipo",
                           -"Shape_Le_1",
                           -"Shape_Leng")


##Filtro unidades que no me iteresan
geoUnit %<>% filter(Unidad!= "Actual")



# PLOTEO DE MAPA ----------------------------------------------------------

mapviewOptions(basemaps = c("Esri.WorldImagery",
                            "CartoDB.Positron",
                            "CartoDB.DarkMatter",
                            "OpenStreetMap",
                            "OpenTopoMap"),
               vector.palette = colorRampPalette(c("red", "white", "blue")))




fotos = read.csv(paste(getwd(),"/fotos.csv", sep = "")) 
images <- as.vector(fotos$ruta)
fotos %<>% st_as_sf(coords = c("lon", "lat"), crs = 4326)

fotosFm = mapview(fotos, color="black",
                  legend = FALSE,
                  popup = popupImage(images, width = 800, src = "remote"))

fotosFm = fotosFm + mapview(geoEst, zcol = "Nombre", layer.name="Fallas", legend = FALSE, alpha.regions = 0.3, aplha = 1)
fotosFm = fotosFm + mapview(geoDiq, zcol = "Comentario",  layer.name="Diques", legend = FALSE, alpha.regions = 0.3, aplha = 1)

fotosFm = fotosFm + mapview(geoUnit, 
                            zcol = "Unidad", 
                            layer.name="Unidades", 
                            legend = FALSE, 
                            alpha.regions = 0.5, 
                            aplha = 1,
                            col.regions=brewer.pal(9, "Set3"))


fotosFm



# GENERAMOS HTML ----------------------------------------------------------

## create standalone .html
mapshot(fotosFm, url = paste0(getwd(), "/mapa.html"))

## create standalone .png; temporary .html is removed automatically unless
## 'remove_url = FALSE' is specified
## create .html and .png
mapshot(fotosFm, file = paste0(getwd(), "/map.png"))
