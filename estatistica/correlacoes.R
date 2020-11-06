# Inicialização ####
library(corrplot)
library(dplyr)
library(ggplot2)
library(plotly)
library(psych)

# Banco ####
x <- c(7, 1, 2, 8, 10, 8, 5, 2, 3, 4)
y <- c(7, 3, 4, 9, 7, 6, 6, 4, 1, 5)
cor(x, y)
df <- data.frame(x, y)

p_1 <- df %>% 
  ggplot(aes(x = x, y = y)) +
  
  # Pontos
  geom_point(alpha = 1, position = 'jitter', color = "steelblue") +
  
  # Linha
  stat_smooth(method = "lm", se = F, color = "black", size = 0.5) +
  
  # Ajustando x
  xlab('Depressão') +
  xlim(c(0, 11)) +
  
  # Ajustando y
  ylab('Ansiedade') +
  ylim(c(0, 11)) +
  
  # theme
  theme_minimal()

p_1
ggplotly(p_1)














