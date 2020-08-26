# lendo dados

url <- "https://raw.githubusercontent.com/GabrielReisR/R/master/estatistica/dados/festival_download.csv"
fest_download <- read.csv(url)[, - 1]
fest_download$id <- c(1:nrow(fest_download)) # criando indexador 'id'

# carregando bibliotecas
library(dplyr)
library(tidyr)
library(ggplot2)

# pivotando
fest_pivoted <- fest_download %>% 
  pivot_longer(
    cols = starts_with("day"),
    names_to = "day",
    values_to = "hygiene_score"
  )

# avaliando normalidade em cada dia
histograms <- fest_pivoted %>%
  ggplot(aes(hygiene_score)) +
  geom_histogram(aes(y = ..density..), colour = "steelblue", fill = "white") +
  facet_grid(~ day) +
  stat_function(fun = dnorm,
                args = list(
                  mean = mean(fest_pivoted$hygiene_score, na.rm = T),
                  sd = sd(fest_pivoted$hygiene_score, na.rm = T)
                )) +
  theme_minimal()

histograms

qqplots <- fest_pivoted %>% 
  ggplot(aes(sample = hygiene_score)) +
  geom_qq() + geom_qq_line(color = "steelblue") + # traçar pontos qq + linha qq
  facet_grid(~ day) +
  theme_minimal()

cowplot::plot_grid(histograms, qqplots, nrow = 2)

# avaliando separadamente para ter linha de normalidade
hist1 <- ggplot(fest_download, aes(day1)) +
  geom_histogram(aes(y = ..density..), colour = "steelblue", fill = "white") +
  stat_function(fun = dnorm,
                      args = list(
                        mean = mean(fest_download$day1, na.rm = T),
                        sd = sd(fest_download$day1, na.rm = T)
                      )) +
  ylim(c(0,1.25)) +
  theme_minimal()


hist2 <- ggplot(fest_download, aes(day2)) +
  geom_histogram(aes(y = ..density..), colour = "steelblue", fill = "white") +
  stat_function(fun = dnorm,
                args = list(
                  mean = mean(fest_download$day2, na.rm = T),
                  sd = sd(fest_download$day2, na.rm = T)
                )) +
  ylab("") + ylim(c(0,1.25)) +
  theme_minimal()

hist3 <- ggplot(fest_download, aes(day3)) +
  geom_histogram(aes(y = ..density..), colour = "steelblue", fill = "white") +
  stat_function(fun = dnorm,
                args = list(
                  mean = mean(fest_download$day3, na.rm = T),
                  sd = sd(fest_download$day3, na.rm = T)
                )) +
  ylab("") + ylim(c(0,1.25)) +
  theme_minimal()


all_histograms <- cowplot::plot_grid(hist1, hist2, hist3, nrow = 1)

all_histograms


cowplot::plot_grid(all_histograms, qqplots, nrow = 2)

