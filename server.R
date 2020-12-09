
server <- function(input, output) {
  output$map1 <- renderLeaflet({
    numIDP<- leaflet(options=leafletOptions(zoomControl = FALSE)) %>%
      addProviderTiles(providers$CartoDB.PositronNoLabels) %>%
      setView(29.9, 51.3, zoom = 11) %>%
      addPolygons(data = ChEZ.border,
                  color = "#54278f", weight = 2, smoothFactor = 0.5,
                  opacity = 1.0, fillOpacity = 0
      ) %>%
      addRasterImage(Landsat.RF.2016.fact,
                     opacity = 1,
                     color = '#cce70f',
                     group = "2016") %>%
      addRasterImage(Landsat.RF.2006.fact,
                     opacity = 1,
                     color = '#1ee70f',
                     group = "2006") %>%
      addRasterImage(Landsat.RF.1996.fact,
                     opacity = 1,
                     color = '#1eb10f',
                     group = "1996") %>%
      addRasterImage(Landsat.RF.1986.fact,
                     opacity = 1,
                     color = '#1e7f0f',
                     group = "1986") %>%
      addLayersControl(overlayGroups = c("1986", 
                                         "1996",
                                         "2006",
                                         "2016"
      ),
      options = layersControlOptions(collapsed = F, autoZIndex = F)) %>%
      addLegend("topleft", colors = "#54278f", labels = "Межа Чорнобильської зони відчуження",
                data =  ChEZ.border,
                opacity = 1) %>%
      addLegend("topleft", colors = "#1e7f0f", labels = "Лісовий покрив (1986 р.)",
                data =  Landsat.RF.1986.fact,
                opacity = 1) %>%
      addLegend("topleft", colors = "#1eb10f", labels = "Лісовий покрив (1996 р.)",
                data =  Landsat.RF.1996.fact,
                opacity = 1) %>%
      addLegend("topleft", colors = "#1ee70f", labels = "Лісовий покрив (2006 р.)",
                data =  Landsat.RF.2006.fact,
                opacity = 1) %>%
      addLegend("topleft", colors = "#cce70f", labels = "Лісовий покрив (2016 р.)",
                data =  Landsat.RF.2016.fact,
                opacity = 1)
  })
  output$map2 <- renderLeaflet({
    ChngIDP<- leaflet(options=leafletOptions(zoomControl = FALSE)) %>%
      addProviderTiles(providers$CartoDB.PositronNoLabels) %>%
      setView(29.9, 51.3, zoom = 11) %>%
      addPolygons(data = ChEZ.border,
                  color = "#54278f", weight = 2, smoothFactor = 0.5,
                  opacity = 1.0, fillOpacity = 0
      ) %>%
      addRasterImage(agents.map,
                     opacity = 1,
                     group = "Чинники порушень лісів"
                     ,colors = pal_agents,
                     method = 'ngb'
      ) %>%
      addRasterImage(yod.map,
                     opacity = 1,
                     group = "Роки виникнення порушень лісів",
                     colors = pal_yod,
                     method = 'ngb'
                     ) %>%
      addLayersControl(overlayGroups = c("Чинники порушень лісів", 
                                         "Роки виникнення порушень лісів"
      ),
      options = layersControlOptions(position = 'topright', collapsed = F, autoZIndex = F)) %>%
      hideGroup('Роки виникнення порушень лісів')  %>%
      addLegend("topleft", pal = pal_agents, values = values(agents.map),
                title = "Чинники порушень лісів",
                opacity = 1,
                labFormat  = labelFormat(
                  transform = function(x) {
                    levels(agents.map)[[1]]$agents_ua[which(levels(agents.map)[[1]]$ID == x)]
                  })) %>%
      addLegend("topleft", pal = pal_yod, values = values(yod.map),
                title = "Роки виникнення порушень лісів",
                opacity = 1) %>%
      addLegend("topleft", colors = "#54278f", labels = "Межа Чорнобильської зони відчуження",
                data =  ChEZ.border,
                opacity = 1)
  })
  
  }
