library(tidyverse)

# bind_cols()

# criando variáveis
col1 <- c(letters[1:5]) # letras de 1 a 5
col2 <- sample(c(1:5), size = 5, replace = FALSE) # numeros de 1 a 5
col3 <- sample(c(100:2500), size = 5, replace = TRUE) # numeros aleatorios de 100 a 2500
col4 <- sample(c(100:2500), size = 5, replace = TRUE) # numeros aleatorios de 100 a 2500

# criando data.frames
dataframe1 <- data.frame(col1, col2) # criando df1
dataframe2 <- data.frame(col3, col4) # criando df2

dataframe1 
dataframe2

# usando bind_cols()
dataframe_completo <- bind_cols(dataframe1, dataframe2) # usando bind_cols()

dataframe_completo



## DPLYR-JOINS

# lendo banco
dass_dep <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/Estrutura%20de%20dados/Dados/dass_dep.csv", sep = ",")
dass_ans <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/Estrutura%20de%20dados/Dados/dass_ans.csv", sep = ",")
dass_est <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/Estrutura%20de%20dados/Dados/dass_est.csv", sep = ",")

# limpeza
dass_dep <- dass_dep %>% 
  select(-X) # excluindo a coluna X

dass_ans <- dass_ans %>% 
  select(id_ans, escore_total, nivel) # selecionando id_ans, escore_total e nivel

dass_est <- dass_est %>% 
  select(id_est, escore_total, nivel) # selecionando id_est, escore_total e nivel

# nomes
names(dass_ans)
names(dass_ans)
names(dass_est)


# full_join1
dass_total <- dass_dep %>% # sempre se começa a partir de um banco
  full_join(dass_ans, by = c("id" = "id_ans"), suffix = c("_dep", "_ans")) %>% 
  glimpse() # ver a estrutura do banco

# full_join2
dass_total <- dass_total %>% 
  full_join(dass_est, by = c("id" = "id_est")) %>% 
  rename(escore_total_est = escore_total, # renomear a coluna escore_total
         nivel_est = nivel) # renomear a coluna nivel

glimpse(dass_total)


# inner_join
dass_inner <- dass_dep %>% 
inner_join(dass_ans, by = c("id" = "id_ans"), suffix = c("_dep", "_ans")) %>% 
  inner_join(dass_est, by = c("id" = "id_est")) %>% 
  rename(escore_total_est = escore_total, # renomear a coluna escore_total
         nivel_est = nivel) # renomear a coluna nivel

glimpse(dass_inner)


# left_join
dass_left <- dass_dep %>% 
  left_join(dass_ans, by = c("id" = "id_ans"), suffix = c("_dep", "_ans")) %>% 
  left_join(dass_est, by = c("id" = "id_est")) %>% 
  rename(escore_total_est = escore_total, # renomear a coluna escore_total
         nivel_est = nivel) # renomear a coluna nivel

glimpse(dass_left)


# right_join
dass_right <- dass_dep %>% 
  right_join(dass_ans, by = c("id" = "id_ans"), suffix = c("_dep", "_ans")) %>% 
  right_join(dass_est, by = c("id" = "id_est")) %>% 
  rename(escore_total_est = escore_total, # renomear a coluna escore_total
         nivel_est = nivel) # renomear a coluna nivel

glimpse(dass_right)

