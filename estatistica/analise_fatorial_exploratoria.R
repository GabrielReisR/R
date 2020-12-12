# Inicializando ====
#' Vamos explorar um pouco o conceito de Análise Fatorial Exploratória (EFA)
#' e as decisões possíveis no processo.
#' Faremos isso a partir de uma matriz de correlação/covariância, a mesma encontrada
#' no capítulo 2 do livro *Confirmatory Factor Analysis for Applied Research* 
#' de Brown(2015).

# Pacotes
library(psych) # EFA e outras análises

# Criando matriz de correlação/covariância ====
#' A matriz pode ser gerada a partir de um banco de dados e então fornecida às
#' funções discutidas abaixo. De mesma forma, a maioria das funções aceita também
#' o data.frame com os escores brutos dos indicadores. 
#' 
#' Apesar disso, compreender a EFA como um procedimento derivado da matriz de
#' correlação é um passo importante para entender outros conceitos relacionados
#' ao procedimento.

matriz_de_cor <- 
  matrix(
    c(1,     0.70, 0.65, 0.62,
      0.70,  1,    0.66, 0.63,
      0.65,  0.66, 1,    0.60,
      0.62,  0.63, 0.60, 1),
    nrow = 4,
    ncol = 4,
    dimnames = list(c('O1', 'O2', 'O3', 'O4'),
                    c('O1', 'O2', 'O3', 'O4'))
  )

matriz_de_cor

# Descobrindo número de fatores através dos eigenvalues ####
eigen_matriz <- eigen(matriz_de_cor)

eigen_matriz$values 
#' Apenas 1 valor acima de 1 - sugestão de 1 fator segundo o método de Kaiser-Guttman

plot(eigen_matriz$values, type = 'b', main = 'Scree plot')
#' Mudança de ângulo da linha após o ponto 1 - sugestão de 1 fator pelo scree test

# Realizando análise fatorial paralela ====
fa.parallel(matriz_de_cor, n.obs = 300, fm = 'ml') # resultado igual ao MPLUS

#' Análise paralela sugere 1 fator. Isso porque ps dados não explicam tão bem a 
#' variância dos itens partir de dois fatores. De fato, amostras aleatórias possuem
#' melhores índices de eigenvalue de acordo com o plot.
#' 
#' Isso é visto através do cruzamento da linha vermelha.

# Realizando análise fatorial exploratória ====
analise_fatorial_exploratoria <- fa(matriz_de_cor, nfactors = 1, n.obs = 300) # resultado igual ao MPLUS
analise_fatorial_exploratoria

# Standardized loadings (pattern matrix) based upon correlation matrix
#     MR1   h2   u2 com
# O1 0.83 0.68 0.32   1
# O2 0.84 0.71 0.29   1
# O3 0.79 0.62 0.38   1
# O4 0.75 0.57 0.43   1

#' *MR1* (MinRes1) - indica o fator 1 obtido através do método Minimum Residual
#' Aliás, Minimum Residual é o mesmo que Maximum Likelihood (Máxima Verossimilhança)
 
#' *h2* indica comunalidade entre item/fator (comunalidade = escore fatorial^2)
#' Ou seja, h2 indica o quanto de variância do item é explicada pelo fator

#' *u2* indica 1-comunalidade, ou seja, a variância do próprio item + erro

#' *com* é a soma de h2 + u2
 
#                 MR1
# SS loadings    2.58
# Proportion Var 0.64

#' *SS loadings* é o Squared Sum dos loadings da matriz reduzida de correlação
#' Isto é, com os valores da comunalidade no lugar dos loadings.
#' SS loadings é o mesmo que o Eigenvalue (só que agora da matriz reduzida).

 
#' *Proportion Var* é o (Eigenvalue / p). 
#' Eigenvalue = SS loadings
#' p = número de indicadores (número de itens)
#' Nesse caso, 2.58/4 = 0.645. 
#' Isso significa que 64,5% da variância dos itens são explicados por MR1

# Plot da análise fatorial exploratória ====
fa.diagram(analise_fatorial_exploratoria)

# Plot mais completo, indo de 01 até 04 e com nomes apropriados
rownames(analise_fatorial_exploratoria$loadings) <- c('Desesperança',
                                                      'Culpa',
                                                      'Letargia',
                                                      'Insônia')

colnames(analise_fatorial_exploratoria$loadings) <- 'Depressão'

fa.diagram(analise_fatorial_exploratoria,
           main = 'Análise Fatorial Exploratória',
           sort = F,
           digits = 3,
           side = 1)

# Visualização geométrica do modelo ====
plot(analise_fatorial_exploratoria)

# CURIOSIDADE: descobrindo Eigenvalue e Proportion Var da EFA na mão ====
#' O *SS loadings* é o Squared Sum dos loadings da matriz reduzida de correlação
#' Isto é, com os valores da comunalidade no lugar dos loadings.
#' Assim, basta substituir os valores `1` por valores da comunalidade, sendo a
#' comunalidade definida como (carga fatorial ^ 2)

matriz_de_cor <-
  matrix(
    c(0.68595,     0.70, 0.65, 0.62,
      0.70,  0.70712,    0.66, 0.63,
      0.65,  0.66, 0.62040,    0.60,
      0.62,  0.63, 0.60, 0.56592),
    nrow = 4,
    ncol = 4,
    dimnames = list(c('O1', 'O2', 'O3', 'O4'),
                    c('O1', 'O2', 'O3', 'O4'))
  )

matriz_de_cor

# Descobrindo eigenvalue
eigen_matriz <- eigen(matriz_de_cor)

eigen_matriz$values[1] # o primeiro valor, arredondando, é igual ao da EFA, 2.58!

proportion_var <- 2.579597235 / 4 # 4 é o número de itens!
proportion_var # Proportion Var igual ao da EFA, 64.5!