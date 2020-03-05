library(mosaic)

Arbeitszeit <- read.csv("Uebung-EDA-num/annual-working-hours-per-persons-engaged.csv")

Arbeitszeit <- Arbeitszeit %>%
  filter(Year == 2017) %>%
  rename(stunden = Average.annual.hours.worked.by.persons.engaged..hours.per.person.engaged.) %>%
  rename(land = Entity) %>%
  select(land, stunden) %>%
  na.omit()

write.csv2(Arbeitszeit, file="Uebung-EDA-num/Arbeitszeit.csv", row.names = FALSE)
