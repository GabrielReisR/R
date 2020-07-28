################## INTRODUÇÃO AO R ##################

#' Autores: Gabriel R. R. & Wagner L. M.
#' Inspirado em Torfs & Brauer (2012) e Epskamp (2013) "Introductions to R".

#' O código inicial, em R, está disponível nesse link: https://github.com/wagnerLM/quanti2/blob/master/script%20R%20intro2.R
#' O código final, em R, está disponível nesse link: https://github.com/GabrielReisR/R/blob/master/Intro%20ao%20R/Intro%20ao%20R.R

#' Essa apresentação, em RMarkdown, está disponível nesse link: https://rpubs.com/reisrgabriel/IntroAoR

#' Todo esse código pode ser rodado direto no R.
#' Tudo o que inicia com "#" ou "#'" são comentários, e não são computados pelo R.

####################################################

# 1. Iniciando no R

## 1.1 O que é o R?
#' O R é uma linguagem de programação altamente utilizada para estatística.
#' Ele permite realizar análises estatísticas, visualização de dados, extração (mineração)
#' de dados, e possui ainda outras muitas funcionalidades. Além disso, o R é um
#' software livre e gratuito que conta com uma comunidade ativa de usuários ao redor 
#' do mundo.
#' 
#' Por essas características acima, novas atualizações e possibilidades de análise 
#' são frequentes no R - o tornando uma ferramenta bem importante para pesquisa 
#' científica, data science etc.
#' 
#' Antes do R, o S havia sido criado em 1976 por John Chambers nos Laboratórios 
#' Bell - laboratórios industriais americanos de propriedade da Nokia. Em 1992 
#' na Nova ZelÃ¢ndia, Ross Ihaka e Robert Gentleman começaram a produzir o R 
#' baseando-se fortemente no software S. Em 1995 a primeira versão de R havia sido
#' lançada. 
#' 
#' A primeira versão estável do R saiu em 2000.
#' A partir de 2018, Robert Chambers, criador do S, juntou-se ao time de desenvolvimento
#' do R.
#' 
#' Qualquer informação sobre o R pode ser consultada no site oficial do R: https://www.r-project.org/
#' 
#' Dentre as razões para utilizar o R estão:
#' 
#' * Capacidades gráficas muito sofisticadas e melhores que muitos softwares.
#' * Possibilidade para desenvolver novas ferramentas.
#' * Comunidade de usuários muito ativa e participativa.

## 1.2 Baixando o R
#' O R é gratuito. Para realizar o download do software, basta acessar o site https://cloud.r-project.org/ 
#' e escolher a versão apropriada para sua máquina.
#' 
#' Para acessar o R, vamos utilizar o RStudio - uma interface que facilita o uso 
#' do R. Da mesma forma, o RStudio é gratuito e pode ser baixado aqui: https://www.rstudio.com/products/rstudio/download/
#' 
#' Para mexermos no R, basta abrir o RStudio.

## 1.3 Reconhecendo os quadrantes do RStudio
#' Ao abrir o RStudio, você notará algumas divisões na tela. Cada divisão 
#' representa um quadrante do R. Cada quadrante nos dá informações diferentes.
#' 
#' Representação dos quadrantes
#' 1___2
#' 4___3
#' 
#' * 1 - Esquerdo-alto: editor ou script, você pode armazenar seus comandos e salvar os seus projetos.
#' * 2 - Direito-alto: espaço de trabalho e repositório de seus "objetos".
#' * 3 - Direito-baixo: arquivos de ajuda, imagens e gráficos, e informações dos pacotes.
#' * 4 - Esquerdo-baixo: console e comando, mostra os registros de atividades, saídas de análises e é onde o "R" funciona.
#' 
#' Vamos começar?

## 1.4 Abrindo uma nova aba
#' Caso queira iniciar outro trabalho, você pode abrir uma nova aba de script no
#' RStudio.
#' 
#' Para isso, basta ir acessar a aba do programa e clicar em
#' `File -> New File -> R Script`. Agora você agora terá mais um script para utilizar.

# 2. Primeiros passos com o R

## 2.1 Usando o R como uma calculadora
#' Para começar, digite no campo 1 - esquerdo-alto 
#' (a partir de agora, chamado de editor ou script) a seguinte operação:
#' `1 + 1`
#' 
#' Agora, para o R reconhecer que você quer fazer o resultado dessa operação, 
#' você precisa rodar esse código.

### 2.1.2 Rodando um código
#' Para seus comandos serem executados, selecione ou o início
#' da linha de código, ou o final da linha de código, ou toda a linha de código,
#' e então clique em Run.
#' 
#' * Windows: O comando `Run` pode ser substituído por "Ctrl + Enter"
#' * Mac: O comando `Run` pode ser substituído por "Cmd + Return"

#' Ficará assim:
## ----Operação básica 1----
1 + 1

#' O resultado aparecerá no quadrante 4 - esquerdo-baixo (a partir de agora, 
#' chamado de console):
#' ` [1] 2 `
#' Ou seja, 1 + 1 = 2.
#'
#' É simples assim para utilizar o R como uma calculadora!
#' 
#' Todos os resultados aparecem no console. Não é necessário escrever os comandos 
#' no editor de código (quadrante 1) - se preferir, pode escrevê-los direto no console
#' (quadrante 4).
#' 
#' Para somar, usa-se `+`, como já mostrado.
#' 
#' Subtrair usando `-`. 
#' Por exemplo, `50 - 25`:
## ----Operação básica 2----
50 - 25

#' Multiplicar usando `*`. 
#' Por exemplo, `5 * 5`
## ----Operação básica 3----
5 * 5

#' Dividir usando `/`. 
#' Por exemplo, `50 / 2`
## ----Operação básica 4----
50 / 2

#' Potencializar usando `**` ou `^x`. 
#' Por exemplo, `5 ** 2` ou `5^2`
## ----Operação básica 5----
5 ** 2
5 ^ 2

#' Assim, uma série de operações podem ser feitas.
#' 
#' Em cálculos maiores, os parênteses `( )` são utilizados para priorizar 
#' os elementos que precisam ser calculados antes.
#' 
## ----Cálculo simples----
((10 * 20) / 8) ^ 2

# 3. Objetos no R

#' Até agora trabalhamos apenas com números inteiros e com cálculos. É importante 
#' citar que o R é esperto suficiente para conseguir trabalhar com texto também.
#' 
#' Antes de aprender sobre isso, vamos aprender a criar um objeto.
 
## 3.1 Criando objetos
#' Um objeto é uma coisa que se pode mudar, mexer e brincar com. Ele possui atributos
#'  específicos, dependendo do que a gente coloca nele.
#' 
#' Para criar um objeto, primeiro se escolhe o seu nome e depois se atribuem os
#' seus valores.
#' 
#' Ah, todas as linhas iniciadas em`#`são comentários, e não são processadas como
#' comandos pelo software.
#' 
## ----Criando um objeto----
# Vamos agora criar um objeto chamado "objeto".

objeto <- 10

#' Pronto, agora `objeto` possui valor `10`.
#' 
#' Para criar objetos, é preciso definir seu nome `objeto` ou `x` ou `nomeSuperLegal`
#' (o R não se importa...). Depois, é necessário colocar o sinal de atribuição `<-`,
#' que pode significar 'possui o valor de'.
#' Finalmente, dá-se o valor do objeto, que nesse caso é `10`.
#' 
#' `objeto <- 10` pode ser lido como criar `objeto` que possui o valor de (`<-`) `10`.
#' 
#' Depois de criado, se pedirmos apenas `objeto` para o R, olhe o que ele nos retorna:
## ----Pedindo valor do objeto----
# Agora vamos apenas pedir `objeto`

objeto

#' O R nos retornou o valor 10! Ele entendeu que `objeto` agora é `10`.
#' 
#' Para saber qual o tipo desse objeto, o que ele é, é só pedir
## ----Pedindo a classe do objeto----
# Agora vamos apenas para o R informar o que "objeto" é

# Observação: class() é uma função que retorna o tipo de objeto colocado nela.

class(objeto)

#' Que legal! O R nos disse que `objeto` é um numeral.
#' 
#' Como um numeral, podemos fazer operações com ele, certo?
## ----operações com objetos----
objeto + 10  # Retorna 20
objeto - 10  # Retorna 0
objeto / 2   # Retorna 5
objeto * 5   # Retorna 50
objeto / objeto # Retorna 1 (x / x = 1)


## 3.2 Objetos interagindo com objetos
#' Vamos criar dois objetos, `a`com valor `50` e `b` com valor `3` e pedir para
#' eles interagirem.
#' 
#' Vimos que para criar um objeto, é só usar a fórmula `objeto <- valor` (lê-se:
#' objeto possui o valor de 'valor').
#' 
## ----operações com dois objetos----
a <- 50

b <- 3

# Podemos interagir com os objetos

a / b   # 'a' dividido por 'b'
a ** b  # 'a' elevado a 'b'

#' Exercícios para você fazer

#' 1. Realize `a + b`.
#' 
#' 2. Agora crie um novo objeto, `c`, que possua o valor de `a / b`.
#' 
#' 3. Qual a classe desse novo objeto `c`?


## 3.3 Mudando o valor de um objeto
#' Outra coisa super fácil de fazer no R é mudar o valor de uma variável. Para 
#' fazer isso, basta mudar o valor atribuído para essa variável.
#' 
## ----Mudando o valor de um objeto----
# Mudando o valor de 'a' para 33846

a <- 50

a

a <- 33846

a

# Mudando o valor de 'a' para (5 + 12 + 8 + 1) * 4

a <- (5 + 12 + 8 + 1) * 4

a

# Mudando o valor de 'a' para 'a / a'

a <- 2 * a

a

# O R reconhece o valor antigo de 'a' e realiza a operação 2 * a.

# Mudando o valor de 'a' para 'a / a'

a <- a / a

a

# O R reconhece o valor antigo de 'a' e realiza a operação a / a = 1.

#' Pronto! Mudar valores de objetos é algo relativamente simples de se fazer com o R.

#' Exercícios para você fazer

#' 1. Crie um objeto com a soma de todos os números pares de 0 a 10.
#' 
#' 2. Crie um objeto com a soma de todos os números ímpares de 0 a 10.
#' 
#' 3. Multiplique esses objetos entre si, armazenando esse resultado em uma nova
#' variável.
 
# 4. Vetores e funções

## 4.1 Criando vetores
#' Vamos aprender a criar um vetor - uma variável que armazena um ou mais valores.
#' 
#' Na verdade, a gente já criou alguns vetores antes. Basicamente tudo no R é um
#' vetor.
#' 
#' Até agora, vimos vetores com apenas um valor, vamos aprender a criar vetores 
#' com mais de 1 valor.

#' PROBLEMA
#' Imagine que um gerente de voleibol está interessado em descobrir a média de salários
#' dos jogadores do time de vôlei R Voleibol Clube.
#' 
#' O time possui 8 jogadores, cada um com seu devido número.
#' 
#' * Os jogadores 1 ao 3 recebem R$1500 por mês.
#' * O jogador 4 recebe R$3000.
#' * O jogador 5 recebe R$10000.
#' * O jogador 6 recebe R$1200.
#' * Os jogadores 7 e 8 recebem R$3300 cada.
#' 
#' Vamos resolver esse problema aprendendo sobre a função concatenar `c()`.
#' 
#' Essa função permite juntar diferentes valores em um mesmo objeto. Assim, podemos
#' criar a variável (aqui em R, um outro nome para objeto) chamada `salario`.
#' 
## ----Criando "salario" - Parte 1----
# Vamos adicionar os primeiros três elementos.
salario <- c(1500, 1500, 1500)

salario

#' Pronto, a função `c()` juntou os salários dos primeiros 3 jogadores. A separação
#' entre um elemento e outro é feito utilizando uma vírgula `,`.
#' 
#' Agora, vamos adicionar o salário do jogador 4.
#' 
## ----Criando "salario" - Parte 2----
# Vamos adicionar o quarto elemento.
salario <- c(salario, 3000)

salario

#' Olha que interessante! Concatenamos o valor antigo de `salario` junto com o valor
#' novo que queríamos.
#' 
#' Vamos finalizar isso.
#' 
## ----Criando "salario" - Parte 3----
# Vamos adicionar os últimos elementos.
salario <- c(salario, 10000, 1200, 3300, 333300)

salario

#' Pronto, aí está a nossa variável `salario`!
#' 
#' Opa, tem um erro ali. O último elemento, o elemento de nÂº 8, está errado!
#' 
#' Ao invés de colocar o valor de `3300`, colocamos o valor de `333300`.
#' 
#' Vamos mudar o valor desse elemento.
#' 
#' Para acessar um elemento de um vetor, basta realizar a função `vetor[elemento]`.
#' 
#' Nesse caso, queremos acessar o elemento número `8` da variável `salario`, para 
#' modificarmos o seu valor.
## ----Acessando um elemento----
# Acessando um elemento
salario[8]  # Isso é como pedir ao R: "R, em 'salario', acesse o elemento '8'".

# Para modificar o valor, basta atribuir um novo valor, como já vínhamos fazendo...

salario[8] <- 3300

salario

#' Pronto! Agora `salario` está organizado assim como a gente queria.
#' 
#' Nesse momento, tendo criado a variável `salario`, possuímos alguns atributos 
#' que podemos descobrir sobre esse vetor.

## 4.2 Utilizando funções
#' Um atributo possível de obter é a média, a solução para o problema lá posto lá em cima. 
#' Para saber a média, vamos utilizar uma função.
#' 
#' Funções são fórmulas prontas que podemos utilizar. O R já vem com algumas 
#' dessas fórmulas, como por exemplo a raiz quadrada `sqrt()` (abreviação do inglês para "square root").
#' 
#' Para usar uma função, colocamos o seu nome e então o valor ou objeto que 
#' queremos que essa função receba.
#' 
## ----Básico de funções----
# Raiz quadrada de 25

sqrt(25)

# Algo que se faz bastante é atribuir o resultado de funções a objetos 

raiz <- sqrt(25) # calcula a raiz quadrada de 25 e armazena em 'raiz'

raiz

# Assim, o valor da raiz de 25 estará facilmente disponível

#' Para descobrir o que uma função faz, basta colocar o seu nome no console ao 
#' lado de um ponto de interrogação, dessa forma `?função`.
#' 
#' Outra forma é usar a função `help()`, dessa forma: `help(função)`. Assim, caso 
#' quiséssemos entender o que `sqrt()` faz, poderíamos tanto pedir `?sqrt` quanto 
#' `help(sqrt)`. O resultado do que pedimos irá aparecer no quadrante direito-baixo.

#' VOLTANDO AO PROBLEMA
#' Lembra que o gerente de voleibol estava interessado em descobrir a média de salários 
#' dos jogadores do time de vôlei R Voleibol Clube?
#' 
#' Acontece que a função `mean()` calcula a média dos elementos que colocarmos nela.
#' 
## ----Calculando a média----
# Calculando a média de dois números

mean(c(25, 10))

# Note que os dois números foram concatenados com a função 'c()'.

# Calculando a média do time de voleibol e armazenando esse valor no objeto `mediaSalario`.

mediaSalario <- mean(salario)

mediaSalario

#' Resolvemos nosso primeiro problema! A média de salário dos jogadores do R Voleibol
#' Clube é de R$3162,50 por mês.

#' PROBLEMA
#' Cada jogador recebeu um bônus diferente. Os jogadores 1 a 4 receberam 2000 
#' de bônus, enquanto os jogadores de 5 a 8 receberam 4000 de bônus. Calcule a
#' média de salário nesse mês, considerando os bônus.
#' 
#' Agora que já sabemos o básico, podemos ser introduzidos à função `rep()`, que repete
#' determinado valor algumas vezes.
#' 
#' Vamos criar um objeto chamado `bonus` utilizando a função `rep()` e `c()`:
#' 
## ----Bônus no salário----
# Criando bonus

bonus <- c(rep(2000, 4), rep(4000, 4))

bonus

#' Bem, isso foi bem mais fácil do que criar `salario`. Mas como isso aconteceu?
#' 
#' * Primeiro, colocamos `c()` para concatenar mais de um valor.
#' * Após isso, utilizamos `rep()` para repetir o valor `2000` 4 vezes diferentes.
#' * Separamos essa primeira parte utilizando uma vírgula `,`.
#' * Nessa segunda parte, utilizamos `rep()` novamente para repetir o valor `4000` 
#' 4 vezes diferentes.
#' * Fechamos o parênteses de `rep()` e também fechamos os parênteses de `c()`.
#' 
#' Assim, 8 elementos foram criados. Como adicionar esses 8 elementos aos antigos 8 elementos?
#' 
#' Basta adicionar os dois vetores!
#' 
#' 1. O elemento `salario[1]` será adicionado ao elemento `bonus[1]`.
#' 
#' 2. O elemento `salario[2]` será adicionado ao elemento `bonus[2]`.
#' 
#' 3. Essa fórmula se repete até o elemento `salario[8]` ser adicionado ao elemento
#' `bonus[8]`.
#' 
## ----Adicionando dois vetores----
# Para adicionar os dois vetores, basta:

salarioComBonus <- salario + bonus

salarioComBonus


#' Podemos averiguar com a função `mean()` a nova média do valor recebido pelos
#' jogadores. Ainda, podemos utilizar a função `sum()`, que irá somar todos os elementos
#' que colocarmos nela.

## ----Nova média----
# Averiguando nova média

mediaSalarioComBonus <- mean(salarioComBonus)

mediaSalarioComBonus

# Descobrindo o valor total que os jogadores receberam

somaSalario <- sum(salarioComBonus)

somaSalario

# Utilizando a função summary() - uma boa carta na manga

summary(salarioComBonus) # summary() é usado para informações de objetos com números

#' Descobrimos que a nova média é de R$6162,50.
#' Sabemos também que a soma de todos os salários equivale a R$49300.
#' 
#' Mais legal ainda, `summary()` nos informou várias informações.
#' 
#' O que`summary()`mostrou?
#' 
#' * Na primeira parte, em `Min.`( Mínimo ): que o valor mínimo, 
#' na posição 0%, foi R$3500.
#' 
#' * Na segunda parte, em `1st Qu.`( 1Âº Quartil ): que o valor 
#' na casa dos 25% foi R$3500.
#' 
#' * Na terceira parte, em `Median`( Mediana ): que o valor 
#' na casa dos 50% (a mediana) foi R$5100.
#' 
#' * Na quarta parte, em `Mean`( Média ): que a média de todos os valores foi R$6162.
#' 
#' * Na quinta parte, em `3rd Qu.`( 3Âº Quartil ): que o valor 
#' na casa dos 75% foi R$7300.
#' 
#' * Na terceira parte, em `Max.`( Máximo ): que o valor máximo, 
#' na posição 100%, foi R$14000.
#' 
#' Assim, `summary()` nos informa os valores na posição 0%, 25%, 50% (mediana),
#' 75%, 100% e ainda nos informa a média dos valores.

## 4.3 Instalando e lendo pacotes
#' Aqui, vale a pena dar uma pausa para mencionar os pacotes do R. Pacotes são conjuntos
#' de linhas de código, funções e cálculos que se pode baixar diretamente no R.
#' Assim, ao invés de escrever algoritmos difíceis no R, podemos baixar pacotes
#' que fazem isso para a gente.

### 4.3.1 Instalando o pacote dplyr
#' Para instalar um pacote, basta executar o comando `install.packages("pacote")` 
#' 
#' É importante atentar para as aspas!
#' 
#' Vamos agora instalar um pacote bastante usado para a manipulação de dados - o 
#' pacote dplyr.

install.packages("dplyr") # basta colocar dplyr no lugar do pacote

### 4.3.2 Lendo o pacote dplyr
#' Assim que instalado, para utilizar as funções de um pacote, é necessário trazê-lo
#' ao R. Para isso, se utiliza a função `library(pacote)`.

library(dplyr) # basta colocar dplyr no lugar do pacote

#' Agora, você tem todas as funções do `dplyr` para uso.
#' 
#' Caso você não tenha entendido esse processo, vamos tentar elaborar um pouco 
#' mais. É como se, para ler um livro, fosse necessário pegá-lo de uma prateleira
#' e colocar na mesa de trabalho. A prateleira é seu computador, a sua mesa de trabalho
#' é o R.
#' 
#' Quando você já tem um livro em sua prateleira (`install.packages("pacote")`),
#' basta colocar na sua mesa de trabalho com `library(pacote)`. Assim, até o final
#' da sua sessão no R, você pode utilizar as funções desse pacote. Após você sair
#' de uma sessão no R e iniciar outra sessão no R, será necessário realizar a leitura
#' do pacote que você desejar novamente com `library(pacote)`.

### 4.3.3 Instalando tidyverse
#' O pacote tidyverse(https://www.tidyverse.org/) é um pacote bem famoso e utilizado
#' pela comunidade do R. O tidyverse é um pacote que agrupa outros pacotes muito
#' importantes, como o dplyr para manipulação dos dados, ggplot2 para visualização
#' de dados, readr para importação e leitura de dados e outros.

#' Exercícios para você fazer

#' 1. Instale o pacote tidyverse utilizando o que aprendeu nessa seção.

# 5. Matrizes
#' As matrizes são elementos que armazenam um conjunto de valores numéricos. Elas
#' teriam um número i de linhas e um número j de colunas. Assim, uma matriz A~i~~j~
#' que tenha i = 2 e j = 3 é tida como A~2~~3~ - isso significa que essa matriz
#' terá 2 linhas (i = 2) e 3 colunas (j = 3).
#' 
#' Para criar uma matriz no R, se utiliza a função `matrix()`. Vamos agora criar
#' uma matriz A~2~~3~ que tenha os valores `5`, `2` e `7` na primeira linha, e
#' `10`, `1` e `9` na segunda linha.
#' 
## ----Criando uma matriz----
# Para adicionar os dois vetores, basta:

novaMatriz <- matrix(c(5, 2, 7,
                       10, 1, 9), 
                     nrow = 2, 
                     ncol = 3)

novaMatriz

#' * Primeiro, criamos um objeto chamado `novaMatriz` que armazenará o valor 
#' resultante da função `matrix()`.
#' * Na função matrix, concatenamos todas os elementos que queríamos com a função `c()`.
#' Inserimos um `Enter` para visualizar a segunda linha de forma mais fácil (isso
#' não altera os valores da matriz).
#' * Por fim, adicionamos os argumentos `nrow = ` e `ncol = `.
#'   * `nrow = ` pede o número de linhas que queremos colocar nessa matriz.
#'   Já que i = 2, `nrow = 2`.
#'   * `ncol = ` pede o número de colunas que queremos colocar nessa matriz.
#'   Já que j = 3, `ncol = 3`.
#' 
#' Agora que está criada, podemos acessar elementos específicos dessa matriz. Para isso, utiliza-se o nome da matriz e, dentro de colchetes, o valor da linha e da coluna que se deseja acessar: `matriz[i, j]`
#' 
## ----Acessando elementos de uma matriz----
# Acessar o elemento da linha 1 e coluna 2

novaMatriz[1, 2]

# Acessar o elemento da linha 2 e coluna 3

novaMatriz[2, 3]

# Acessar todos os valores da segunda coluna

novaMatriz[, 2]

# Acessar todos os valores da primeira linha

novaMatriz[1, ]

# Acessar os valores das linhas de 1 a 2 da coluna 1

novaMatriz[1:2, 1]

#' 
#' Já que podemos acessar, também podemos modificar esses valores.
#' 
## ----Alterando elementos de uma matriz----
# Mudando o elemento da linha 1 e coluna 2

novaMatriz

novaMatriz[1, 2] <- 3

novaMatriz

# Mudando todos os elementos da linha 2 para 0

novaMatriz

novaMatriz[2, ] <- 0

novaMatriz

# 6. Objetos string
#' Além de utilizar objetos para armazenar valores numéricos, podemos também 
#' armazenar um conjunto de letras, símbolos e números - essas são chamadas de strings.
#' 
#' Por exemplo, vamos criar um objeto chamado `string` que contém o texto: `Isso é uma string`.
#' 
## ----Criando uma string----
# Para criar uma string, deve-se colocar o valor desejado em aspas

string <- "Isso é uma string"

string

outraString <- "10"

outraString

#' Criamos duas strings: uma que contém o valor `Isso é uma string` e outro que contém o valor `"10"` - esse "10" não é um número pois está entre aspas.
#' 
#' Podemos adicionar novos elementos assim como fizemos com vetores de números.
#' 
## ----Criando novos elementos----
# Novo elemento "Outros valores"

string <- c(string, "Outros valores")

string

# Assim como antes, podemos alterar esse elemento ou até adicionar outro

string[2] <- "Valor mais interessante"

string

#' ## 7. Listas
#' Listas são um conjunto de objetos - por isso é o último assunto que veremos.
#' Ela possui a capacidade de armazenar várias informações diferentes.
#' 
#' Até agora, esses foram os principais objetos criados:
#' * `objeto`: um objeto que contém o número `10`.
#' 
#' * `salario`: um vetor contendo 8 salários do time R Voleibol Clube.
#' 
#' * `novaMatriz`: uma matriz A~2~~3~ com números aleatórios.
#' 
#' * `string`: um vetor de strings contendo 2 elementos.
#' 
#' Uma lista é um objeto que pode abranger todas essas informações - ele pode ser
#' criado com a função `list()`.
#' 
## ----Criando uma lista simples - Parte 1----
# Essa lista vai se chamar listaPoderosa

listaPoderosa <- list(objeto, salario, novaMatriz, string)

listaPoderosa

#' 
#' Já que não nomeamos os objetos que iam entrar na lista, o seguinte aconteceu:
#' 
#' * O elemento `listaPoderosa[[1]]` armazenou o valor de `objeto`.
#' 
#' * O elemento `listaPoderosa[[2]]` armazenou o valor de `salario`.
#' 
#' * O elemento `listaPoderosa[[3]]` armazenou o valor de `novaMatriz`.
#' 
#' * O elemento `listaPoderosa[[4]]` armazenou o valor de `string`.
#' 
## ----Criando uma lista simples com objetos nomeados----
# Agora vamos nomear cada objeto com o seu próprio nome

listaPoderosa <- list(objeto = objeto, 
                      salario = salario, 
                      novaMatriz = novaMatriz, 
                      string = string)

listaPoderosa


#' Pronto! Para acessar os objetos de uma lista utilizamos o cifrão `$` (pode-se
#' fazer o mesmo com os objetos de um `data.frame`, como veremos adiante).

#' Com isso, podemos:

#' 1. Observar um objeto específico de uma lista.

#' 2. Modificar um elemento específico ou acrescentar valores diretamente em uma lista.

#' 3. Criar um objeto extraindo apenas um objeto de uma lista.

#' 4. Excluir um objeto de uma lista.
 
#' 5. Excluir um elemento de uma lista.


## Operações em uma lista----
# 1. Observar um objeto específico de uma lista

listaPoderosa[[2]] # Aparece o objeto 2 (salario)
listaPoderosa$salario # Aparece o objeto 2 (salario)


# 2. Modificar um elemento específico ou acrescentar valores diretamente em uma lista.

listaPoderosa[[2]][1] <- 5000 # Acessa o objeto 2 (salario), elemento 1, e modifica ele para 5000
listaPoderosa$salario[1] <- 5000 # Acessa o objeto 2 (salario), elemento 1, e modifica ele para 5000

# 3. Criar um objeto extraindo apenas um objeto de uma lista.

queroEssaMatriz <- listaPoderosa$novaMatriz # pega o objeto matriz e armazena em um objeto separado
queroEssaMatriz

# 4. Excluir um objeto de uma lista.

listaPoderosa <- listaPoderosa[-salario] # recria o objeto listaPoderosa, dessa vez sem o objeto "salario"
listaPoderosa

# 5. Excluir um elemento de uma lista

listaPoderosa$string <- listaPoderosa$string[-2] # o objeto string possui o valor de string SEM o elemento 2
listaPoderosa$string # acessando apenas o objeto string


#' Muitas dessas mesmas operações com listas podem também ser feitas em objetos do tipo `data.frame`.
#' Por enquanto é isso! :)

#################################################FIM
