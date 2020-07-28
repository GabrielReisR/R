library(tidyverse)

# lendo bancos
dass <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/Import%20e%20diagn/Dados/dass42.csv", sep = "\t")
bancodass <- dass
dass <- bancodass
# select verb
dass <- dass %>%
  select(age, everything())


dass <- dass %>%
  select(everything(), -c(country:orientation))  # excluindo country


dass <- dass %>%
  select(idade = age, everything())

## ends_starts_contains
dass <- dass %>%
  select(everything(), # embora esteja sendo usado, não é necessário para essa função
         -starts_with("T"), # excluindo apenas as variáveis que começam com 'T'
         -starts_with("V"), # excluindo apenas as variáveis que começam com 'V'
         -ends_with("I"), # excluindo apenas as variáveis que terminam com 'I'
         contains("Q"))


######
dass <- bancodass
dass <- dass %>%
  select(starts_with("Q") & ends_with("A"))

# renomear
dass <- dass %>%
  select(dass_ = starts_with("Q")) %>% # dass_ será o nome de todas as variáveis que comecem com "Q"
  glimpse()


# mutate()

# recalculando
dass <- dass %>%
  mutate_at(vars(dass_1:dass_42), ~ifelse(. == 1, 0, .)) %>% 
  mutate_at(vars(dass_1:dass_42), ~ifelse(. == 2, 1, .)) %>% 
  mutate_at(vars(dass_1:dass_42), ~ifelse(. == 3, 2, .)) %>% 
  mutate_at(vars(dass_1:dass_42), ~ifelse(. == 4, 3, .))


# escores
dass <- dass %>%
  rowwise() %>% # para o cálculo ser realizado em cada linha
  mutate(
    # criando a variável 'depressao'
    depressao = sum(dass_2, dass_5, dass_12, dass_13, dass_16, dass_17, dass_20, dass_23, dass_25, dass_26, dass_31, dass_32, dass_36, dass_41),
    
    # criando a variável 'ansiedade'
    ansiedade = sum(dass_1, dass_6, dass_8, dass_10, dass_11, dass_14, dass_21, dass_22, dass_27, dass_28, dass_34, dass_37, dass_40, dass_42),
    
    # criando a variável 'estresse'
    estresse = sum(dass_3, dass_4, dass_7, dass_9, dass_15, dass_18, dass_19, dass_24, dass_29, dass_30, dass_33, dass_35, dass_38, dass_39)
  )


# classificação
dass <- dass %>%
  mutate(
    # classificação do nível de depressão
    nivel_dep = case_when(depressao < 10 ~ "Normal",
                          depressao >= 10 & depressao < 14 ~ "Leve",
                          depressao >= 14 & depressao < 21 ~ "Moderado",
                          depressao >= 21 & depressao < 28 ~ "Severo",
                          depressao >= 28 ~ "Extremamente Severo"),
    # classificação do nível de ansiedade
    nivel_ans = case_when(ansiedade < 8 ~ "Normal",
                          ansiedade >= 8 & ansiedade < 10 ~ "Leve",
                          ansiedade >= 10 & ansiedade < 15 ~ "Moderado",
                          ansiedade >= 15 & ansiedade < 20 ~ "Severo",
                          ansiedade >= 20 ~ "Extremamente Severo"),
    # classificação do nível de estresse
    nivel_est = case_when(estresse < 15 ~ "Normal",
                          estresse >= 15 & estresse < 19 ~ "Leve",
                          estresse >= 19 & estresse < 25 ~ "Moderado",
                          estresse >= 25 & estresse < 34 ~ "Severo",
                          estresse >= 34 ~ "Extremamente Severo")
  )

# como fator - código base
nivelSeveridade <- c("Normal", "Leve", "Moderado", "Severo", "Extremamente Severo")

dass$nivel_dep <- dass$nivel_dep %>% as.factor # transformar em fator
dass$nivel_dep <- factor(dass$nivel_dep,
                         levels = nivelSeveridade, # colocar em ordem
                         labels = nivelSeveridade) # colocar em ordem

dass$nivel_ans <- dass$nivel_ans %>% as.factor  # transformar em fator
dass$nivel_ans <- factor(dass$nivel_ans, 
                         levels = nivelSeveridade, # colocar em ordem
                         labels = nivelSeveridade) # colocar em ordem

dass$nivel_est <- dass$nivel_est %>% as.factor # transformar em fator
dass$nivel_est <- factor(dass$nivel_est,
                         levels = nivelSeveridade, # colocar em ordem
                         labels = nivelSeveridade) # colocar em ordem


# criando "casosGraves"
casosGraves <- dass %>% # criando um novo banco de dados chamado CasosGraves
  filter(nivel_dep == "Severo" | nivel_dep == "Extremamente Severo",
         nivel_ans == "Severo" | nivel_ans == "Extremamente Severo",
         nivel_est == "Severo" | nivel_est == "Extremamente Severo")

glimpse(casosGraves)
