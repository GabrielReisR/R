################## Medidas Comuns ###################

#' Autor: Gabriel R. R.

#' O código inicial, em R, está disponível nesse link: https://github.com/GabrielReisR/R/blob/master/estatistica/medidas-comuns.R

#' Essa apresentação, em RMarkdown, está disponível nesse link: https://rpubs.com/reisrgabriel/medidascomuns

#' Todo esse código pode ser rodado direto no R.
#' Tudo o que inicia com "#" ou "#'" são comentários, e não são computados pelo R.

####################################################

# Lendo pacote e vendo o banco
library(psych) # caso não tenha, instale assim: install.packages('psych', dependencies = TRUE)
head(bfi) # vendo o banco

# Criando a variável 'extroversao' ####
library(dplyr) # caso não tenha, instale assim: install.packages('dplyr', dependencies = TRUE)
bfi <- bfi %>% rowwise() %>% mutate(extroversao = sum(E1, E2, E3, E4, E5))

# Criando coluna 'id', de identificação ####
bfi$id <- 1:nrow(bfi)
bfi$id <- as.factor(bfi$id)

# Distribuição de extroversão ####
library(ggplot2) # caso não tenha, instale assim: install.packages('ggplot2', dependencies = TRUE)
histograma1 <- 
  # Construção inicial
  ggplot(bfi,
         aes(x = extroversao)) +
  geom_histogram(bins = 26, color = '#011e5a', fill = '#011e5a') +
  
  # Rótulos
  xlab('Escore de Extroversão') +
  ylab('Frequência de Participantes') +
  labs(title = 'Histograma (gráfico de frequências)') +
  
  # X-axis ticks
  scale_x_continuous(breaks = c(0, 5, 10, 15, 20, 25, 30)) +
  
  # Tema
  theme_classic()

histograma1

# Valores de medidas centrais

# Média
mean(bfi$extroversao, na.rm = T)

# Mediana
median(bfi$extroversao, na.rm = T)

# Desenhando moda e média
histograma2 <- 
  # Construção inicial
  ggplot(bfi,
         aes(x = extroversao)) +
  geom_histogram(bins = 26, color = '#011e5a', fill = '#011e5a') +
  
  # Rótulos
  xlab('Escore de Extroversão') +
  ylab('Frequência de Participantes') +
  labs(title = 'Histograma (gráfico de frequências)') +
  
  # Linha vertical - moda e média
  geom_vline(xintercept = 19, size = 2, col = '#5dbcd2') +
  
  # X-axis ticks
  scale_x_continuous(breaks = c(0, 5, 10, 15, 20, 25, 30)) +
  
  # Tema
  theme_classic()

histograma2

# Média ou mediana?
extroversao <- bfi$extroversao
extroversao <- c(extroversao, rep(5, 1000))
extroversao <- as.data.frame(extroversao)

mean(extroversao$extroversao, na.rm = TRUE)
median(extroversao$extroversao, na.rm = TRUE)

histograma3 <- 
  # Construção inicial
  ggplot(extroversao,
         aes(x = extroversao)) +
  geom_histogram(bins = 26, color = '#011e5a', fill = '#011e5a') +
  
  # Rótulos
  xlab('Escore de Extroversão') +
  ylab('Frequência de Participantes') +
  labs(title = 'Histograma (gráfico de frequências)') +
  
  # Linha vertical - média e mediana
  geom_vline(xintercept = 15.19, size = 1, col = '#5dbcd2') +
  geom_vline(xintercept = 18, size = 1, col = '#5dbcd2') +
  
  # Anotação
  annotate(geom = 'text', x = 14, y = 1000, label = 'Média\n15.19') +
  annotate(geom = 'text', x = 19.7, y = 1000, label = 'Mediana\n18') +
  
  
  # X-axis ticks
  scale_x_continuous(breaks = c(0, 5, 10, 15, 20, 25, 30)) +
  
  # Tema
  theme_classic()

histograma3

#' A mediana é uma melhor representação da medida central da maioria dos casos 
#' quando temos situações extremas no nosso banco de dados.

# Boxplot ####
# Boxplot se utiliza da mediana!
boxplot(bfi$extroversao, 
        notch = F, col = '#5dbcd2',
        main = 'Boxplot do Escore de Extroversão')

# Escolhendo 10 casos (10 linhas) ####
bfi_dezcasos <- bfi[c(1, 4, 7, 200, 599, 610, 812, 1201, 1327, 1430), ]

# Excluindo tudo que não é extroversão, gênero, educação e idade ####
# O operador : representa um intervalo
bfi_dezcasos <- bfi_dezcasos %>% select(-c(A1:C5,N1:O5))
bfi_dezcasos

# 10 participantes
pontos1 <- 
  # Construção inicial
  ggplot(bfi_dezcasos,
         aes(x = id, y = extroversao)) +
  geom_point(color = '#011e5a', size = 2) +
  
  # Linha horizontal da média
  geom_hline(yintercept = 19, size = 1, col = '#011e5a') +
  
  # Rótulos
  xlab('Participante') +
  ylab('Escore de Extroversão') +
  labs(title = 'Escores de Extroversão por Participantes') +
  
  # Tema
  theme_classic()

pontos1

# Avaliando erro no pequeno dataset ####
erros <- bfi_dezcasos$extroversao - 19
sum(erros)

# Avaliando erro em todo dataset
erros_todo_bfi <- bfi$extroversao - mean(bfi$extroversao, na.rm = T)
sum(erros_todo_bfi, na.rm = TRUE)

# Avaliando erro ao quadrado no pequeno dataset
sum(erros^2)

# Calculando variância - bfi_dezcasos
sum(erros^2)/(nrow(bfi_dezcasos) - 1)

#' a função `var()` calcula a variância!
#' quando usar, lembre de adicionar o `na.rm = TRUE` caso possua valores vazios
var(bfi_dezcasos$extroversao)

# Veja como ambas operações são a mesma coisa
sum(erros^2)/(nrow(bfi_dezcasos) - 1) == var(bfi_dezcasos$extroversao)

# Calculando variância de todo dataset ####
var(bfi$extroversao, na.rm = TRUE)

# Calculando desvio-padrão
sqrt(var(bfi$extroversao, na.rm = TRUE))

#' a função `sd()` calcula o desvio-padrão!
#' quando usar, lembre de adicionar o `na.rm = TRUE` caso possua valores vazios
sd(bfi$extroversao, na.rm = TRUE)

# Veja como ambas operações são a mesma coisa
sqrt(var(bfi$extroversao, na.rm = TRUE)) == sd(bfi$extroversao, na.rm = TRUE)

# Visualizando desvios-padrões
histograma4 <- 
  # Construção inicial
  ggplot(bfi,
         aes(x = extroversao)) +
  geom_histogram(bins = 26, color = '#011e5a', fill = '#011e5a') +
  
  # Rótulos
  xlab('Escore de Extroversão') +
  ylab('Frequência de Participantes') +
  labs(title = 'Histograma (gráfico de frequências)') +
  
  # Linha vertical e anotação da média
  geom_vline(xintercept = 19, size = 1.5, col = 'black') +
  annotate(geom = 'text', x = 20, y = 500, label = 'Média\n19', size = 3) +
  
  # Desvios-padrões < Média
  geom_vline(xintercept = 16.24687, size = 1, col = '#5dbcd2') +
  geom_vline(xintercept = 13.53834, size = 1, col = '#5dbcd2') +
  geom_vline(xintercept = 10.82981, size = 1, col = '#5dbcd2') +
  geom_vline(xintercept = 8.121278, size = 1, col = '#5dbcd2') +
  geom_vline(xintercept = 5.412748, size = 1, col = '#5dbcd2') +
  
  # Desvios-padrões > Média
  geom_vline(xintercept = 21.66393, size = 1, col = '#5dbcd2') +
  geom_vline(xintercept = 24.37246, size = 1, col = '#5dbcd2') +
  geom_vline(xintercept = 27.08099, size = 1, col = '#5dbcd2') +
  
  # X-axis ticks
  scale_x_continuous(breaks = c(0, 5, 10, 15, 20, 25, 30)) +
  
  # Tema
  theme_classic()

histograma4
