########### TIDYR PARTE 2 ##########

#' Autor: Gabriel R. R.

#' O código inicial, em R, está disponível nesse link: https://github.com/GabrielReisR/R/blob/master/estrutura%20de%20dados/tidyr-parte-2.R

#' Essa apresentação, em RMarkdown, está disponível nesse link: https://rpubs.com/reisrgabriel/tidyrPt2

#' Todo esse código pode ser rodado direto no R.
#' Tudo o que inicia com "#" ou "#'" são comentários, e não são computados pelo R.

####################################################
library(dplyr) # lendo dplyr

# dados
biblios_original <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/libraries.csv")

biblios_original <- biblios_original %>%
  rename(id = X)

head(biblios_original)

# Limpando nome das colunas ########################

biblios_snake <- biblios_original %>% # note o uso do pipe
  clean_names() # se n?o dermos nenhum argumento, então 'case = snake'

names(biblios_snake)

# Outras versões:

# lowerCamel
biblios_lowerCamel <- biblios_original %>% # note o uso do pipe
  clean_names(case = "lower_camel")

names(biblios_lowerCamel)

# UpperCamel
biblios_UpperCamel <- biblios_original %>% # note o uso do pipe
  clean_names(case = "upper_camel")

names(biblios_UpperCamel)

# screaming_snake
biblios_SCREAMING_SNAKE <- biblios_original %>% # note o uso do pipe
  clean_names(case = "screaming_snake")

names(biblios_SCREAMING_SNAKE)

# lowerUPPER
biblios_lowerUPPER <- biblios_original %>% # note o uso do pipe
  clean_names(case = "lower_upper")

names(biblios_lowerUPPER)

# UPPERlower
biblios_UPPERlower <- biblios_original %>% # note o uso do pipe
  clean_names(case = "upper_lower")

names(biblios_UPPERlower)

# Versão final

biblios <- biblios_snake # basta dar a biblios o valor de biblios_snake
names(biblios_snake)


# Limpando missings ################################
library(Amelia)
library(tidyr)

# lendo os dados
url <- "https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/biblios.csv"
data <- read.csv(url)[,- 1]

# visualizando dados
head(data)


# drop_na()


# Excluindo todas linhas com missing

data <- tidyr::drop_na(data) # excluindo com drop_na()

head(data) # primeiros casos
nrow(data) # quantas linhas?

# Excluindo todas as linhas com missing em total_usuarios

data <- read.csv(url)[,- 1] # relendo o banco inicial

data <- tidyr::drop_na(data, total_usuarios)

head(data) # mostra os primeiros casos
nrow(data) # quantas linhas?


# fill_na()


# Preenchendo observações missing PARA CIMA
data <- read.csv(url)[,- 1] # relendo o banco inicial

library(tidyr)
data <- data %>%
  fill(gastos, # coluna 1 a ser preenchida
       total_trabalham, # coluna 2 a ser preenchida
       total_usuarios, # coluna 3 a ser preenchida
       .direction = "up") # preenche de baixo PARA CIMA ('up'))

#' Com `.direction = "up"`, os valores completos passaram para cima.
#' Por exemplo, em *gastos*, na primeira linha, Afghanistan recebeu o valor de 
#' *gastos* de Albania (segunda linha).

head(data) # mostra os primeiros casos
nrow(data) # quantas linhas?

# Preenchendo observações missing PARA BAIXO
data <- read.csv(url)[,- 1] # relendo o banco inicial

library(tidyr)
data <- data %>%
  fill(gastos,
       total_trabalham,
       total_usuarios,
       .direction = "down") # preenche de baixo PARA CIMA ('up'))

head(data) # mostra os primeiros casos
nrow(data) # quantas linhas?

#' Note que na primeira linha da coluna *gastos* é `NA`: isso porque não existe 
#' nenhum valor acima dela para a substituir.


#' Poderíamos também especificar outros dois valores em `.direction`:
#' `.direction = "updown"`: primeiro vai para cima, depois para baixo, e assim por diante.
#' `.direction = "downup"`: primeiro vai para baixo, depois para cima, e assim por diante.


# replace_na()


# Trocando pela média com replace_na
data <- read.csv(url)[,- 1] # relendo o banco inicial

library(tidyr) # lendo tidyr

data <- data %>%
  replace_na(list(
    gastos = mean(data$gastos, na.rm = T),
    # NAs se tornam média
    total_trabalham = floor(mean(data$total_trabalham, na.rm = T)),
    # NAs se tornam média
    total_usuarios = floor(mean(data$total_usuarios, na.rm = T)) 
    # NAs se tornam média
  ))

head(data)

#' Perceba que aqui é um pouco mais complicado. Isso porque precisamos:
#' * Definir nossa variável depois de abrir uma lista.
#' * Adicionar `=`e começar a especificar qual valor os missings dessa coluna receberão.
#' * Já que as duas últimas colunas da função contam o número de pessoas, adicionei 
#' na frente a função `floor()`, que arredonda esse valor para baixo.

#' Olhemos para o resultado agora. Basta olhar para *total_trabalham* para vermos
#' que a média talvez não seja a melhor representação de tendência central dessa
#' variável. O valor novo para as linhas que continham missing (1, 4 e 6) passou
#' a ser 5002, o que não parece ser a realidade desses países.

#' Vimos o problema de se substituir pela média. Ela é facilmente influenciada por
#' valores extremos.

# Trocando pela mediana com replace_na
data <- read.csv(url)[,- 1] # relendo o banco inicial

library(tidyr) # lendo tidyr

data <- data %>%
  replace_na(list(
    gastos = median(data$gastos, na.rm = T),
    # NAs se tornam média
    total_trabalham = floor(median(data$total_trabalham, na.rm = T)),
    # NAs se tornam média
    total_usuarios = floor(median(data$total_usuarios, na.rm = T)) 
    # NAs se tornam média
  ))

head(data)

#' O novo valor para os missings de *total_trabalham* agora é 175. O valor novo 
#' para as linhas que continham missing em gastos passou a ser R$1.810.863, o que 
#' parece estar mais adequado à realidade dos países que estamos vendo aqui. Já 
#' os missings de *total_usuarios* receberam o valor de 316.202, também mais 
#' condizente com os dados que estamos explorando.

# Imputação por regressão ################################
# lendo os dados
url <- "https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/biblios.csv"
data <- read.csv(url)[,- 1]

# visualizando dados
head(data)

#' Podemos fazer isso utilizando-se da regressão linear, um método que busca estimar 
#' os valores de y a partir de variáveis x.
#' Em todos os casos, possuímos dois valores numéricos que não se alteram:
#' *total_biblios* e *total_volumes*.

#' Para fazer uma imputação simples com regressão, não vamos utilizar nenhum pacote,
#' vamos criar a nossa própria função (o que aprendi a fazer com
#' [esse ótimo capítulo sobre missings](http://www.stat.columbia.edu/~gelman/arm/missing.pdf)). 
 
# Criando modelos de regressão e função
# modelos de regressão
regressao_gastos <- lm(gastos ~ total_biblios + total_volumes - 1,
                       data = data)
regressao_trabalham <- lm(total_trabalham ~ total_biblios + total_volumes - 1,
                          data = data)
regressao_usuarios <- lm(total_usuarios ~ total_biblios + total_volumes - 1,
                         data = data)

# criando predição dos valores para cada coluna
gastos_pred <- predict(regressao_gastos, data) # coluna gastos
trabalham_pred <- predict(regressao_trabalham, data) # coluna gastos
usuarios_pred <- predict(regressao_usuarios, data) # coluna gastos

# criando a função
imputar <- function(coluna, pred){
  ifelse(is.na(coluna), pred, coluna)
}

#' * Criamos o modelo para cada coluna com a função `lm()`
#' * Aqui, a primeira variável é a ser predita, e as outras são os valores que
#' vamos utilizar para predizer a variável. No primeiro caso, quando escrevemos 
#' `gastos ~ total_biblios + total_volumes - 1` estamos querendo dizer que os 
#' valores de *gastos* serão preditos pelos valores das colunas *total_biblios* e 
#' *total_volumes*. O `- 1` significa que nós estamos retirando desse cálculo o 
#' valor do intercepto, que nesses casos eram bem significativos.
#' * Predizemos com esse modelo os valores de cada linha usando a função `predict()`
#' * Criamos a função `imputar()`
#' * Essa função vai receber uma coluna, depois vai verificar se o valor em que 
#' ela está dessa coluna é um missing. A partir disso, se o valor for missing, 
#' o valor a ser imputado será o da fórmula que passamos para ela, se não o valor 
#' continuará igual.

# Imputação por regressão
# imputando valores
data$gastos <- imputar(data$gastos, gastos_pred)
data$total_trabalham <- floor(imputar(data$total_trabalham, trabalham_pred))
data$total_usuarios <- floor(imputar(data$total_usuarios, usuarios_pred))

head(data)

#' Espero que eu tenha ajudado a entender um pouco mais sobre a força do _tidyr_
#' e sobre como lidar com missings.
#' 
#' Por enquanto é isso! :) 

################################################# FIM














