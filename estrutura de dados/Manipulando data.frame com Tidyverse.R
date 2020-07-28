#' ---
#' title: "Manipulando data.frame com dplyr"
#' author: "Gabriel R. R."
#' date: "7/19/2020"
#' output: html_document
#' ---
#' ## Considerações iniciais
#' O código inicial, em R, está disponível nesse link: 
#' 
#' Os bancos de dados utilizados podem ser encontrados aqui: 
#' 
#' O dataset DASS42 foi retirado desse desafio do Kaggle: https://www.kaggle.com/lucasgreenwell/depression-anxiety-stress-scales-responses?select=data.csv
#' 
#' O pacote *dplyr* possui várias funções interessantes que permitem:
#' 
#' * Selecionar variáveis de maneira dinâmica e fácil.
#' * Criar novas variáveis a partir de variáveis antigas.
#' * Sumarizar vários valores em um só.
#' * Filtrar e agrupar variáveis de interesse a partir de condições específicas.
#' 
#' ## 1. Usando select()
#' 
#' ### 1.1 Diagnósticos iniciais
#' A primeira tarefa quando se trata de manipular um banco de dados consiste na importação correta dos dados ao software de programação.
#' 
#' Vamos ler o nosso banco com a função base do R `read.csv()`.
#' 
## ----Lendo o banco DASS42---------------------------------------------------------------------------------------------------------------------------------------------------------
dass <- read.csv("https://raw.githubusercontent.com/GabrielReisR/R/master/Import%20e%20diagn/Dados/dass42.csv", sep = "\t")
bancodass <- dass # vamos atribuir a outro objeto os dados do banco inicial

#' 
#' _Nota_: atribuímos à `bancodass` os mesmos valores do nosso banco pois, caso algum erro ocorra, apenas voltamos atrás.
#' 
#' Agora, vamos ver como está a estrutura desse banco usando `str()`.
#' 
## ----Usando str() para entender o banco-------------------------------------------------------------------------------------------------------------------------------------------
str(dass)

#' 
#' Parece ok! Vamos começar a manipular com o _dplyr_.
#' 
#' ### 1.2 Selecionando e excluindo variáveis
#' Para usar o dplyr, basta ler o pacote com o comando a seguir:
## ----Lendo dplyr------------------------------------------------------------------------------------------------------------------------------------------------------------------
library(dplyr) # caso não o possua, instale com 'install.packages("dplyr")'

#' 
#' Para manipular o banco, vamos sempre usar a seguinte fórmula:
#' 
## ----Fórmula base para uso de dplyr, eval=FALSE-----------------------------------------------------------------------------------------------------------------------------------
## banco <- banco %>% # atribuímos a banco o mesmo valor de banco
##   funcao() # modificamos o banco com dplyr

#' 
#' O indicador ` %>% ` se chama _pipe_, ou _cano_ em português. Ele nos permite acessar o banco diretamente, e a partir disso realizar as mudanças que desejamos.
#' 
#' **Dica**: para usar o pipe basta digitar `Ctrl + Shift + M`.
#' 
#' O primeiro verbo (em inglês, _verb_) que a gente vai tratar vai ser o `select()`. Ele permite:
#' 
#' * Selecionar apenas as variáveis desejadas.
#' * Excluir variáveis.
#' * Renomear variáveis.
#' * Trocar a posição de variáveis.
#' 
#' Vamos fazer algo simples: vamos colocar a variável _age_(idade) para o início.
#' 
## ----Trocando a posição de age----------------------------------------------------------------------------------------------------------------------------------------------------
dass <- dass %>%
  select(age, everything())

#' 
#' 1. Usamos `select()` para selecionar a variável, nomeando-a sem aspas pois já estamos acessando o banco (por causa do pipe ` %>% `).
#' 1. Colocamos age no início.
#' 1. Utilizamos a função `everything()` que coloca o restante das variáveis após a primeira.
#' 
#' Vamos agora excluir uma coluna. Para fazer isso, basta colocar o sinal de menos `-` na frente dela.
#' 
## ----Excluindo colunas country até orientation------------------------------------------------------------------------------------------------------------------------------------
dass <- dass %>%
  select(everything(), -country:orientation) # excluir as colunas de 'country' à 'orientation'

#' 
#' Nesse exemplo, selecionamos primeiro todas as variáveis usando `everything()` e depois excluímos **todas as colunas desde country até orientation**. Para selecionar ou excluir colunas diferentes, basta dividir os argumentos por vírgula.
#' 
#' Agora vamos renomear a coluna age para ter o nome _idade_. Para fazer isso, basta seguir a fórmula: `novo nome = nome antigo`. Ou seja, _atribua a essa nova variável o mesmo valor da variável antiga_.
#' 
## ----Renomeando age para idade----------------------------------------------------------------------------------------------------------------------------------------------------
dass <- dass %>%
  select(idade = age, everything())

#' 
#' Agora vamos utilizar três funções bem interessantes que podem ser utilizadas com `select()`:
#' 
#' *`starts_with()`: escolhe colunas que _comecem com_ uma string.
#' *`ends_with()`: escolhe colunas que _terminem com_ uma string.
#' *`contains()`: escolhe colunas que _contenham_ uma string.
#' 
#' Se quiséssemos, por exemplo, encontrar todas as colunas que comecem com a letra "T", poderíamos utilizar `starts_with("T")`.
#' 
#' Para acessar todas as variáveis que terminam com "n", poderíamos utilizar `ends_with("n")`.
#' 
#' Para acessar todas as colunas que contenham em seu nome a letra "Q", basta usar `contains("Q")`.
#' 
## ----Usando starts, ends e contains-----------------------------------------------------------------------------------------------------------------------------------------------
dass <- dass %>%
  select(everything(), # embora esteja sendo usado, não é necessário para essa função
         -starts_with("T"), # excluindo apenas as variáveis que começam com 'T'
         -starts_with("V"), # excluindo apenas as variáveis que começam com 'V'
         -ends_with("I"), # excluindo apenas as variáveis que terminam com 'I'
         contains("Q")) # selecionando apenas as variáveis que contenham 'Q'

#' 
#' ### 1.3 Selecionando e renomeando as colunas
#' Agora que sabemos selecionar variáveis, vamos selecionar apenas as variáveis que nos interessam para a correção da DASS. As respostas à DASS42 estão presentes em todas as colunas que possuem "Q" no início e que terminam com "A".
#'  
## ----Selecionando as respostas à DASS---------------------------------------------------------------------------------------------------------------------------------------------
dass <- dass %>%
  select(starts_with("Q") & ends_with("A")) # note a utilização do valor '&'

#' 
#' Vamos renomear dinamicamente todas essas variáveis, dando o nome de _dass_n_ (dass + número do item) ao invés de _QnA_, como está agora. Vamos ver como está o nosso banco usando `glimpse()`.
#' 
## ----Renomeando todas as variáveis------------------------------------------------------------------------------------------------------------------------------------------------
dass <- dass %>%
  select(dass_ = starts_with("Q")) %>% # dass_ será o nome de todas as variáveis que comecem com "Q"
  glimpse() # permite ver as colunas e seus valores

#' Entendendo melhor:
#' 
#' * *dass_* será o nome de todas as variáveis que comecem com "Q".
#' * *dass_1* armazena o nome dessa primeira variável, _Q1A_.
#' * *dass_* reconhece outro valor, Q2A, e armazena no próximo número depois de *dass_1*, criando *dass_2*.
#' * Esse processo se repete até dass_42.
#' 
#' ## 2. Usando mutate()
#' Agora que temos todas as principais colunas, podemos começar a utilizar o `mutate()`, que nos permite
#' 
#' * Criar novas variáveis a partir de variáveis do banco.
#' * Adicionar variáveis novas.
#' * Modificar valores de variáveis existentes.
#' 
#' ### 2.1 Calculando escores da DASS
#' Antes de começar o cálculo, vamos lembrar que a DASS é respondida de 0 a 3, e aqui temos resposta de 1 a 4. Isso é importante pois os pontos de corte para a classificação de severidade parte de escores brutos das respostas.
#' 
#' Assim, precisamos que
#' 
#' * Todas as variáveis respondidas com 1 sejam 0
#' * Todas as variáveis respondidas com 2 sejam 1
#' * Todas as variáveis respondidas com 3 sejam 2
#' * Todas as variáveis respondidas com 4 sejam 3
#' 
#' Essa fórmula acima parece muito com uma função `ifelse()`. Por exemplo:
#' 
#' `ifelse(., 1, 0, .)`
#' 
#' 1. Se o valor de uma variável (representado aqui por um ponto `.`) for igual a `1`, faça que seja zero (`0`).
#' 1. Caso alguma variável não atenda à condição de ser igual a 1, faça que tenha o valor dela mesma (`.`).
#' 
#' O verbo `mutate()` permite que coloquemos uma função em seu corpo.
#' 
#' Para atribuir uma variável com mutate, basta seguir a fórmula de renomeação do verbo `select()`:
#' 
#' `novaVariável = antigaVariável`
#' 
#' Vamos recalcular os escores da DASS42:
#' 
## ----Recalculando DASS42----------------------------------------------------------------------------------------------------------------------------------------------------------
dass <- dass %>%
  mutate_at(vars(dass_1:dass_42), ~ifelse(. == 1, 0, .)) %>% 
  mutate_at(vars(dass_1:dass_42), ~ifelse(. == 2, 1, .)) %>% 
  mutate_at(vars(dass_1:dass_42), ~ifelse(. == 3, 2, .)) %>% 
  mutate_at(vars(dass_1:dass_42), ~ifelse(. == 4, 3, .))

#' **Importante**: enquanto `mutate()` muda o valor de apenas uma variável por vez, `mutate_at` altera o valor de todas as variáveis contidas em `vars()`, por isso foi utilizado. O verbo `mutate()` possui ainda outras variações como `mutate_if()` e `mutate_all`.
#' 
#' Assim, vamos dar uma olhada no nosso banco.
#' 
## ----Vendo novos valores----------------------------------------------------------------------------------------------------------------------------------------------------------
dass %>% 
  glimpse()

#' Parece tudo certo :)
#' 
#' ### 2.2 Calculando depressão, ansiedade e estresse
#' Lembra que `mutate()` consegue alterar o valor de apenas uma variável por vez? Vamos utilizar ele agora para pegar o valor de outras variáveis e criar três novas.
#' 
#' Cada participante, cada linha (ou **row** em inglês), terá os valores do nível de depressão, ansiedade e estresse calculados como abaixo.
#' 
#' * *depressao*: soma dos valores das colunas `dass_2, dass_5, dass_12, dass_13, dass_16, dass_17, dass_20, dass_23, dass_25, dass_26, dass_31, dass_32, dass_36, dass_41`
#' * *ansiedade*: soma dos valores das colunas `dass_1, dass_6, dass_8, dass_10, dass_11, dass_14, dass_21, dass_22, dass_27, dass_28, dass_34, dass_37, dass_40, dass_42`
#' * *estresse*: soma dos valores das colunas `dass_3, dass_4, dass_7, dass_9, dass_15, dass_18, dass_19, dass_24, dass_29, dass_30, dass_33, dass_35, dass_38, dass_39`
#' 
#' Para acessar o valor de cada linha para fazer esse cálculo - ou seja, para que a soma das colunas diga respeito a cada um dos participantes - vamos utilizar o verbo `rowwise()` antes de realizar o cálculo. Fica assim:
#' 
## ----Calculando escores-----------------------------------------------------------------------------------------------------------------------------------------------------------
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

#' 
#' Perceba que basta utilizar a função `sum()` para somar os valores.
#' 
#' Para acessar isso, basta olhar para como está o banco agora (você pode fazer isso com `dass %>% glimpse()`).
#' 
#' ### 2.3 Classificando o nível de severidade
#' Agora que temos os escores de cada pessoa na escala DASS42, vamos classificar esses escores por nível de gravidade/severidade.
#' 
#' Para isso, existe uma função bem útil que se chama `case_when`. Especificamos uma condição baseada em outra variável, e assim que essa condição é atendida, determinado valor é criado. Vamos utilizá-la dentro de `mutate()` para criar nossas classificações.
#' 
## ----Classificando nível de severidade--------------------------------------------------------------------------------------------------------------------------------------------
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

#' 
#' * A função acima criou três novos objetos (nivel_dep/ans/est) baseando-se nos valores de suas respectivas colunas.
#' * `case_when()` considera a primeira condição e atribui o valor que queremos a essa condição.
#' * No primeiro caso, quando a variável _depressao_ for menor que 10 atribui-se a essa nova coluna o valor "Normal": `depressao < 10 ~ "Normal"`
#' * Para fornecer as outras condições, basta colocar uma vírgula e continuar.
#' * Para valores que fogem ao que a função consegue oferecer, poderia-se criar a condição `TRUE ~ .`, atribuindo um valor específico caso nenhuma outra condição satisfaça o que está send pedido.
#' 
#' Assim que criado, podemos transformar essas novas variáveis em fatores. Isso pode ser feito diretamente com R. Vamos criar um hiperparâmetro chamado _nivelSeveridade_.
#' 
## ----Transformando em fatores-----------------------------------------------------------------------------------------------------------------------------------------------------
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

#' 
#' Pronto! Fizemos todas as alterações iniciais. Temos o resultado de todos participantes e suas classificações.
#' 
#' Vamos ver quantos participantes (`nrow()`) possuem nível de depressão, ansiedade e estresse considerados como "Severo" ou "Extremamente Severo". Vamos adicionar essas pessoas ao novo banco de dados chamado _casosGraves_.
#' 
#' Vamos utilizar `filter()`, uma função do *dplyr*.
#' 
## ----Quantas pessoas possuem nível de dep, ans e est de severo para cima?---------------------------------------------------------------------------------------------------------
casosGraves <- dass %>% # criando um novo banco de dados chamado CasosGraves
  filter(nivel_dep == "Severo" | nivel_dep == "Extremamente Severo",
         nivel_ans == "Severo" | nivel_ans == "Extremamente Severo",
         nivel_est == "Severo" | nivel_est == "Extremamente Severo")

glimpse(casosGraves)

#' 
#' Por enquanto é isso :)
#' 
#' ### 3. Usando filter() e janitor
#' 
#' 
#' 
#' ## 3.3 Excluindo NAs com remove_na()
#' ### 3.3.1 Descobrindo NAs com missmap()
#' ### 3.3.2 Removendo NAs com remove_na()
#' ## 3.4 Criando novas variáveis com mutate()
#' ### 3.4.1 Criando função
#' ### 3.4.2 Implementando função com mutate()
#' ### 3.4.3 Criando novas variáveis filtro (grave, ...)
#' ## 3.5 Sumarizando variáveis
#' ### 3.5.1 Usando filter()
#' ### 3.5.2 Usando group_by()
#' ### 3.5.3 Usando top_n()
#' ## 3.6 Transmute faz tudo
#' ### 3.6.1 Uma única função para todas transformações
#' # 4. Novo banco de dados
#' ## str()
#' ## skim()
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
