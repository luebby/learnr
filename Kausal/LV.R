library(ggdag)

coordLV <- list(
  x = c(Geschlecht = 0, Alter = 0, RaucherIn = 1, Groesse = 2, Lungenvolumen = 3),
  y = c(Geschlecht = 1, Alter = 2, RaucherIn = 0, Groesse = 2, Lungenvolumen = 0))

dagLV <- dagify(Groesse ~ Geschlecht + Alter + RaucherIn,
                RaucherIn ~ Geschlecht + Alter,
                Lungenvolumen ~ Groesse + Geschlecht + Alter + RaucherIn,
                coords = coordLV,
                exposure = "RaucherIn",
                outcome = "Lungenvolumen")


p1 <- ggdag(dagLV, text_col = "blue", node = FALSE, text_size = 5) + theme_dag_blank()

library(dplyr)

LV <- read.table('http://jse.amstat.org/datasets/fev.dat.txt')
colnames(LV) <- c("Alter", "Lungenvolumen", "Groesse", "Geschlecht", "RaucherIn")

LV <- LV %>%
  mutate(Groesse = Groesse*2.54) %>%
  mutate(Geschlecht = factor(case_when(Geschlecht == 0 ~ "w",
                                       Geschlecht == 1 ~ "m"))) %>%
  mutate(RaucherIn = factor(case_when(RaucherIn == 0 ~ "nein",
                                      RaucherIn == 1 ~ "ja"), levels = c("nein", "ja")))

save(p1, LV, file = "LV.Rdata")


