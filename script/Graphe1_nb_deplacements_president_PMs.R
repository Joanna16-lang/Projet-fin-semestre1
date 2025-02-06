# Pour la visualisation
library(ggplot2)  
library(dplyr)

data1 <- read.csv("../data/csv/BDD_president.csv", sep=",", header=TRUE)
data2 <- read.csv("../data/csv/BDD_PMs.csv", sep=",", header=TRUE)
data_combined <- bind_rows(data1, data2) #les deux fichiers ont les memes colonnes 

# Compter le nombre de voyages par année pour chaque individu
data_count <- data_combined %>%
  group_by(Individu, Annee) %>%
  summarise(Nombre_de_voyages = n())

# Créer le graphique avec la syntaxe correcte
ggplot(data_count, aes(x = Annee, y = Nombre_de_voyages, color = Individu)) +
  geom_line() +  # Trace les lignes
  labs(title = "Graphe comparatif du nombre de déplacements hors Paris du président\net de ses premiers ministres entre 2002 et 2007", 
       x = "Années", 
       y = "Nombre de voyages") +  
  scale_color_manual(values = c("red", "blue", "green")) +  # Choisir les couleurs
  theme_minimal() +  # Utiliser un thème minimal
  theme(
    plot.title = element_text(hjust = 0.5, vjust = 1, size = 12),  # Centrer et ajuster la taille du titre 
    plot.title.position = "panel" )   




