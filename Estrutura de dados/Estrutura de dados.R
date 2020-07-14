################ ESTRUTURA DE DADOS ################

#' Autor: Gabriel R. R.

#' O código final, em R, está disponível nesse link: https://github.com/GabrielReisR/R/blob/master/Estrutura%20de%20dados/Estrutura%20de%20dados.R

#' Essa apresentação, em RMarkdown, está disponível nesse link: https://rpubs.com/reisrgabriel/EstruturaDeDados

#' Todo esse código pode ser rodado direto no R.
#' Tudo o que inicia com "#" ou "#'" são comentários, e não são computados pelo R.

####################################################

# install.packages("gapminder", dependencies = TRUE)
# install.packages("janitor", dependencies = TRUE)
# install.packages("tidyverse", dependencies = TRUE)
# install.packages("haven", dependencies = TRUE)
# install.packages("readxl", dependencies = TRUE)
# install.packages("skimr", dependencies = TRUE)
# install.packages("psych", dependencies = TRUE)
# library(gapminder)
# library(janitor)
# library(psych)

# Lendo bancos de dados
## csv
### file.choose()
## spss
## excel


# banco de dados
# names(dass)
## dass($)
# janitor(dass)
# str(dass)

# lendo bancos de dados
library(haven) # para ler bancos no formato do spss (.sav)
library(readxl) # para ler bancos no formato do excel (.xls/xlsx)

dass <- read_sav("dass42.sav")

dass <- read_excel("dass42.xlsx")

dass <- read.csv(file.choose(), sep = ",") # file.choose() é uma função que permite escolher arquivos

# mesmos bancos, usados para voltar ao banco inicial caso "dass" quebre
dass <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/Estrutura%20de%20dados/Dados/dass42.csv", sep = "\t")
bancodass <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/Estrutura%20de%20dados/Dados/dass42.csv", sep = "\t")

View(dass)

names(dass) # quais as colunas?

str(dass) # qual a estrutura de dass?


# dplyr


library(dplyr) # lendo dplyr
dass <- bancodass

# transformações
dass <- dass %>%
  select(age, everything()) # colocar "age" no início
names(dass)

dass <- dass %>%
  select(age, everything(), -country:orientation) # excluir as colunas de 'country' a 'orientation'

dass <- dass %>%
  select(idade = age, everything()) # renomeando 'age' para 'idade'

dass <- dass %>%
  select(everything(),
         -starts_with("T"), -starts_with("V"), # excluindo apenas as variáveis que começam com 'T' ou 'V'
         -ends_with("I"))  # excluindo apenas as variáveis que terminam com 'I' maiúsculo

names(dass)

# selecionando apenas as variáveis que queremos

# dass <- dass %>%
#  select(Q1A, Q2A, Q3A, Q4A, Q5A) # demoraria muito para escrever todas as variáveis que terminam com A

dass <- dass %>%
  select(starts_with("Q") & ends_with("A"))

str(dass) # e como ficou?

dass <- dass %>%
  select(dass_ = starts_with("Q"))

str(dass) # como ficou?



# computando novas variáveis

recode <- function(x)
{
  if (x > 0) {x = x - 1}
}

dass <- dass %>%
  mutate_at(vars(starts_with("dass")), recode)

str(dass)

# missings
install.packages("Amelia", dependencies = T)
library(Amelia)
missmap(dass)

# criando novas 
# arrange
# filter
# mutate
## transmute
?recode
library(skimr)
