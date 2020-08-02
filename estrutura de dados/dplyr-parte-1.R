################## DPLYR PARTE 1 ###################

#' Autor: Gabriel R. R.

#' O código inicial, em R, está disponível nesse link: https://github.com/GabrielReisR/R/blob/master/estrutura%20de%20dados/dplyr-parte-2.R

#' Essa apresentação, em RMarkdown, está disponível nesse link: https://rpubs.com/reisrgabriel/dplyrPt1

#' Todo esse código pode ser rodado direto no R.
#' Tudo o que inicia com "#" ou "#'" são comentários, e não são computados pelo R.

####################################################


# Considerações iniciais ##########################


## Sobre o _dplyr_
#' O pacote *dplyr* possui várias funções interessantes que permitem:
#'
#' * Selecionar variáveis de maneira dinâmica e fácil.
#' * Criar novas variáveis a partir de variáveis antigas.
#' * Sumarizar vários valores em um só.
#' * Filtrar e agrupar variáveis de interesse a partir de condições específicas.
#'
#' Em suma, o *dplyr* é um pacote muito versátil e bastante útil para manipulação
#' de dados em objetos data.frame.

#' Para maiores informações sobre o dplyr: https://dplyr.tidyverse.org/


# Usando select() #################################


## ----Lendo o banco DASS42-----
dass <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/dass42.csv")

## ----Entendendo o banco-----
View(dass)


## ----Lendo dplyr, message=FALSE, warning=FALSE----
library(dplyr) # caso não o possua, instale assim: install.packages("dplyr")


## ----Fórmula base para uso de dplyr, eval=FALSE-----
# banco <- banco %>%
#   funcao()
#'
#' O indicador `%>%` se chama pipe, ou cano em português. Ele nos permite
#' acessar o banco diretamente, e a partir disso realizar as mudanças que desejamos.
#'
#' Dica: o comando rápido para o pipe é `Ctrl + Shift + M`.
#'
#' Vamos fazer algo simples: colocar a variável age (idade) para o início.


## ----Trocando a posição de age
dass <- dass %>%
  select(age, everything())

View(dass) # Veja como 'age' agora é a primeira coluna!

#' Usamos `select()` para selecionar a variável, nomeando-a sem aspas pois já 
#' estamos acessando o banco (por causa do pipe `%>%`).
#' Depois disso, colocamos age no início. 
#' Utilizamos a função `everything()` que coloca o restante das variáveis após a primeira.
 
 
## ----Excluindo colunas country até orientation----
names(dass) # nomes das colunas atuais da dass

dass <- dass %>%
  select(everything(), -c(country:orientation)) # excluir as colunas de 'country' à 'orientation'

names(dass) # Não existe mais as colunas de 'country' à 'orientation'

#' Colocamos o sinal de menos `-` na frente das colunas que queremos excluir.
#' Especificamos o intervalo de colunas de 'country' até 'orientation' (`country:orientation`).
#' Concatenamos essas várias colunas em um único objeto usando `c()`.


## ----Renomeando com select() age para idade-----
#' Agora vamos renomear a coluna age para ter o nome idade. Para fazer isso, 
#' basta seguir a fórmula: `novo nome = nome antigo`. Ou seja, falamos para o R:
#' "atribua a essa nova variável o mesmo valor da variável antiga".

dass <- dass %>%
  select(idade = age, everything())

View(dass) # veja como idade tomou o lugar de age


## ----Renomeando com rename() idade para age-----
#' Podemos fazer isso também com rename. Vamos agora utilizar o processo inverso,
#' de 'idade' para 'age':

dass <- dass %>%
  rename(age = idade) # note que somente escrevemos as colunas que desejamos modificar

View(dass) # veja como age tomou o lugar de idade


## ----Usando starts, ends e contains-----
#' `starts_with()`: escolhe colunas que comecem com uma string.
#' `ends_with()`: escolhe colunas que terminem com uma string.
#' `contains()`: escolhe colunas que contenham uma string.


dass <- dass %>%
  select(everything(), # embora esteja sendo usado, não é necessário para essa função
         -starts_with("T"), # excluindo apenas as variáveis que começam com 'T'
         -starts_with("V"), # excluindo apenas as variáveis que começam com 'V'
         -ends_with("I"), # excluindo apenas as variáveis que terminam com 'I'
         contains("Q")) # selecionando apenas as variáveis que contenham 'Q'

names(dass) # Vamos ver quais nomes sobraram!


## ----Selecionando as respostas à DASS-----
#' As respostas à DASS42 estão presentes em todas as colunas que possuem "Q" no 
#' início e que terminam com "A".


dass <- dass %>%
  select(starts_with("Q") & ends_with("A")) # note a utilização do valor '&'


## ----Renomeando todas as variáveis----
#' Vamos renomear dinamicamente todas essas variáveis, dando o nome de _dass_n_ 
#' (dass + número do item) ao invés de QnA, como está agora. Vamos ver como estão
#' os nomes das colunas do nosso banco usando `names()`.


dass <- dass %>%
  select(dass_ = starts_with("Q")) # dass_ será o nome de todas as variáveis que comecem com "Q"

names(dass) # permite ver os nomes das colunas de dass


## ----Recalculando escores da DASS----
#' Antes de começar o cálculo, vamos lembrar que a DASS é respondida de 0 a 3,
#' e aqui temos resposta de 1 a 4. Isso é importante pois os pontos de corte para
#' a classificação de severidade partem de escores brutos das respostas.
#'
#' Assim, precisamos que:
#' Todas as variáveis respondidas com 1 sejam 0
#' Todas as variáveis respondidas com 2 sejam 1
#' Todas as variáveis respondidas com 3 sejam 2
#' Todas as variáveis respondidas com 4 sejam 3
#' 
#' Ou seja, precisamos que x seja x - 1.
 

dass <- dass - 1 # isso já resolve!

View(dass) # vamos ver os casos novamente


# Usando mutate() #################################


## ----Calculando escores-----
#' Cada participante, cada linha (ou **row** em inglês), terá os valores do nível
#' de depressão, ansiedade e estresse calculados como abaixo.
#' 
#' depressao: soma das colunas dass_2, dass_5, dass_12, dass_13, dass_16, dass_17, dass_20, dass_23, dass_25, dass_26, dass_31, dass_32, dass_36, dass_41
#' ansiedade: soma das colunas dass_1, dass_6, dass_8, dass_10, dass_11, dass_14, dass_21, dass_22, dass_27, dass_28, dass_34, dass_37, dass_40, dass_42
#' estresse: soma dos valores das colunas dass_3, dass_4, dass_7, dass_9, dass_15, dass_18, dass_19, dass_24, dass_29, dass_30, dass_33, dass_35, dass_38, dass_39
#' 
#' Para acessar o valor de cada linha para fazer esse cálculo - ou seja, para que
#' a soma das colunas diga respeito a cada um dos participantes - vamos utilizar
#' o verbo `rowwise()` antes de realizar o cálculo. Fica assim:


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

View(dass)


## ----Classificando nível de severidade----
#' Agora que temos os escores de cada pessoa na escala DASS42, vamos classificar 
#' esses escores por nível de gravidade/severidade.
#' Para isso, existe uma função bem útil que se chama `case_when`. Especificamos
#' uma condição baseada em outra variável, e assim que essa condição é atendida,
#' determinado valor é criado. Vamos utilizá-la dentro de `mutate()` para criar
#' nossas classificações.


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


#' A função acima criou três novos objetos (nivel_dep/ans/est) baseando-se nos 
#' valores de suas respectivas colunas. `case_when()` considera a primeira condição
#' e atribui o valor que queremos a essa condição. No primeiro caso, quando a variável
#' depressao for menor que 10 atribui-se a essa nova coluna o valor "Normal":
#' `depressao < 10 ~ "Normal"`. Para fornecer as outras condições, basta colocar
#' uma vírgula e continuar.
#' 
#' Para valores que fogem ao que a função consegue oferecer, poderia-se criar a 
#' condição `TRUE ~ .`, atribuindo um valor específico caso nenhuma outra condição
#' satisfaça o que está sendo pedido.


## ----Transformando em fatores-
#' Assim que criados os níveis, podemos transformar essas novas variáveis em fatores.
#' Isso pode ser feito diretamente com R. Vamos criar um hiperparâmetro chamado 'nivelSeveridade.'


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

View(dass) # vamos ver os novos casos


## ----Quantas pessoas possuem nível de dep, ans e est de severo para cima?-----
#' Vamos ver quantos participantes (`nrow()`) possuem nível de depressão, ansiedade
#' e estresse considerados como "Severo" ou "Extremamente Severo". Vamos adicionar
#' essas pessoas ao novo banco de dados chamado _casosGraves_.
 
 
casosGraves <- dass %>% # criando um novo banco de dados chamado CasosGraves
  filter(nivel_dep == "Severo" | nivel_dep == "Extremamente Severo",
         nivel_ans == "Severo" | nivel_ans == "Extremamente Severo",
         nivel_est == "Severo" | nivel_est == "Extremamente Severo")


nrow(casosGraves) # quantos casos nesse banco?
View(casosGraves) # vamos ver os casos

################################################# FIM