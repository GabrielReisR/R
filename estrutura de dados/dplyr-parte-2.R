################## DPLYR PARTE 2 ###################

#' Autor: Gabriel R. R.

#' O código inicial, em R, está disponível nesse link: https://github.com/GabrielReisR/R/blob/master/estrutura%20de%20dados/dplyr-parte-2.R

#' Essa apresentação, em RMarkdown, está disponível nesse link: https://rpubs.com/reisrgabriel/dplyrPt2

#' Todo esse código pode ser rodado direto no R.
#' Tudo o que inicia com "#" ou "#'" são comentários, e não são computados pelo R.

####################################################


# Considerações iniciais ###########################


## ----Bancos fictícios para bind_cols()----
#' Vamos começar com a situação mais simples: dois bancos de dados nos quais os 
#' casos estão ordenados e basta apenas juntá-los. Ou seja, o participante da linha
#' 1 no banco 1 é o mesmo participante da linha 1 no banco 2, e assim por diante.

col1 <- c(letters[1:5]) # letras de 1 a 5
col2 <- sample(c(1:5), size = 5, replace = FALSE) # numeros de 1 a 5
col3 <- sample(c(100:2500), size = 5, replace = TRUE) # numeros aleatorios de 100 a 2500
col4 <- sample(c(100:2500), size = 5, replace = TRUE) # numeros aleatorios de 100 a 2500

dataframe1 <- data.frame(col1, col2) # criando df1
dataframe2 <- data.frame(col3, col4) # criando df2

dataframe1 
dataframe2

## bind_cols()
## ----Unindo com bind_cols()----
#' Para juntar ambos os bancos pela sua posição, basta utilizar a função `bind_cols()`
#' presente no pacote _dplyr_. Ela possui a forma `bind_cols(df1, df2)`.


library(dplyr) # lendo dplyr
dataframe_completo <- bind_cols(dataframe1, dataframe2) # usando bind_cols()

dataframe_completo


#' É bem simples! Como podemos ver, os bancos foram unidos pela posição das variáveis.


## bind_rows()
## ----Unindo com bind_rows()----
#' Com `bind_rows()` a lógica é a mesma. A coluna 1 no banco 1 representa a mesma
#' variável da coluna 1 no banco 2. Quando um data.frame e outro possuem variáveis
#' iguais, os casos são adicionados. Quando as colunas diferem de nome, os casos
#' que não possuem valor nessa coluna recebem o valor de missing `NA`.


lista <- list(col1 = "a", col2 = 4, col3 = 1028, col4 = 255, col5 = 9902)
dataframe_completo <- bind_rows(dataframe_completo, lista)

dataframe_completo


# Mutating-Joins ###################################


#' Vamos para funções mais completas e que levam em conta bancos com mais informações.

## ----Lendo os três mini-bancos, message=FALSE, warning=FALSE----
dass_dep <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/dass_dep.csv")
dass_ans <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/dass_ans.csv")
dass_est <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/estrutura%20de%20dados/dados/dass_est.csv")


#' - O banco **dass_dep** contém todas as respostas à DASS, contabilizando 1000 casos.
#' - Os bancos *dass_ans* e *dass_est* possuem 900 casos cada.
#' - Cada banco possui uma coluna chamada *escore_total* e outra coluna chamada *nivel*:
#'   - No banco *dass_dep*, *escore_total* significa o escore em depressão, e *nivel*, a classificação do caso.
#'   - No banco *dass_ans*, *escore_total* significa o escore em ansiedade, e *nivel*, a classificação do caso.
#'   - No banco *dass_est*, *escore_total* significa o escore em estresse, e *nivel*, a classificação do caso.
#' - Todos os bancos possuem uma coluna de identificação, inicializada por "id".
#' 
#' Temos algumas opções:
#' 1. `full_join()`: todos os casos entram.
#' 2. `inner_join()`: todos os casos em comum em todos os bancos entram.
#' 3. `left_join()`: todos os casos do *primeiro* banco ficam, os casos em comum 
#' com o segundo banco também entram.
#' 4. `right_join()`: todos os casos do *segundo* banco ficam, os casos em comum 
#' com o primeiro banco também entram.


## Full join()
#' Para fazer qualquer join, possuímos duas funções bem importantes:
#' - `by()`: escolhe qual argumento ambos bancos tem em comum.
#' - `suffix()`: auxilia colocando um sufixo em colunas de nome idêntico.
#' 
#' Sabendo que nos dois bancos temos todas as respostas da DASS, precisamos fazer
#' duas transformações. Antes de começar, vamos excluir as respostas da DASS do 
#' banco *dass_ans* e *dass_est*. Aproveitaremos e já excluíremos a coluna "X" de
#' todos os bancos.
 
 
## ----Excluindo respostas à DASS dos bancos----
dass_dep <- dass_dep %>% 
  select(-X) # excluindo a coluna X

dass_ans <- dass_ans %>% 
  select(id_ans, escore_total, nivel) # selecionando id_ans, escore_total e nivel

dass_est <- dass_est %>% 
  select(id_est, escore_total, nivel) # selecionando id_est, escore_total e nivel

names(dass_dep) # nomes das colunas do banco 'dass_dep'
names(dass_ans) # nomes das colunas do banco 'dass_ans'
names(dass_est) # nomes das colunas do banco 'dass_est'



## ----Full join dep e ans----
dass_total <- dass_dep %>% # sempre se começa a partir de um banco
  full_join(dass_ans, by = c("id" = "id_ans"), suffix = c("_dep", "_ans"))

dass_total


#' Agora, entendendo os novos nomes, podemos começar.
#' 
#' O que aconteceu aqui foi o seguinte:
#' - Abrimos um pipe em *dass_dep* e, na função `full_join()`, chamamos o banco
#' a ser juntado, *dass_ans*.
#' - Especificamos em `by()` que a coluna "id" do primeiro banco é igual à coluna
#' "id_ans" do segundo banco (`by = c("id" = "id_ans")`), delimitando que (1) essas
#' colunas deveriam ser iguais e que os valores dos casos deveriam ser posicionados
#' de acordo com essa coluna.
#' - Caso "id" nos dois bancos, bastaria especificar `by = "id"`.
#' - Em `suffix()`, para todas as colunas com nome igual, adicionamos um sufixo
#' no primeiro banco chamado "_dep" e um sufixo no segundo banco chamado "_ans" 
#' (`suffix = c("_dep", "_ans")`).


## ----Full join com est----
dass_total <- dass_total %>% 
  full_join(dass_est, by = c("id" = "id_est")) %>% 
  rename(escore_total_est = escore_total, # renomear a coluna escore_total
         nivel_est = nivel) # renomear a coluna nivel

dass_total # full join concluído!


## Inner join()
#' Um inner join escolhe apenas os casos que existam no banco x E no banco y.
 
 
## ----Inner join dep ans e est----
dass_inner <- dass_dep %>% 
  inner_join(dass_ans, by = c("id" = "id_ans"), suffix = c("_dep", "_ans")) %>% 
  inner_join(dass_est, by = c("id" = "id_est")) %>% 
  rename(escore_total_est = escore_total, # renomear a coluna escore_total
         nivel_est = nivel) # renomear a coluna nivel

dass_inner


## Left join()
#' O left join, como o nome diz, preserva o primeiro banco (o banco da *esquerda*).
#' Todos os casos da esquerda são preservados, enquanto os outros são adicionados.


## ----Left join dep ans e est----
dass_left <- dass_dep %>% 
  left_join(dass_ans, by = c("id" = "id_ans"), suffix = c("_dep", "_ans")) %>% 
  left_join(dass_est, by = c("id" = "id_est")) %>% 
  rename(escore_total_est = escore_total, # renomear a coluna escore_total
         nivel_est = nivel) # renomear a coluna nivel

dass_left


## Right join
#' O right join, como o nome diz, preserva o segundo banco (o banco da *direita*).
#' Todos os casos da direita são preservados, enquanto os outros são adicionados.


## ----Right join dep ans e est----
dass_right <- dass_dep %>% 
  right_join(dass_ans, by = c("id" = "id_ans"), suffix = c("_dep", "_ans")) %>% 
  right_join(dass_est, by = c("id" = "id_est")) %>% 
  rename(escore_total_est = escore_total, # renomear a coluna escore_total
         nivel_est = nivel) # renomear a coluna nivel

dass_right


# Filter-joins #####################################


#' Enquanto os mutating joins se importam em unir bancos baseados em condições,
#' os filter joins são construídos para filtrar casos de um banco a outro, não necessariamente
#' para unir bancos.


## Semi join()
#' O semi join retorna todos os valores do banco x que também estão no banco y. 
#' Ao fazer isso, ele **não** incorpora as colunas e variáveis de y.
 
 
## ----Semi join dep ans e est----
dass_semi <- dass_dep %>% 
  semi_join(dass_ans, by = c("id" = "id_ans")) %>% 
  semi_join(dass_est, by = c("id" = "id_est"))

dass_semi


#' Aqui temos 809 casos. Por quê?
#' 
#' - Apenas os 900 casos que estavam em *dass_ans* permaneceram em dass_dep.
#' - Após isso, desses 900 casos, 809 estavam em *dass_est*.
 
 
## Anti join()
#' Esse é o último join que veremos aqui e ele é bem interessante. Ele preserva 
#' apenas os casos que estão em x e que não estão em y. Assim, só se salva quem
#' está no banco da esquerda e que não está nos outros bancos.
 
 
## ----Anti join dep ans e est----
dass_anti <- dass_dep %>% 
  anti_join(dass_ans, by = c("id" = "id_ans")) %>% 
  anti_join(dass_est, by = c("id" = "id_est"))

dass_anti

#' Apenas 9 casos estão no primeiro banco e não são compartilhados com os demais!
#' 
#' Por enquanto é isso :)

################################################# FIM
