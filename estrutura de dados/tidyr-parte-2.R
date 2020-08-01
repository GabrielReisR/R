######## IMPORTAÇÃO E DIAGNÓSTICOS INICIAIS ########

#' Autor: Gabriel R. R.

#' O código inicial, em R, está disponível nesse link: https://github.com/GabrielReisR/R/blob/master/estrutura%20de%20dados/import-e-diagn.R

#' Essa apresentação, em RMarkdown, está disponível nesse link: https://rpubs.com/reisrgabriel/importdiagn

#' Todo esse código pode ser rodado direto no R.
#' Tudo o que inicia com "#" ou "#'" são comentários, e não são computados pelo R.

####################################################

## ----Instalando haven, eval=FALSE---------------------------------------------------------------------
## install.packages("haven", dependencies = T) # tenho como prática baixar pacotes associados sempre, por isso "dependencies = TRUE"


## ----Lendo sav com haven------------------------------------------------------------------------------
library(haven) # leitura do haven

dass_sav <- read_sav("dass42.sav") # importando um .sav

str(dass_sav) # estrutura do objeto


## ----Instalando readxl, eval=FALSE--------------------------------------------------------------------
## install.packages("readxl", dependencies = T) # tenho como prática baixar pacotes associados sempre, por isso "dependencies = TRUE"


## ----Lendo excel com readxl---------------------------------------------------------------------------
library(readxl) # leitura do readxl

dass_excel <- read_excel("dass42.xlsx") # importando um .xlsx

str(dass_excel) # estrutura do objeto


## ----Instalando readr, eval = FALSE-------------------------------------------------------------------
## install.packages("readr", dependencies = T) # tenho como prática baixar pacotes associados sempre, por isso "dependencies = TRUE"


## ----Lendo .csv com readr-----------------------------------------------------------------------------
library(readr) # lendo o pacote readr no R

dass <- read_csv("https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/dass42.csv")

str(dass) # estrutura do objeto


## ----Lendo .csv com função base do R------------------------------------------------------------------
dass <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/dass42.csv", sep = ",")

str(dass) # estrutura do objeto


## ----Lendo dass---------------------------------------------------------------------------------------
dass <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/dass42.csv", sep = ",")


## ----Abrindo uma janela com View(), eval = FALSE------------------------------------------------------
## View(dass) # útil para explorar todos casos e/ou todas variáveis


## ----Vendo o nome de todas as variáveis com names()---------------------------------------------------
names(dass) # útil para uma lida rápida nas variáveis contempladas pelo banco


## ----Estrutura com str()------------------------------------------------------------------------------
str(dass) # entender a estrutura do nosso objeto


## ----Vendo 5 primeiros casos com head()---------------------------------------------------------------
head(dass, n = 5) # útil para entender o tipo de resposta de cada variável em alguns casos


## ----Vendo 5 últimos casos com tail()-----------------------------------------------------------------
tail(dass, n = 5) # útil para entender o tipo de resposta de cada variável em alguns casos


## ----Instalando dplyr, eval=FALSE---------------------------------------------------------------------
## install.packages("dplyr", dependencies = T) # manipulação de banco de dados


## ----Entendendo as variáveis com glimpse()------------------------------------------------------------
library(dplyr) # leitura do pacote dplyr
glimpse(dass)


## ----Instalando skimr, eval=FALSE---------------------------------------------------------------------
## install.packages("skimr", dependencies = T) # compreensão rápida de banco de dados


## ----Análises iniciais com skim()---------------------------------------------------------------------
library(skimr)
skim(dass)


## ----Instalando Amelia, eval=FALSE--------------------------------------------------------------------
## install.packages("Amelia", dependencies = T) # diagnóstico e manipulação de missings


## ----Utilizando missmap()-----------------------------------------------------------------------------
library(Amelia) # leitura do pacote Amelia
missmap(dass)

