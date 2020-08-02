######## IMPORTAÇÃO E DIAGNÓSTICOS INICIAIS ########

#' Autor: Gabriel R. R.

#' O código inicial, em R, está disponível nesse link: https://github.com/GabrielReisR/R/blob/master/estrutura%20de%20dados/import-e-diagn.R

#' Essa apresentação, em RMarkdown, está disponível nesse link: https://rpubs.com/reisrgabriel/importdiagn

#' Todo esse código pode ser rodado direto no R.
#' Tudo o que inicia com "#" ou "#'" são comentários, e não são computados pelo R.

####################################################


# Considerações iniciais ##########################


#' Importando dados
#' A primeira tarefa quando se trata de manipular um banco de dados consiste na 
#' importação correta dos dados ao software de programação.
#' 
#' Vamos aprender a importar 3 tipos comuns de dados utilizando o R:
#' 
#' - *.sav*: dados do SPSS; vamos utilizar o pacote _haven_.
#' - *.xls/.xlsx*: tabelas do excel; vamos utilizar o pacote _readxl_.
#' - *.csv*: "comma-separated values"; pode ser importado com o pacote _readr_ e com o pacote base do R.


## Importando .sav
#' Para importar um arquivo do SPSS (Statistical Package for the Social Sciences)
#' vamos utilizar o pacote _haven_. Isso facilita a importação já que não precisaríamos
#' fazer a conversão do arquivo .sav para um arquivo .csv, por exemplo.
 
 
## ----Instalando haven----
install.packages("haven", dependencies = T) # tenho como prática baixar pacotes associados sempre, por isso "dependencies = TRUE"


## ----Lendo sav com haven----
#' Para utilizar _haven_, basta ler o pacote e executar `read_sav("dataset")` para
#' criar um objeto com o banco de dados.
#' 
#' Utilizarei um exemplo com um banco que pode ser encontrado aqui: https://github.com/GabrielReisR/R/blob/master/estrutura%20de%20dados/dados/dass42.sav
#' 
#' Você pode baixar o arquivo no link acima e tentar também :)


library(haven) # leitura do haven

dass_sav <- read_sav("dass42.sav") # importando um .sav

View(dass_sav) # vamos ver como fica o nosso banco


## Importando .xls/xlsx
#' Para importar um arquivo em Excel vamos utilizar o pacote _readxl_, que faz essa
#' manipulação muito tranquilamente.


## ----Instalando readxl----
install.packages("readxl", dependencies = T) # tenho como prática baixar pacotes associados sempre, por isso "dependencies = TRUE"


## ----Lendo excel com readxl----
#' Para utilizar _readxl_, basta ler o pacote e executar `read_excel("dataset")`
#' para criar um objeto com o banco de dados.
#' Utilizarei um exemplo com um banco que pode ser encontrado aqui: https://github.com/GabrielReisR/R/blob/master/estrutura%20de%20dados/dados/dass42.xlsx
#' 
#' Você pode baixar o arquivo no link acima e tentar também :)


library(readxl) # leitura do readxl

dass_excel <- read_excel("dass42.xlsx") # importando um .xlsx

View(dass_excel) # vamos ver como fica o nosso banco



## Importando .csv
#' Uma situação um pouco mais comum. O R já permite que façamos isso com a função
#' `read.csv`. O pacote _readr_ facilita o uso dessa função implementar outros argumentos
#' adicionais que facilitariam na conversão do .csv para o R, então vamos apresentá-lo.
#' Durante o restante, vamos utilizar apenas o de base (`read.csv`).
 
 
## ----Instalando readr----
install.packages("readr", dependencies = T) # tenho como prática baixar pacotes associados sempre, por isso "dependencies = TRUE"


## ----Lendo .csv com readr----


library(readr) # lendo o pacote readr no R

dass <- read_csv("https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/dass42.csv")

View(dass) # vamos ver como fica o nosso banco


## ----Lendo .csv com função base do R----
dass <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/dass42.csv", sep = ",")

str(dass) # vamos ver como fica o nosso banco

#' O argumento `sep = ","` informa à função `read.csv` que o arquivo está separado 
#' por vírgula. Para entender a separação do arquivo, basta visualizá-lo.
#' Esse argumento não precisa ser especificado, então se você for apenas importar
#' um banco já delimitado por vírgulas, basta digitar `read.csv("dataset")`

## ----Lendo dass----
dass <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/dass42.csv", sep = ",")


# Explorando o banco de dados ######################


#' Assim que carregado, um banco de dados precisa ser entendido e visualizado. Suas
#' limitações acessadas e modificações feitas de acordo com o objetivo da análise.
 

## Funções úteis

#' Para entender o banco, podemos utilizar:
#' - `View()`: abre uma janela para visualização dos dados.
#' - `names()`: apresenta os nomes de todas as colunas do dataset.
#' - `str()`: apresenta a estrutura do dataset.
#' - `head()`: primeiros casos do banco de dados.
#' - `tail()`: últimos casos do banco de dados.
#' - `glimpse()`: uma visualização limitada de algumas variáveis e alguns casos.
#' - `skim()`: análises descritivas iniciais (incluindo mini-histogramas) de variáveis númericas.


## ----Abrindo uma janela com View()----
#' `View()` abre uma janela dentro do próprio RStudio para visualização dos dados do banco.


View(dass) # útil para explorar todos casos e/ou todas variáveis


## ----Vendo o nome de todas as variáveis com names()----
#' `names()` retorna o nome das colunas do banco.


names(dass) # útil para uma lida rápida nas variáveis contempladas pelo banco


## ----Estrutura com str()----
#' `str()` fornece uma lida rápida das variáveis e dos valores delas.
str(dass) # entender a estrutura do nosso objeto


## ----Vendo 5 primeiros casos com head()----
#' `head()` resulta nos valores dos primeiros casos. Podemos especificar quantos 
#' casos queremos com `n = `.


head(dass, n = 5) # útil para entender o tipo de resposta de cada variável em alguns casos


## ----Vendo 5 últimos casos com tail()----
#' `tail()` resulta nos valores dos últimos casos. Podemos especificar quantos casos 
#' queremos com `n = `.


tail(dass, n = 5) # útil para entender o tipo de resposta de cada variável em alguns casos


## glimpse() e skim()
#' Assim como em `str()`, vamos resumir os casos com mais duas funções. Para isso,
#' vamos instalar dois pacotes que vão nos auxiliar: o pacote dplyr e o pacote skimr.


## ----Entendendo as variáveis com glimpse()----


library(dplyr) # leitura do pacote dplyr, caso não tenha, instale: install.packages("dplyr")
glimpse(dass)


#' Uma visão bem mais completa das variáveis, sem dúvida. É bastante semelhante 
#' à função `str()` e produz um resultado mais organizado. Conseguimos entender 
#' tanto os primeiros casos quando o tipo de dados contido em cada coluna e seus 
#' respectivos nomes.


## ----Análises iniciais com skim()----


library(skimr)  # caso não tenha, instale: install.packages("skimr")
skim(dass)


#' `skim()` vai um passo além e fornece análises descritivas iniciais, junto com 
#' mini-histogramas, para todas as variáveis numéricas. Certamente ajuda na detecção 
#' de missing values.


## ----Utilizando missmap()----
#' Para visualização dos missings com Amelia, basta rodar `missingmap(dataset)`.


library(Amelia) # leitura do pacote Amelia; caso não tenha, instale: install.packages("Amelia")
missmap(dass)


#' Podemos perceber que não há nenhum missing computado nesse banco! Que maravilha :)
#' 
#' Por enquanto é isso! :)
 
################################################# FIM