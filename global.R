library(tidyverse)
library(raster)
library(sp)
library(shiny)
library(shinydashboard)
library(leaflet)
library(viridis)
library(rgdal)

### FOREST MASK DYNAMICS FILES
# run raster files of forest mask dynamics
Landsat.RF.2016.fact <- raster('rasters/RF_mask_2016.tif')
Landsat.RF.2006.fact <- raster('rasters/RF_mask_2006.tif')
Landsat.RF.1996.fact <- raster('rasters/RF_mask_1996.tif')
Landsat.RF.1986.fact <- raster('rasters/RF_mask_1986.tif')

# shape layer ChEZ border
ChEZ.border <- readOGR("CheZ_border_line.shp",
                       layer = "CheZ_border_line")

# transform to CRS could be used
ChEZ.border <- spTransform(ChEZ.border,
                           CRS("+init=epsg:4326"))

### DISTURBANCE DYNAMICS FILES

yod.map <- raster('rasters/NBR_years_filtered.tif')
#yod.map <- aggregate(yod.map, 2, fun = 'modal')
#writeRaster(yod.map, 'NBR_years_filtered.tif', format = 'GTiff', overwrite = T)
yod.map <- ratify(yod.map)

agents.map <- raster("rasters/RF_agents_filtered.tif")
#agents.map <- aggregate(agents.map, 2, fun = 'modal')
#writeRaster(agents.map, 'RF_agents_filtered.tif', format = 'GTiff', overwrite = T)
agents.map <- ratify(agents.map)
agents.levels <- levels(agents.map)[[1]]
agents.levels$agents_ua <- c('біотичні', "рубки", "пожежі", "буреломи")
levels(agents.map) <- agents.levels

### palettes for legends:

agents_pal <- c('#4dac26', '#7b3294', '#d7191c', '#2c7bb6')
pal_agents <- colorFactor(
  agents_pal,
  values(agents.map),
  reverse = FALSE,
  na.color = 'transparent'
)

pal_yod <- colorNumeric(palette = "viridis", values(yod.map), na.color = 'transparent')
