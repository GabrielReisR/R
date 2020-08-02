biblios_original <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/libraries.csv")

biblios_original <- biblios_original %>%
  rename(id = x)

str(biblios_original)

library(dplyr) # lendo dplyr para usar a fun??o 'glimpse()' e renomear "id"

biblios_snake <- biblios_original %>% # note o uso do pipe
  clean_names() # se n?o dermos nenhum argumento, ent?o 'case = snake'

names(biblios_snake)

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


biblios <- biblios_snake # basta dar a biblios o valor de biblios_snake
names(biblios_snake)

library(tidyr)
biblios_zero_missing <- biblios %>% 
  drop_na() # nenhum argumento: qualquer linha que possua qualquer missing é excluída

missmap(biblios_zero_missing) # visualizando os missings

biblios_expenditures <- biblios %>% 
  drop_na(expenditures_us_dollars) # qualquer linha que possua missing nessa coluna é excluída

missmap(biblios_expenditures)
biblios_exp <- biblios_expenditures %>% # renomeando o banco
  relocate(total_librarians, # colocando como primeira coluna
           total_users, # colocando como primeira coluna
           everything()) # restante das variáveis



biblios_fill <- biblios_exp %>%
  fill(total_librarians,
       total_users)

missmap(biblios_fill)



mean_librarians <- mean(biblios_expenditures$total_librarians)
mean_users <- mean(biblios_expenditures$total_users)

biblios_replace <- biblios_expenditures %>% 
  replace_na(list(total_librarians = 5688.577, total_users = 9156959))


biblios_mutate <- biblios_expenditures %>% 
  mutate(
    total_librarians = ifelse(
      is.na(total_librarians), # há um valor missing?
      mean(total_librarians, na.rm = TRUE), # se sim, substituir por média da coluna
      total_librarians) # se não é missing, deixe como está
  ) 

missmap(biblios_mutateteste)