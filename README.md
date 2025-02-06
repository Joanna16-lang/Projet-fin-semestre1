# Projet-fin-S1  

Pour ce projet, je suis partie d'un jeu de données sur les déplacements des présidents et des premiers ministres entre 1945 et 2008, disponible sur data.gov. Je me suis ensuite concentrée sur les années qui correspondaient au second mandat de Jacques Chirac, soit entre 2002 et 2007, avant de réaliser mes bases de données (BDD). Une fois nettoyées, j'ai pu utiliser les données qu'elles contenaient pour réaliser mes BDD nodes et edges, qui ont constitué le socle des exercices dont les résultats sont présentés ci-dessous.

### Mes graphes sur RStudio

Tout d'abord, le premier code que j'ai réalisé sur RStudio m'a permis de produire un graphe (voir ci-après) grâce auquel j'ai pu comparer le nombre de déplacements en France et à l'étranger par personne durant les cinq années du mandat présidentiel - entre Jacques Chirac et ses premiers ministres, successivement Jean-Pierre Raffarin et Dominique de Villepin.  

![Graphe1](https://github.com/user-attachments/assets/6d2ade17-3092-4532-9d3d-2099ebb3b288)

J'ai pu en conclure que le président s'était nettement moins déplacé que ses premiers ministres et qu'entre ces derniers, Jean-Pierre Raffarin était celui qui avait le plus voyagé.

Le deuxième code m'a ensuite fourni un graphe (voir ci-après) à l'aide duquel j'ai pu évalué la proportion des déplacements en France et à l'étranger par personne.

![Graphe2](https://github.com/user-attachments/assets/71a741fa-7f0a-4ef1-940f-7eb7ea771ebf)

J'en ai conclu que le président s'était très largement déplacé à l'étranger, contrairement à ses premiers ministres, qui s'étaient majoritairement déplacés en France.

### Mon graphe sur Gephi 

A partir de mes BDD Nodes et Edges, j'ai ensuite créer un graphe sur gephi pour rendre plus appréhensable mon réseau. J'ai choisis de colorer les villes qui avaient fait l'objet de déplacements comuns. Les villes rouges ont été ainsi "visitées" par Jean-Pierre Raffarin et Dominique de Villepin ; les vertes par Jean-Pierre Raffarin, Jacques Chirac et DOminique de Villepin ; les saumon par Dominique de Villepin et Jacques Chirac ; et les orange par Jacques Chirac et Jean-Pierre Raffarin.

![Gephi](https://github.com/user-attachments/assets/5e947292-8a40-4b67-8aa2-e977321998f4)

### Mes cartes sur RStudio

La dernière étape de mon travail a été de réaliser la carte interactive. J'en ai d'abord obtenu une première version (map1), que j'ai tenté d'enrichir sur une seconde version (map2) sans succès. Au lieu de la supprimer, j'ai trouvé plus intéressant de la conserver et de vous la partager. Le détail des problèmes est énoncé dans ma vidéo. 
Une fois terminée et enregistrée en format html, j'ai tenté de déposer les deux cartes sur Github, dans mon repository, sauf qu'en cliquant sur les fichiers, ne s'affichait que des lignes de codes html et pas de carte. Je dois là encore remercier Thomas, qui m'a montré la démarche qui m'a permis de vous proposer en lien les deux cartes ci-dessous !  

[map1](https://Joanna16-lang.github.io/Projet-fin-semestre1/map1.html)

[map2](https://Joanna16-lang.github.io/Projet-fin-semestre1/map2.html)
