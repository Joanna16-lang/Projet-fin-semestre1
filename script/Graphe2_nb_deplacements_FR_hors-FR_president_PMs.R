# Pour la visualisation
library(ggplot2)  
library(dplyr)

data1 <- read.csv("../data/csv/BDD_president.csv", sep=",", header=TRUE)  # Adaptez le séparateur si nécessaire
data2 <- read.csv("../data/csv/BDD_PMs.csv", sep=",", header=TRUE)
data_combined <- bind_rows(data1, data2) #les deux fichiers ont les memes colonnes 

data_combined$Destination <- ifelse(data_combined$Pays == "France", "France", "Autre")

data_aggregated <- data_combined %>%
  group_by(Individu, Destination) %>%
  summarise(Nb_deplacements = n())  # Compte le nombre de déplacements pour chaque individu et chaque catégorie

ggplot(data_aggregated, aes(x = Individu, y = Nb_deplacements, fill = Destination)) +  
  geom_bar(stat = "identity", position = "stack", color = "black") +  # Empiler les barres
  labs(title = "Grahe comparatif du nombre de déplacements en France et à l'étanger\nde M.Chirac, M.Raffarin et M.de Villepin entre 2002 et 2005", x = "Individu", y = "Nombre de déplacements") +
  scale_fill_manual(values = c("France" = "blue", "Autre" = "gray")) +  # Couleurs : bleu pour la France, gris pour l'autre
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, vjust = 1, size = 12),  # Centrer horizontalement et verticalement
    plot.title.position = "panel"  # Positionner le titre au-dessus du panneau de graphique  
    )





