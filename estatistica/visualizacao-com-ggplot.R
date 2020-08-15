################## LIMPEZA DE DADOS #################

#' Autor: Gabriel R. R.

#' O código inicial, em R, está disponível nesse link: https://github.com/GabrielReisR/R/blob/master/estatistica/visualizacao-com-ggplot.R

#' Essa apresentação, em RMarkdown, está disponível nesse link: https://rpubs.com/reisrgabriel/dplyrPt1

#' Todo esse código pode ser rodado direto no R.
#' Tudo o que inicia com "#" ou "#'" são comentários, e não são computados pelo R.

####################################################


# análise exploratória e limpezas iniciais

# biblios
library(dplyr)
library(ggplot2)

# banco de dados
url <- "https://raw.githubusercontent.com/GabrielReisR/R/master/estatistica/dados/dass42.csv"
dass <- read.csv(url)


# criando dass_fatores
dass_fatores <- dass %>% 
  select(education:major)

# transformando vars em fatores
names(dass_fatores)

dass_fatores$married <- factor(
  dass$married,
  levels = c(1, 2, 3),
  labels = c("Never married", "Currently married", "Previously married")
)


#######
# análises descritivas



dass %>% ggplot(aes(x = age, y = Q1A, color = married)) +
  geom_point()


my_skim <- skim_with(
  numeric = sfl(iqr = IQR, mad = mad, p99 = ~ quantile(., probs = .99)),
  append = FALSE
)
my_skim(dass$Q1A)