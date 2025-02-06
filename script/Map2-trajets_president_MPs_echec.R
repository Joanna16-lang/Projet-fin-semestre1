library(leaflet)
library(sf)
library(leaflet.extras)

# Charger les fichiers
deplacements <- st_read("../data/shp/mymap/mymap.shp")
presidentPMs <- st_read("../data/csv/BDD_president_PMs_Nodes.csv")
dates <- read.csv("../data/csv/BDD_president_PMs.csv")  
dates <- st_read("../data/csv/BDD_president_PMs.csv")

# Nettoyer les labels pour deplacements
deplacements$Label <- ifelse(grepl("Chirac", deplacements$Label), "Chirac",
                             ifelse(grepl("Raffarin", deplacements$Label), "Raffarin",
                                    ifelse(grepl("Villepin", deplacements$Label), "Villepin", NA)))

# Ajouter la colonne Label à presidentPMs en fonction de certaines conditions
presidentPMs$Label <- ifelse(grepl("Chirac", presidentPMs$label), "Chirac",
                             ifelse(grepl("Raffarin", presidentPMs$label), "Raffarin",
                                    ifelse(grepl("Villepin", presidentPMs$label), "Villepin", NA)))

# Vérifier et convertir les coordonnées
presidentPMs$lng <- as.numeric(presidentPMs$lng)
presidentPMs$lat <- as.numeric(presidentPMs$lat)
presidentPMs <- presidentPMs[!is.na(presidentPMs$lng) & !is.na(presidentPMs$lat), ]
dates$Annee <- as.numeric(dates$Annee) 

# Vérifier les noms de colonnes de dates
colnames(dates) <- tolower(colnames(dates))  # Uniformiser en minuscules pour éviter les erreurs de casse
if (!("label" %in% colnames(dates)) | !("annee" %in% colnames(dates))) {
  stop("Les colonnes 'label' et 'annee' doivent exister dans le fichier dates.")
}

# Conversion des années
dates$annee <- as.numeric(dates$annee)

# Ajouter l'année à presidentPMs
presidentPMs <- merge(presidentPMs, dates[, c("label", "annee")], by = "label", all.x = TRUE)

# Palette de couleurs
palette <- colorFactor(
  palette = c("blue", "green", "red"), 
  domain = c("Chirac", "Raffarin", "Villepin")
)

# Définir les icônes personnalisées en fonction du rôle
custom_icons <- awesomeIcons(
  icon = 'building',  
  library = 'fa',  # Font Awesome
  markerColor = ~factor(Label, levels = c("Chirac", "Raffarin", "Villepin"),
                        labels = c("blue", "green", "red")),
  iconColor = 'white'
)

# Créer la carte interactive
leaflet() %>% 
  addProviderTiles(providers$OpenStreetMap) %>%  
  setView(lng = 2.3522, lat = 48.8566, zoom = 5) %>%  
  
  # Ajouter les polylines des déplacements
  addPolylines(
    data = deplacements, 
    color = ~palette(Label),  
    weight = 3,
    group = ~Label  # Groupe par individu
  ) %>% 
  
  # Ajouter des marqueurs avec des icônes personnalisées pour chaque individu
  addAwesomeMarkers(
    data = presidentPMs,
    lng = ~lng,
    lat = ~lat,
    icon = custom_icons,  
    group = ~paste("Year_", annee),  # Créer un groupe par année
    label = ~paste(label, "<br>Year:", annee)  
  ) %>%
  
  # Contrôle des couches pour afficher/masquer les trajets par individu et par année
  addLayersControl(
    overlayGroups = c("Chirac", "Raffarin", "Villepin", unique(paste("Year_", presidentPMs$annee))), 
    options = layersControlOptions(collapsed = FALSE)
  ) %>%
  
  # Ajouter une légende pour les couleurs des polylines
  addLegend("topright", 
            colors = c("blue", "green", "red"), 
            labels = c("Chirac", "Raffarin", "Villepin"),
            title = "Individu") %>%
  
  # Ajouter une mini carte
  addMiniMap(position = "bottomleft")
