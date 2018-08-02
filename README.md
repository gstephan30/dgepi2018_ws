# DGEPi2018 Workshop - Unabdingbar, aber doch im Schattendasein - Datenqualität in epidemiologischen Studien – Was können wir besser machen
## Visualisierung und interaktive Darstellung von Datenauffälligkeiten

### HTML Presentation
https://htmlpreview.github.io/?https://github.com/gstephan30/dgepi2018_ws/blob/master/index.html

### Code for Datasets:

`df <- outbreaks::ebola_sim_clean[[1]] %>% mutate_all(funs(as.character))`

`df2 <- read_csv("data/outbreaks.csv")`

`df3 <- okcupiddata::profiles %>% as_tibble()`

