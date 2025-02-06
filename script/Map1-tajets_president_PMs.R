library(leaflet)
library(sf)
library(leaflet.extras)

# Charger les fichiers
deplacements <- st_read("../data/shp/mymap/mymap.shp")
presidentPMs <- st_read("../data/csv/BDD_president_PMs_Nodes.csv")

# Nettoyer les labels
deplacements$Label <- ifelse(grepl("Chirac", deplacements$Label), "Chirac",
                             ifelse(grepl("Raffarin", deplacements$Label), "Raffarin",
                                    ifelse(grepl("Villepin", deplacements$Label), "Villepin", NA)))

# Vérifier et convertir les coordonnées
presidentPMs$lng <- as.numeric(presidentPMs$lng)
presidentPMs$lat <- as.numeric(presidentPMs$lat)
presidentPMs <- presidentPMs[!is.na(presidentPMs$lng) & !is.na(presidentPMs$lat), ]

# Palette de couleurs
palette <- colorFactor(
  palette = c("blue", "green", "red"), 
  domain = c("Chirac", "Raffarin", "Villepin")
)

# Carte interactive
leaflet() %>% 
  addProviderTiles(providers$OpenStreetMap) %>%  
  setView(lng = 2.3522, lat = 48.8566, zoom = 5) %>%  
  addPolylines(
    data = deplacements, 
    color = ~palette(Label),  
    weight = 3,
    group = ~Label
  ) %>% 
  addMarkers(
    data = presidentPMs,
    lng = ~lng,
    lat = ~lat,
    group = ~label,
    label = ~paste(label) 
  ) %>%
  addLayersControl(
    overlayGroups = c("Chirac", "Raffarin", "Villepin"),
    options = layersControlOptions(collapsed = FALSE)
  ) %>%
  addLegend("topright", 
            colors = c("blue", "lightgreen", "red"), 
            labels = c("Chirac", "Raffarin", "Villepin"),
            title = "Individu")%>%
  addMiniMap(position = "bottomleft")

