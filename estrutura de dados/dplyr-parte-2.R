################## DPLYR PARTE 2 ###################

#' Autor: Gabriel R. R.

#' O código inicial, em R, está disponível nesse link: https://github.com/GabrielReisR/R/blob/master/estrutura%20de%20dados/dplyr-parte-2.R

#' Essa apresentação, em RMarkdown, está disponível nesse link: https://rpubs.com/reisrgabriel/dplyrPt2

#' Todo esse código pode ser rodado direto no R.
#' Tudo o que inicia com "#" ou "#'" são comentários, e não são computados pelo R.

####################################################

## ----Bancos fictícios para bind_cols()----------------------------------------------------------------
col1 <- c(letters[1:5]) # letras de 1 a 5
col2 <- sample(c(1:5), size = 5, replace = FALSE) # numeros de 1 a 5
col3 <- sample(c(100:2500), size = 5, replace = TRUE) # numeros aleatorios de 100 a 2500
col4 <- sample(c(100:2500), size = 5, replace = TRUE) # numeros aleatorios de 100 a 2500

dataframe1 <- data.frame(col1, col2) # criando df1
dataframe2 <- data.frame(col3, col4) # criando df2

dataframe1 
dataframe2


## ----Unindo com bind_cols(), message=FALSE, warning=FALSE---------------------------------------------
library(dplyr) # lendo dplyr
dataframe_completo <- bind_cols(dataframe1, dataframe2) # usando bind_cols()

dataframe_completo


## ----Unindo com bind_rows()---------------------------------------------------------------------------
lista <- list(col1 = "a", col2 = 4, col3 = 1028, col4 = 255, col5 = 9902)
dataframe_completo <- bind_rows(dataframe_completo, lista)

dataframe_completo


## ----Lendo os três mini-bancos, message=FALSE, warning=FALSE------------------------------------------
dass_dep <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/dass_dep.csv", sep = ",")
dass_ans <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/dass_ans.csv", sep = ",")
dass_est <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/dass_est.csv", sep = ",")


## ----Excluindo respostas à DASS dos bancos------------------------------------------------------------
dass_dep <- dass_dep %>% 
  select(-X) # excluindo a coluna X

dass_ans <- dass_ans %>% 
  select(id_ans, escore_total, nivel) # selecionando id_ans, escore_total e nivel

dass_est <- dass_est %>% 
  select(id_est, escore_total, nivel) # selecionando id_est, escore_total e nivel

names(dass_dep) # nomes das colunas do banco 'dass_dep'
names(dass_ans) # nomes das colunas do banco 'dass_ans'
names(dass_est) # nomes das colunas do banco 'dass_est'


## ----Full join dep e ans------------------------------------------------------------------------------
dass_total <- dass_dep %>% # sempre se começa a partir de um banco
  full_join(dass_ans, by = c("id" = "id_ans"), suffix = c("_dep", "_ans"))

dass_total


## ----Full join com est--------------------------------------------------------------------------------
dass_total <- dass_total %>% 
  full_join(dass_est, by = c("id" = "id_est")) %>% 
  rename(escore_total_est = escore_total, # renomear a coluna escore_total
         nivel_est = nivel) # renomear a coluna nivel

dass_total # full join concluído!


## ----Inner join dep ans e est-------------------------------------------------------------------------
dass_inner <- dass_dep %>% 
  inner_join(dass_ans, by = c("id" = "id_ans"), suffix = c("_dep", "_ans")) %>% 
  inner_join(dass_est, by = c("id" = "id_est")) %>% 
  rename(escore_total_est = escore_total, # renomear a coluna escore_total
         nivel_est = nivel) # renomear a coluna nivel

dass_inner


## ----Left join dep ans e est--------------------------------------------------------------------------
dass_left <- dass_dep %>% 
  left_join(dass_ans, by = c("id" = "id_ans"), suffix = c("_dep", "_ans")) %>% 
  left_join(dass_est, by = c("id" = "id_est")) %>% 
  rename(escore_total_est = escore_total, # renomear a coluna escore_total
         nivel_est = nivel) # renomear a coluna nivel

dass_left


## ----Right join dep ans e est-------------------------------------------------------------------------
dass_right <- dass_dep %>% 
  right_join(dass_ans, by = c("id" = "id_ans"), suffix = c("_dep", "_ans")) %>% 
  right_join(dass_est, by = c("id" = "id_est")) %>% 
  rename(escore_total_est = escore_total, # renomear a coluna escore_total
         nivel_est = nivel) # renomear a coluna nivel

dass_right


## ----Semi join dep ans e est--------------------------------------------------------------------------
dass_semi <- dass_dep %>% 
  semi_join(dass_ans, by = c("id" = "id_ans")) %>% 
  semi_join(dass_est, by = c("id" = "id_est"))

dass_semi


## ----Anti join dep ans e est--------------------------------------------------------------------------
dass_anti <- dass_dep %>% 
  anti_join(dass_ans, by = c("id" = "id_ans")) %>% 
  anti_join(dass_est, by = c("id" = "id_est"))

dass_anti

