# Inicialização ####
library(corrplot) # cria figura de matriz de correlação
library(dplyr) # manipulação de dados
library(ggm) # correlações parciais
library(ggplot2) # gráficos
library(polycor) # correlação biserial/poliserial
library(psych) # pacote para banco 'bfi' e análises com 'describe'
library(qgraph) # análise de redes

# Exemplo 1 ####
x <- c(7, 5, 6)
y <- c(7, 5, 6)

cor(x, y)

# Exemplo 2 ####
x <- c(7, 5, 6)
y <- c(5, 3, 4)

cor(x, y)

# Exemplo 3 ####
x <- c(70, 50, 60)
y <- c(5, 3, 4)

cor(x, y)

# Exemplo 4 ####
x <- c(7, 5, 6)
y <- c(7, 9, 8)

cor(x, y)

# Correlação de Pearson ####
#' Usar quando V1 é *contínua* e V2 é *contínua*

# Calculando covariância e correlação de Pearson ====
depressao <- c(7, 1, 2, 8, 10, 8, NA, 2, 3, 4)
ansiedade <- c(7, 3, 4, 9, 7, 6, 6, 4, 1, 5)

cor(depressao, ansiedade, use = 'pairwise.complete.obs',
    method = 'spearman')

erro_depressao <- depressao - mean(depressao)
erro_ansiedade <- ansiedade - mean(ansiedade)
erro_depressao * erro_ansiedade

covar_numerador <- sum(erro_depressao * erro_ansiedade)
covar_denomidador <- length(depressao) - 1

covariancia <- covar_numerador/covar_denomidador

correlacao <- covariancia / (sd(depressao) * sd(ansiedade))
correlacao

# Vendo se o resultado é o mesmo #
correlacao == cor(depressao, ansiedade)

# Plotando a relação ####
w <- -ansiedade
x <- depressao
y <- ansiedade

df <- data.frame(w, x, y)

p_1 <- 
  ggplot(df, aes(x = x, y = y)) +
  
  # Pontos
  geom_point(alpha = 1, position = 'jitter', color = "#011e5a") +
  
  # Linha
  stat_smooth(method = "lm", se = F, color = "black", size = 0.5) +
  
  # Ajustando x
  xlab('x') +
  xlim(c(0, 11)) +
  
  # Ajustando y
  ylab('y') +
  ylim(c(0, 11)) +
  
  # theme
  theme_classic()

p_1

# Correlação parcial ====
#' Estimar correlação entre V1 e V2 sem o efeito de V3
path <- 'https://raw.githubusercontent.com/GabrielReisR/R/master/estatistica/dados/dass42.csv'
df <- read.csv(path)[-1]

df <- df %>% 
  mutate(Gender = case_when(Gender == 'Male' ~ 0,
                            Gender == 'Female' ~ 1))

#' Embora gênero não seja uma variável dicotômica, vamos utilizá-la aqui como sendo
#' por falta de um melhor banco nesse momento

cor(df$Exam, df$Revise) #' correlação inicial entre *Exam* e *Revise*

cor(df[2:4]) #' correlação entre *Exam*, *Revise* e *Anxiety*

ggm::pcor(c('Exam', 'Revise', 'Anxiety'), var(df)) # correlação parcial
cor(df$Exam, df$Revise)

#' O resultado é a correlação entre *Exam* e *Revise* sem interferência de *Anxiety*
#' Perceba o quanto de variância foi retirada dessa relação comparando com
#' a função `cor(df$Exam, df$Revise)`

# Correlação point-biserial ####
#' Usar quando V1 é *contínua* e V2 é *dicotômica*

cor(df$Exam, df$Gender) # basta rodar uma correlação de Pearson

#' Bônus: teste de significância (pode ser usado com method = 'spearman' ou 'kendall')

x <- cor.test(df$Exam, df$Gender)
x$conf.int

# Correlação biserial ####
#' Usar quando V1 é *contínua* e V2 é *dicotomizada*
describe(df$Revise)

# Cortar pela mediana, criando o grupo 1 (estudou muito) e 0 (estudou pouco)
df <- df %>% 
  mutate(Studied = case_when(Revise > 15 ~ 1,
                             Revise <= 15 ~ 0))

head(df)
polycor::polyserial(df$Exam, df$Studied) # correlação biserial

# Embora aqui citado, o procedimento de cortar pela mediana não é aconselhado!

# Correlação tetracórica #### 
#' Usar quando V1 é *dicotomizada* e V2 é *dicotomizada*
table_gender_studied <- table(df$Gender, df$Studied)
table_gender_studied

cor_tetra <- psych::tetrachoric(table_gender_studied)
cor_tetra

df_tetra <- df %>% select(Gender, Studied)

x <- tetrachoric(df[,c(5,6)])
x$rho

polychor(df$Gender, df$Studied)

# Correlação policórica ====
#' Usar quando V1 é *politomizada* e V2 é *politomizada*
df <- psych::bfi
head(df)

poly_cor <- psych::polychoric(df %>% select(A1:O5))
poly_cor

cors <- poly_cor$rho
cors
# Usando qgraph::cor_auto ####
#' O pacote reconhece a presença de variáveis ordinais e aplica a correlação
#' policórica nelas.

correlacoes_automaticas <- qgraph::cor_auto(df[-1])
correlacoes_automaticas

polychor(df$Gender, df$Studied) # a correlação é a mesma da matriz
cor_tetra # a correlação é a mesma da matriz

# Visualização das correlações ====
poly_cor <- psych::polychoric(df %>% select(A1:O5))
poly_cor

cors <- poly_cor$rho
cors

#' Função para ficar bem bonita a correlação

corrplot::corrplot(
  cors,
  method = 'color',
  diag = T,
  type = 'lower',
  tl.col = "black",
  tl.srt = 45,
  addCoef.col = "black",
  tl.cex = .7,
  number.cex = .5
)

#' Para mais opções, rodar `?corrplot`

# Análise de redes - entendendo correlações parciais de forma visual ====
#' Procedimento de 'visualização' da relação entre variáveis
sds_cors <- sqrt(diag(cors))
covariancia_bfi <- cor2cov(cors, sds_cors) # objeto final

grupos <- list("Amabilidade" = c(1:5),
               "Conscienciosidade" = c(6:10),
               "Extroversão" = c(11:15),
               "Neuroticismo" = c(16:20),
               "Abertura" = c(21:25))

network_bfi <- qgraph(
  covariancia_bfi,
  graph = 'glasso',
  layout = 'spring',
  sampleSize = nrow(df),
  groups = grupos
)
