library(tidyverse)


untidy_inicial <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/Estrutura%20de%20dados/Dados/untidy.csv", sep = ",")

head(untidy_inicial)


# limpeza inicial
untidy <- untidy_inicial %>% # limpeza inicial
  select(-X) %>% # excluindo X
  rename("1990" = X1990, # renomeando ano
         "1991" = X1991, # renomeando ano
         "1992" = X1992, # renomeando ano
         "1993" = X1993, # renomeando ano
         "1994_1995_1996" = X1994_1995_1996)



# separate()
untidy <- untidy %>% 
  separate("1994_1995_1996", sep = " ", into = c("1994", "1995", "1996"))


# gather()
untidy <- untidy %>% 
  gather(
    # todas as colunas que queremos juntar
    `1990`, `1991`, `1992`, `1993`, `1994`, `1995`, `1996`,
    # a chave, que é 'ano'
    key = "ano",
    # quais os valores que as colunas antigas possuíam? vamos chamar de "casos"
    value = "casos")

# reordenando
untidy <- untidy %>% 
  select(id, pessoa, ano, tipo, casos, everything()) # reordenando o banco

head(untidy, n = 10)

# spread()
untidy <- untidy %>%
  spread(
    key = tipo, # na coluna "tipo", temos nossas chaves
    value = casos) # na coluna "casos", os valores desses casos

head(untidy, n = 20)


# unite
untidy <- untidy %>% 
  unite(hora_coleta, minutos_coleta, sep = ":", col = "horario_coleta")

# comparação
untidy
untidy_inicial



