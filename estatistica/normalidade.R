# lendo dados

url <- "https://raw.githubusercontent.com/GabrielReisR/R/master/estatistica/dados/festival_download.csv"
fest_download <- read.csv(url)[, - 1]
fest_download$id <- c(1:nrow(fest_download)) # criando indexador 'id'

# avaliando normalidade
library(dplyr)
library(ggplot2)

fest_download %>% 
  ggplot(aes(ticknumb)) +
  geom_histogram() +
  theme_minimal()

fest_download %>% 
  ggplot(aes(sample = ticknumb)) +
  geom_qq() +
  theme_minimal()

