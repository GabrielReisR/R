################## TIDYR PARTE 1 ###################

#' Autor: Gabriel R. R.

#' O código inicial, em R, está disponível nesse link: https://github.com/GabrielReisR/R/blob/master/estrutura%20de%20dados/dplyr-parte-2.R

#' Essa apresentação, em RMarkdown, está disponível nesse link: https://rpubs.com/reisrgabriel/dplyrPt1

#' Todo esse código pode ser rodado direto no R.
#' Tudo o que inicia com "#" ou "#'" são comentários, e não são computados pelo R.

####################################################


# Considerações iniciais ##########################

## Limpando bancos - de wide data para long data

#' Às vezes, os dados estão desorganizados, o que pode dificultar as análises.
#' 
#' Um banco bem organizado é um no qual:
#' 1. Cada célula é um valor único.
#' 2. Cada coluna é uma variável.
#' 3. Cada linha é uma observação.
#' 
#' Dados desorganizados, *untidy data*, quebram uma ou mais dessas regras acima.

## Sobre o _tidyr_

#' O _tidyr_ é um pacote criado pelo time do tidyverse com a função de organização
#' de um banco de dados.
#' 
#' **Ele existe para que as três regras acima sejam cumpridas**
#' Para maiores informações sobre o dplyr: 
#' 
#' * Documentação: https://cran.r-project.org/web/packages/tidyr/tidyr.pdf
#' * Página no tidyverse: https://tidyr.tidyverse.org/index.html
#' * Cheatsheet (folha de códigos): https://github.com/rstudio/cheatsheets/blob/master/data-import.pdf

## Banco a ser usado

#' Esse banco contém dados fictícios do número de telefonemas e cartas que passaram
#' pelas pequenas cidades citadas.

## ----Lendo untidy----
data_url <- "https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/untidy.csv"
untidy_inicial <- read.csv(data_url)


## ----Lendo dplyr e excluindo X----
library(dplyr)

untidy <- untidy_inicial %>%
  select(-c(1)) # excluindo primeira coluna

untidy


# Uma célula, um valor único #######################


#' Cada célula deve ser um valor único. Para ter a certeza de que nosso banco cumpra
#' isso, utilizaremos `separate()`. O primeiro grande erro do banco, como já citado,
#' está na computação da coluna *ano_1994_1995_1996*. Vamos usar a função `separate()`
#' para separar os valores da coluna *ano_1994_1995_1996*.
#'
#'`separate()` é bem simples, então vamos exemplificar fazendo:


## ----Separando colunas----
library(tidyr) # lendo tidyr

untidy <- untidy %>% 
  separate("ano_1994_1995_1996", # coluna a ser separada
           sep = " ", # o que separa uma observação de outra
           into = c("ano_1994", "ano_1995", "ano_1996"), # novas colunas
           convert = TRUE) # converter o nome da coluna para 'character'

#' Basta adicionar o nome da coluna atual (`"ano_1994_1995_1996"`), a separação
#' que existe entre as variáveis daquela coluna (nesse caso, um *espaço* `sep = " "`),
#' e quais as novas colunas que devem ser criadas (`into = c("ano_1994", "ano_1995", "ano_1996")`).
#' Pronto!
 

# Uma coluna, uma variável


#' Cada coluna deve ser uma variável. Para ter a certeza de que nosso banco cumpra
#' isso, utilizaremos `pivot_longer()`. Nos livraremos de **colunas** repetitivas
#' e alongaremos o banco de dados ao acrescentar mais linhas nele.Todos os anos
#' de coleta dizem respeito a apenas **uma** variável, a variável _ano_. Como sabemos
#' disso? Pois isso é algo que *varia* em cada respondente. Ao invés de termos uma
#' coluna para cada um dos anos, o ideal seria criar uma coluna *ano* para armazenar
#' todos esses anos.
#' 
#' A nossa nova coluna ano armazenará todos os nomes das colunas que representam
#' o *ano*. Já os valores dessas colunas serão armazenados em uma nova coluna chamada
#' de *casos*.
 

## ----Juntando os anos em uma só coluna----
untidy <- untidy %>% 
  pivot_longer(
    cols = ano_1990:ano_1996, # as colunas desse intervalo
    names_to = "ano", # terão seus nomes armazenados nessa nova coluna
    values_to = "casos") # e os seus valores armazenados nessa nova coluna

untidy


# Uma linha, uma observação ########################


#' Cada linha é uma observação só. Para ter a certeza de que nosso banco cumpra
#' isso, utilizaremos `pivot_wider()`. Nos livraremos de **linhas** repetitivas
#' e alargaremos o banco de dados ao acrescentar mais colunas nele.
#' 
#' *tipo* informa qual meio de comunicação essa cidade usou.
#' *casos* informa quantas vezes essa cidade usou esse meio.
#' 
#' O problema aqui é que temos duas linhas para uma observação só! Em 1990, Butte,
#' às 11h27, desde o ano anterior, havia enviado 4275 cartas e feito 3450 telefonemas.
#' 
#' A questão é que "cartas" e "telefonemas" são coisas diferentes, elas não são 
#' variáveis contidas em "tipo" (assim como os anos estão contidos _ano_, telefonemas
#' e cartas não estão contidas em _tipo_). Estamos alongando o banco sem necessidade,
#' já que estamos falando de coisas diferentes e poderíamos ter duas colunas para
#' cada uma dessas variáveis.
 
 
## ----Alargando o nosso banco----
untidy <- untidy %>%
  pivot_wider(
    names_from = tipo, # para criar as colunas, use os nomes que encontrar em 'tipo'
    values_from = casos # e coloque nessas colunas o valor que encontrar em 'casos'
  )

untidy


#' * Perceba que agora temos apenas uma linha para cada ano, ao invés de 2 linhas
#' para cada ano.
#' * Da mesma forma, 'casos' não é mais necessário, e nosso banco se tornou mais
#' fácil de ser lido.


# Unir valores

#' Uma coluna para cada variável e uma célula para um caso único. Aqui, a gente 
#' vai se preocupar com duas colunas, utilizando `unite()` para resolver esse probleminha
#' que temos.
#' 
#' Algo que ainda não conversamos sobre é a redundância das colunas *hora_coleta*
#' e *minutos_coleta*. Essa pode ser apenas uma coluna, não precisa ser duas.
#' 
#' Vamos criar uma nova coluna que vai se chamar _horario_coleta_.
#' Vamos juntar as duas com `unite()`.
 
 
## ----Juntando duas colunas----
untidy <- untidy %>% 
  unite(hora_coleta, minutos_coleta, # podemos escrever quantas colunas quisermos
        sep = ":", # separe os valores por ":"
        col = "horario_coleta") # o nome da nova coluna

untidy


#' * Iniciamos com a primeira coluna que queremos. O valor dessa coluna irá na frente
#' (`hora_coleta`).
#' * A segunda coluna informa o valor que irá em segundo lugar (`minutos_coleta`).
#' * Definimos uma separação para nossas variáveis. Nesse caso, tratando-se de horários,
#' preferi `sep = ":"`.
#' * É possível definir sem separação: nesse caso,  `sep = ""`.
#' * Em `col = "horario_coleta"`, definimos o nome da nossa coluna como horario_coleta.


#' Espero que eu tenha ajudado a entender um pouco mais sobre a força do _tidyr_.
#' 
#' Por enquanto é isso! :) 

################################################# FIM