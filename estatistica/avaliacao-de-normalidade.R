############# Avaliação de normalidade #############

#' Autor: Gabriel R. R.

#' O código inicial, em R, está disponível nesse link: https://github.com/GabrielReisR/R/blob/master/estatistica/avaliacao-de-normalidade.R

#' Essa apresentação, em RMarkdown, está disponível nesse link: https://rpubs.com/reisrgabriel/avaliacaodenormalidade

#' Todo esse código pode ser rodado direto no R.
#' Tudo o que inicia com "#" ou "#'" são comentários, e não são computados pelo R.

####################################################

# Lendo pacote e vendo o banco
library(psych) # caso não tenha, instale assim: install.packages('psych', dependencies = TRUE)
head(bfi) # vendo o banco

# Lendo pacotes
library(dplyr)
library(ggplot2)

# Criando 'extroversao'
bfi <- bfi %>% rowwise() %>% mutate(extroversao = sum(E1, E2, E3, E4, E5))

# Passo 1 - Avaliando histograma
histograma <- bfi %>%
  ggplot(aes(extroversao)) +
  geom_histogram(aes(y = ..density..), bins = 26, colour = "#011e5a", fill = "white") +
  stat_function(fun = dnorm,
                args = list(
                  mean = mean(bfi$extroversao, na.rm = T),
                  sd = sd(bfi$extroversao, na.rm = T)),
                colour = "#011e5a") +
  
  # Rótulos
  xlab('Escore de Extroversão') +
  ylab('Frequência de Participantes') +
  labs(title = 'Histograma (gráfico de frequências)') +
  
  # X-axis ticks
  scale_x_continuous(breaks = c(0, 5, 10, 15, 20, 25, 30)) +
  
  # Tema
  theme_classic()

histograma

# Passo 2 - Entendendo curtose e assimetria
library(pastecs) # caso não tenha, instale assim: install.packages('pastecs', dependencies = TRUE)

stat.desc(bfi$extroversao, basic = FALSE, norm = TRUE)

# kurt.2SE = 5.740591
# skewness.2SE = 0.1356251

# Ou seja, valores de curtose positivos indicam uma distribuição pontuda.
# Parece não haver assimetria.

# Passo 3 - Gráfico QQ
qqnorm(bfi$extroversao,
       main = "Gráfico QQ (QQ Plot)",
       xlab = "Quantis Teóricos",
       ylab = "Valores da Amostra",
       col = "#011e5a")

qqline(bfi$extroversao, col = "black", lwd = 3)

# Passo 4 - Teste de Normalidade Shapiro-Wilk e Kolgomorov-Smirnov
shapiro.test(bfi$extroversao)

#' p-value < 2.2e-16, indicando uma baixa probabilidade de que essa variável veio
#' de uma distribuição normal
ks.test(bfi$extroversao, "pnorm")

# Extroversão é normal ou não é? ####
#' A resposta final para essa pergunta é que tudo aponta que extroversão não é 
#' uma variável que pode passar por testes paramétricos (testes feitos apenas para
#' variáveis que seguem a distribuição normal). Apesar disso, de acordo com o 
#' **Teorema Central do Limite**, amostras que possuam a partir de 30 casos realmente
#' aleatórios poderiam ser consideradas como normai. Já que a nossa distribuição 
#' possui algumas características de normalidade (a distribuição e a assimetria 
#' estável), poderíamos tratar, se quiséssemos e ao nosso próprio custo, essa 
#' distribuição como normal. Até porque esse banco de dados tem 2800 casos.
#' 
#' Veja que coisa! Haveriam ainda argumentos para suportar a utilização de testes
#' paramétricos para essa variável. Porém, o mais correto seria a utilização de 
#' testes não paramétricos para extroversão, até porque algumas premissas de 
#' normalidade foram sim quebradas (curtose, QQ Plot e Shapiro-Wilk).