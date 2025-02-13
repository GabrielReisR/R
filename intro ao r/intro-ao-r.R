################## INTRODU��O AO R ##################

#' Autores: Gabriel R. R. & Wagner L. M.
#' Inspirado em Torfs & Brauer (2012) e Epskamp (2013) "Introductions to R".

#' O c�digo inicial, em R, est� dispon�vel nesse link: https://github.com/wagnerLM/quanti2/blob/master/script%20R%20intro2.R
#' O c�digo final, em R, est� dispon�vel nesse link: https://github.com/GabrielReisR/R/blob/master/Intro%20ao%20R/Intro%20ao%20R.R

#' Essa apresenta��o, em RMarkdown, est� dispon�vel nesse link: https://rpubs.com/reisrgabriel/introaor

#' Todo esse c�digo pode ser rodado direto no R.
#' Tudo o que inicia com "#" ou "#'" s�o coment�rios, e n�o s�o computados pelo R.

####################################################


# Iniciando no R ###################################


## O que � o R?
#' O R � uma linguagem de programa��o altamente utilizada para estat�stica.
#' Ele permite realizar an�lises estat�sticas, visualiza��o de dados, extra��o (minera��o)
#' de dados, e possui ainda outras muitas funcionalidades. Al�m disso, o R � um
#' software livre e gratuito que conta com uma comunidade ativa de usu�rios ao redor 
#' do mundo.
#' 
#' Por essas caracter�sticas acima, novas atualiza��es e possibilidades de an�lise 
#' s�o frequentes no R - o tornando uma ferramenta bem importante para pesquisa 
#' cient�fica, data science etc.
#' 
#' Antes do R, o S havia sido criado em 1976 por John Chambers nos Laborat�rios 
#' Bell - laborat�rios industriais americanos de propriedade da Nokia. Em 1992 
#' na Nova Zelândia, Ross Ihaka e Robert Gentleman come�aram a produzir o R 
#' baseando-se fortemente no software S. Em 1995 a primeira vers�o de R havia sido
#' lan�ada. 
#' 
#' A primeira vers�o est�vel do R saiu em 2000.
#' A partir de 2018, Robert Chambers, criador do S, juntou-se ao time de desenvolvimento
#' do R.
#' 
#' Qualquer informa��o sobre o R pode ser consultada no site oficial do R: https://www.r-project.org/
#' 
#' Dentre as raz�es para utilizar o R est�o:
#' 
#' * Capacidades gr�ficas muito sofisticadas e melhores que muitos softwares.
#' * Possibilidade para desenvolver novas ferramentas.
#' * Comunidade de usu�rios muito ativa e participativa.

## Baixando o R
#' O R � gratuito. Para realizar o download do software, basta acessar o site https://cloud.r-project.org/ 
#' e escolher a vers�o apropriada para sua m�quina.
#' 
#' Para acessar o R, vamos utilizar o RStudio - uma interface que facilita o uso 
#' do R. Da mesma forma, o RStudio � gratuito e pode ser baixado aqui: https://www.rstudio.com/products/rstudio/download/
#' 
#' Para mexermos no R, basta abrir o RStudio.

## Reconhecendo os quadrantes do RStudio
#' Ao abrir o RStudio, voc� notar� algumas divis�es na tela. Cada divis�o 
#' representa um quadrante do R. Cada quadrante nos d� informa��es diferentes.
#' 
#' Representa��o dos quadrantes
#' 1___2
#' 4___3
#' 
#' * 1 - Esquerdo-alto: editor ou script, voc� pode armazenar seus comandos e salvar os seus projetos.
#' * 2 - Direito-alto: espa�o de trabalho e reposit�rio de seus "objetos".
#' * 3 - Direito-baixo: arquivos de ajuda, imagens e gr�ficos, e informa��es dos pacotes.
#' * 4 - Esquerdo-baixo: console e comando, mostra os registros de atividades, sa�das de an�lises e � onde o "R" funciona.
#' 
#' Vamos come�ar?

## Abrindo uma nova aba
#' Caso queira iniciar outro trabalho, voc� pode abrir uma nova aba de script no
#' RStudio.
#' 
#' Para isso, basta ir acessar a aba do programa e clicar em
#' `File -> New File -> R Script`. Agora voc� agora ter� mais um script para utilizar.


# Primeiros passos com o R #########################


## Usando o R como uma calculadora
#' Para come�ar, digite no campo 1 - esquerdo-alto 
#' (a partir de agora, chamado de editor ou script) a seguinte opera��o:
#' `1 + 1`
#' 
#' Agora, para o R reconhecer que voc� quer fazer o resultado dessa opera��o, 
#' voc� precisa rodar esse c�digo.

### Rodando um c�digo
#' Para seus comandos serem executados, selecione ou o in�cio
#' da linha de c�digo, ou o final da linha de c�digo, ou toda a linha de c�digo,
#' e ent�o clique em Run.
#' 
#' * Windows: O comando `Run` pode ser substitu�do por "Ctrl + Enter"
#' * Mac: O comando `Run` pode ser substitu�do por "Cmd + Return"

#' Ficar� assim:
## ----Opera��o b�sica 1----
1 + 1

#' O resultado aparecer� no quadrante 4 - esquerdo-baixo (a partir de agora, 
#' chamado de console):
#' ` [1] 2 `
#' Ou seja, 1 + 1 = 2.
#'
#' � simples assim para utilizar o R como uma calculadora!
#' 
#' Todos os resultados aparecem no console. N�o � necess�rio escrever os comandos 
#' no editor de c�digo (quadrante 1) - se preferir, pode escrev�-los direto no console
#' (quadrante 4).
#' 
#' Para somar, usa-se `+`, como j� mostrado.
#' 
#' Subtrair usando `-`. 
#' Por exemplo, `50 - 25`:
## ----Opera��o b�sica 2----
50 - 25

#' Multiplicar usando `*`. 
#' Por exemplo, `5 * 5`
## ----Opera��o b�sica 3----
5 * 5

#' Dividir usando `/`. 
#' Por exemplo, `50 / 2`
## ----Opera��o b�sica 4----
50 / 2

#' Potencializar usando `**` ou `^x`. 
#' Por exemplo, `5 ** 2` ou `5^2`
## ----Opera��o b�sica 5----
5 ** 2
5 ^ 2

#' Uma s�rie de opera��es podem ser feitas.
#' 
#' Em c�lculos maiores, os par�nteses `( )` s�o utilizados para priorizar 
#' os elementos que precisam ser calculados antes.
#' 
## ----C�lculo simples----
((10 * 20) / 8) ^ 2


# Objetos no R #####################################


#' At� agora trabalhamos apenas com n�meros inteiros e com c�lculos. � importante 
#' citar que o R � esperto suficiente para conseguir trabalhar com texto tamb�m.
#' 
#' Antes de aprender sobre isso, vamos aprender a criar um objeto.

## Criando objetos
#' Um objeto � uma coisa que se pode mudar, mexer e brincar com. Ele possui atributos
#'  espec�ficos, dependendo do que a gente coloca nele.
#' 
#' Para criar um objeto, primeiro se escolhe o seu nome e depois se atribuem os
#' seus valores.
#' 
#' Ah, todas as linhas iniciadas em `#`s�o coment�rios, e n�o s�o processadas como
#' comandos pelo software.


## ----Criando um objeto----
# Vamos agora criar um objeto chamado "objeto".

objeto <- 10

#' Pronto, agora `objeto` possui valor `10`.
#' 
#' Para criar objetos, � preciso definir seu nome `objeto` ou `x` ou `nomeSuperLegal`
#' (o R n�o se importa...). Depois, � necess�rio colocar o sinal de atribui��o `<-`,
#' que pode significar 'possui o valor de'.
#' Finalmente, d�-se o valor do objeto, que nesse caso � `10`.
#' 
#' `objeto <- 10` pode ser lido como criar `objeto` que possui o valor de (`<-`) `10`.
#' 
#' Depois de criado, se pedirmos apenas `objeto` para o R, olhe o que ele nos retorna:
## ----Pedindo valor do objeto----
# Agora vamos apenas pedir `objeto`

objeto

#' O R nos retornou o valor 10! Ele entendeu que `objeto` agora � `10`.
#' 
#' Para saber qual o tipo desse objeto, o que ele �, � s� pedir
## ----Pedindo a classe do objeto----
# Agora vamos apenas para o R informar o que "objeto" �

# Observa��o: class() � uma fun��o que retorna o tipo de objeto colocado nela.

class(objeto)

#' Que legal! O R nos disse que `objeto` � um numeral.
#' 
#' Como um numeral, podemos fazer opera��es com ele, certo?

## ----opera��es com objetos----
objeto + 10  # Retorna 20
objeto - 10  # Retorna 0
objeto / 2   # Retorna 5
objeto * 5   # Retorna 50
objeto / objeto # Retorna 1 (x / x = 1)


## Objetos interagindo com objetos
#' Vamos criar dois objetos, `a`com valor `50` e `b` com valor `3` e pedir para
#' eles interagirem.
#' 
#' Vimos que para criar um objeto, � s� usar a f�rmula `objeto <- valor` (l�-se:
#' objeto possui o valor de 'valor').
 
## ----opera��es com dois objetos----
a <- 50

b <- 3

# Podemos interagir com os objetos

a / b   # 'a' dividido por 'b'
a ** b  # 'a' elevado a 'b'


#' Exerc�cios para voc� fazer

#' 1. Realize `a + b`.
#' 
#' 2. Agora crie um novo objeto, `c`, que possua o valor de `a / b`.
#' 
#' 3. Qual a classe desse novo objeto `c`?


## Mudando o valor de um objeto
#' Outra coisa super f�cil de fazer no R � mudar o valor de uma vari�vel. Para 
#' fazer isso, basta mudar o valor atribu�do para essa vari�vel.
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

# O R reconhece o valor antigo de 'a' e realiza a opera��o 2 * a.

# Mudando o valor de 'a' para 'a / a'

a <- a / a

a

# O R reconhece o valor antigo de 'a' e realiza a opera��o a / a = 1.

#' Pronto! Mudar valores de objetos � algo relativamente simples de se fazer com o R.


#' Exerc�cios para voc� fazer

#' 1. Crie um objeto com a soma de todos os n�meros pares de 0 a 10.
#' 
#' 2. Crie um objeto com a soma de todos os n�meros �mpares de 0 a 10.
#' 
#' 3. Multiplique esses objetos entre si, armazenando esse resultado em uma nova
#' vari�vel.


# Vetores e fun��es ################################

## Criando vetores
#' Vamos aprender a criar um vetor - uma vari�vel que armazena um ou mais valores.
#' 
#' Na verdade, a gente j� criou alguns vetores antes. Basicamente tudo no R � um
#' vetor.
#' 
#' At� agora, vimos vetores com apenas um valor, vamos aprender a criar vetores 
#' com mais de 1 valor.

#' PROBLEMA
#' Imagine que um gerente de voleibol est� interessado em descobrir a m�dia de sal�rios
#' dos jogadores do time de v�lei R Voleibol Clube.
#' 
#' O time possui 8 jogadores, cada um com seu devido n�mero.
#' 
#' * Os jogadores 1 ao 3 recebem R$1500 por m�s.
#' * O jogador 4 recebe R$3000.
#' * O jogador 5 recebe R$10000.
#' * O jogador 6 recebe R$1200.
#' * Os jogadores 7 e 8 recebem R$3300 cada.
#' 
#' Vamos resolver esse problema aprendendo sobre a fun��o concatenar `c()`.
#' 
#' Essa fun��o permite juntar diferentes valores em um mesmo objeto. Assim, podemos
#' criar a vari�vel (aqui em R, um outro nome para objeto) chamada `salario`.

## ----Criando "salario" - Parte 1----
# Vamos adicionar os primeiros tr�s elementos.
salario <- c(1500, 1500, 1500)

salario

#' Pronto, a fun��o `c()` juntou os sal�rios dos primeiros 3 jogadores. A separa��o
#' entre um elemento e outro � feito utilizando uma v�rgula `,`.
#' 
#' Agora, vamos adicionar o sal�rio do jogador 4.

## ----Criando "salario" - Parte 2----
# Vamos adicionar o quarto elemento.
salario <- c(salario, 3000)

salario

#' Olha que interessante! Concatenamos o valor antigo de `salario` junto com o valor
#' novo que quer�amos.
#' 
#' Vamos finalizar isso.

## ----Criando "salario" - Parte 3----
# Vamos adicionar os �ltimos elementos.
salario <- c(salario, 10000, 1200, 3300, 333300)

salario

#' Pronto, a� est� a nossa vari�vel `salario`!
#' 
#' Opa, tem um erro ali. O �ltimo elemento, o elemento de nº 8, est� errado!
#' 
#' Ao inv�s de colocar o valor de `3300`, colocamos o valor de `333300`.
#' 
#' Vamos mudar o valor desse elemento.
#' 
#' Para acessar um elemento de um vetor, basta realizar a fun��o `vetor[elemento]`.
#' 
#' Nesse caso, queremos acessar o elemento n�mero `8` da vari�vel `salario`, para 
#' modificarmos o seu valor.
## ----Acessando um elemento----
# Acessando um elemento
salario[8]  # Isso � como pedir ao R: "R, em 'salario', acesse o elemento '8'".

# Para modificar o valor, basta atribuir um novo valor, como j� v�nhamos fazendo...

salario[8] <- 3300

salario

#' Pronto! Agora `salario` est� organizado assim como a gente queria.
#' 
#' Nesse momento, tendo criado a vari�vel `salario`, possu�mos alguns atributos 
#' que podemos descobrir sobre esse vetor.

## Utilizando fun��es
#' Um atributo poss�vel de obter � a m�dia, a solu��o para o problema l� posto l� em cima. 
#' Para saber a m�dia, vamos utilizar uma fun��o.
#' 
#' Fun��es s�o f�rmulas prontas que podemos utilizar. O R j� vem com algumas 
#' dessas f�rmulas, como por exemplo a raiz quadrada `sqrt()` (abrevia��o do ingl�s para "square root").
#' 
#' Para usar uma fun��o, colocamos o seu nome e ent�o o valor ou objeto que 
#' queremos que essa fun��o receba.
#' 
## ----B�sico de fun��es----
# Raiz quadrada de 25

sqrt(25)

# Algo que se faz bastante � atribuir o resultado de fun��es a objetos 

raiz <- sqrt(25) # calcula a raiz quadrada de 25 e armazena em 'raiz'

raiz

# Assim, o valor da raiz de 25 estar� facilmente dispon�vel

#' Para descobrir o que uma fun��o faz, basta colocar o seu nome no console ao 
#' lado de um ponto de interroga��o, dessa forma `?fun��o`.
#' 
#' Outra forma � usar a fun��o `help()`, dessa forma: `help(fun��o)`. Assim, caso 
#' quis�ssemos entender o que `sqrt()` faz, poder�amos tanto pedir `?sqrt` quanto 
#' `help(sqrt)`. O resultado do que pedimos ir� aparecer no quadrante direito-baixo.

#' VOLTANDO AO PROBLEMA
#' Lembra que o gerente de voleibol estava interessado em descobrir a m�dia de sal�rios 
#' dos jogadores do time de v�lei R Voleibol Clube?
#' 
#' Acontece que a fun��o `mean()` calcula a m�dia dos elementos que colocarmos nela.
 
## ----Calculando a m�dia----
# Calculando a m�dia de dois n�meros

mean(c(25, 10))

# Note que os dois n�meros foram concatenados com a fun��o 'c()'.

# Calculando a m�dia do time de voleibol e armazenando esse valor no objeto `mediaSalario`.

mediaSalario <- mean(salario)

mediaSalario

#' Resolvemos nosso primeiro problema! A m�dia de sal�rio dos jogadores do R Voleibol
#' Clube � de R$3162,50 por m�s.

#' PROBLEMA
#' Cada jogador recebeu um b�nus diferente. Os jogadores 1 a 4 receberam 2000 
#' de b�nus, enquanto os jogadores de 5 a 8 receberam 4000 de b�nus. Calcule a
#' m�dia de sal�rio nesse m�s, considerando os b�nus.
#' 
#' Agora que j� sabemos o b�sico, podemos ser introduzidos � fun��o `rep()`, que
#' repete determinado valor algumas vezes.
#' 
#' Vamos criar um objeto chamado `bonus` utilizando a fun��o `rep()` e `c()`:
 
## ----B�nus no sal�rio----
# Criando bonus

bonus <- c(rep(2000, 4), rep(4000, 4))

bonus

#' Bem, isso foi bem mais f�cil do que criar `salario`. Mas como isso aconteceu?
#' 
#' * Primeiro, colocamos `c()` para concatenar mais de um valor.
#' * Ap�s isso, utilizamos `rep()` para repetir o valor `2000` 4 vezes diferentes.
#' * Separamos essa primeira parte utilizando uma v�rgula `,`.
#' * Nessa segunda parte, utilizamos `rep()` novamente para repetir o valor `4000` 
#' 4 vezes diferentes.
#' * Fechamos o par�nteses de `rep()` e tamb�m fechamos os par�nteses de `c()`.
#' 
#' Assim, 8 elementos foram criados. Como adicionar esses 8 elementos aos antigos
#' 8 elementos?
#' 
#' Basta adicionar os dois vetores!
#' 
#' 1. O elemento `salario[1]` ser� adicionado ao elemento `bonus[1]`.
#' 
#' 2. O elemento `salario[2]` ser� adicionado ao elemento `bonus[2]`.
#' 
#' 3. Essa f�rmula se repete at� o elemento `salario[8]` ser adicionado ao elemento
#' `bonus[8]`.
 
## ----Adicionando dois vetores----
# Para adicionar os dois vetores, basta:

salarioComBonus <- salario + bonus

salarioComBonus


#' Podemos averiguar com a fun��o `mean()` a nova m�dia do valor recebido pelos
#' jogadores. Ainda, podemos utilizar a fun��o `sum()`, que ir� somar todos os elementos
#' que colocarmos nela.

## ----Nova m�dia----
# Averiguando nova m�dia

mediaSalarioComBonus <- mean(salarioComBonus)

mediaSalarioComBonus

# Descobrindo o valor total que os jogadores receberam

somaSalario <- sum(salarioComBonus)

somaSalario

# Utilizando a fun��o summary() - uma boa carta na manga

summary(salarioComBonus) # summary() � usado para informa��es de objetos com n�meros

#' Descobrimos que a nova m�dia � de R$6162,50.
#' Sabemos tamb�m que a soma de todos os sal�rios equivale a R$49300.
#' 
#' Mais legal ainda, `summary()` nos informou v�rias informa��es.
#' 
#' O que`summary()`mostrou?
#' 
#' * Na primeira parte, em `Min.`( M�nimo ): que o valor m�nimo, 
#' na posi��o 0%, foi R$3500.
#' 
#' * Na segunda parte, em `1st Qu.`( 1º Quartil ): que o valor 
#' na casa dos 25% foi R$3500.
#' 
#' * Na terceira parte, em `Median`( Mediana ): que o valor 
#' na casa dos 50% (a mediana) foi R$5100.
#' 
#' * Na quarta parte, em `Mean`( M�dia ): que a m�dia de todos os valores foi R$6162.
#' 
#' * Na quinta parte, em `3rd Qu.`( 3º Quartil ): que o valor 
#' na casa dos 75% foi R$7300.
#' 
#' * Na terceira parte, em `Max.`( M�ximo ): que o valor m�ximo, 
#' na posi��o 100%, foi R$14000.
#' 
#' Assim, `summary()` nos informa os valores na posi��o 0%, 25%, 50% (mediana),
#' 75%, 100% e ainda nos informa a m�dia dos valores.

## Instalando e lendo pacotes
#' Aqui, vale a pena dar uma pausa para mencionar os pacotes do R. Pacotes s�o conjuntos
#' de linhas de c�digo, fun��es e c�lculos que se pode baixar diretamente no R.
#' Assim, ao inv�s de escrever algoritmos dif�ceis no R, podemos baixar pacotes
#' que fazem isso para a gente.

### Instalando o pacote dplyr
#' Para instalar um pacote, basta executar o comando `install.packages("pacote")` 
#' 
#' � importante atentar para as aspas!
#' 
#' Vamos agora instalar um pacote bastante usado para a manipula��o de dados - o 
#' pacote dplyr.

install.packages("dplyr") # basta colocar dplyr no lugar do pacote

### Lendo o pacote dplyr
#' Assim que instalado, para utilizar as fun��es de um pacote, � necess�rio traz�-lo
#' ao R. Para isso, se utiliza a fun��o `library(pacote)`.

library(dplyr) # basta colocar dplyr no lugar do pacote

#' Agora, voc� tem todas as fun��es do `dplyr` para uso.
#' 
#' Caso voc� n�o tenha entendido esse processo, vamos tentar elaborar um pouco 
#' mais. � como se, para ler um livro, fosse necess�rio peg�-lo de uma prateleira
#' e colocar na mesa de trabalho. A prateleira � seu computador, a sua mesa de trabalho
#' � o R.
#' 
#' Quando voc� j� tem um livro em sua prateleira (`install.packages("pacote")`),
#' basta colocar na sua mesa de trabalho com `library(pacote)`. Assim, at� o final
#' da sua sess�o no R, voc� pode utilizar as fun��es desse pacote. Ap�s voc� sair
#' de uma sess�o no R e iniciar outra sess�o no R, ser� necess�rio realizar a leitura
#' do pacote que voc� desejar novamente com `library(pacote)`.

### Instalando tidyverse
#' O pacote tidyverse(https://www.tidyverse.org/) � um pacote bem famoso e utilizado
#' pela comunidade do R. O tidyverse � um pacote que agrupa outros pacotes muito
#' importantes, como o dplyr para manipula��o dos dados, ggplot2 para visualiza��o
#' de dados, readr para importa��o e leitura de dados e outros.


#' Exerc�cios para voc� fazer

#' 1. Instale o pacote tidyverse utilizando o que aprendeu nessa se��o.


# Matrizes #########################################


#' As matrizes s�o elementos que armazenam um conjunto de valores num�ricos. Elas
#' teriam um n�mero i de linhas e um n�mero j de colunas. Assim, uma matriz A~i~~j~
#' que tenha i = 2 e j = 3 � tida como A~2~~3~ - isso significa que essa matriz
#' ter� 2 linhas (i = 2) e 3 colunas (j = 3).
#' 
#' Para criar uma matriz no R, se utiliza a fun��o `matrix()`. Vamos agora criar
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

#' * Primeiro, criamos um objeto chamado `novaMatriz` que armazenar� o valor 
#' resultante da fun��o `matrix()`.
#' * Na fun��o matrix, concatenamos todas os elementos que quer�amos com a fun��o `c()`.
#' Inserimos um `Enter` para visualizar a segunda linha de forma mais f�cil (isso
#' n�o altera os valores da matriz).
#' * Por fim, adicionamos os argumentos `nrow = ` e `ncol = `.
#'   * `nrow = ` pede o n�mero de linhas que queremos colocar nessa matriz.
#'   J� que i = 2, `nrow = 2`.
#'   * `ncol = ` pede o n�mero de colunas que queremos colocar nessa matriz.
#'   J� que j = 3, `ncol = 3`.
#' 
#' Agora que est� criada, podemos acessar elementos espec�ficos dessa matriz. Para
#' isso, utiliza-se o nome da matriz e, dentro de colchetes, o valor da linha e 
#' da coluna que se deseja acessar: `matriz[i, j]`

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


#' J� que podemos acessar, tamb�m podemos modificar esses valores.

## ----Alterando elementos de uma matriz----
# Mudando o elemento da linha 1 e coluna 2

novaMatriz

novaMatriz[1, 2] <- 3

novaMatriz

# Mudando todos os elementos da linha 2 para 0

novaMatriz

novaMatriz[2, ] <- 0

novaMatriz


# Objetos string ###################################


#' Al�m de utilizar objetos para armazenar valores num�ricos, podemos tamb�m 
#' armazenar um conjunto de letras, s�mbolos e n�meros - essas s�o chamadas de strings.
#' 
#' Por exemplo, vamos criar um objeto chamado `string` que cont�m o texto: `Isso � uma string`.

## ----Criando uma string----
# Para criar uma string, deve-se colocar o valor desejado em aspas

string <- "Isso � uma string"

string

outraString <- "10"

outraString

#' Criamos duas strings: uma que cont�m o valor `Isso � uma string` e outro que 
#' cont�m o valor `"10"` - esse "10" n�o � um n�mero pois est� entre aspas.
#' 
#' Podemos adicionar novos elementos assim como fizemos com vetores de n�meros.
 
## ----Criando novos elementos----
# Novo elemento "Outros valores"

string <- c(string, "Outros valores")

string

# Assim como antes, podemos alterar esse elemento ou at� adicionar outro

string[2] <- "Valor mais interessante"

string


# Listas ###########################################


#' Listas s�o um conjunto de objetos - por isso � o �ltimo assunto que veremos.
#' Ela possui a capacidade de armazenar v�rias informa��es diferentes.
#' 
#' At� agora, esses foram os principais objetos criados:
#' * `objeto`: um objeto que cont�m o n�mero `10`.
#' 
#' * `salario`: um vetor contendo 8 sal�rios do time R Voleibol Clube.
#' 
#' * `novaMatriz`: uma matriz A~2~~3~ com n�meros aleat�rios.
#' 
#' * `string`: um vetor de strings contendo 2 elementos.
#' 
#' Uma lista � um objeto que pode abranger todas essas informa��es - ele pode ser
#' criado com a fun��o `list()`.
 
## ----Criando uma lista simples - Parte 1----
# Essa lista vai se chamar listaPoderosa

listaPoderosa <- list(objeto, salario, novaMatriz, string)

listaPoderosa

 
#' J� que n�o nomeamos os objetos que iam entrar na lista, o seguinte aconteceu:
#' 
#' * O elemento `listaPoderosa[[1]]` armazenou o valor de `objeto`.
#' 
#' * O elemento `listaPoderosa[[2]]` armazenou o valor de `salario`.
#' 
#' * O elemento `listaPoderosa[[3]]` armazenou o valor de `novaMatriz`.
#' 
#' * O elemento `listaPoderosa[[4]]` armazenou o valor de `string`.

## ----Criando uma lista simples com objetos nomeados----
# Agora vamos nomear cada objeto com o seu pr�prio nome

listaPoderosa <- list(objeto = objeto, 
                      salario = salario, 
                      novaMatriz = novaMatriz, 
                      string = string)

listaPoderosa

#' Pronto! Para acessar os objetos de uma lista utilizamos o cifr�o `$` (pode-se
#' fazer o mesmo com os objetos de um `data.frame`, como veremos adiante).

#' Com isso, podemos:

#' 1. Observar um objeto espec�fico de uma lista.

#' 2. Modificar um elemento espec�fico ou acrescentar valores diretamente em uma lista.

#' 3. Criar um objeto extraindo apenas um objeto de uma lista.

#' 4. Excluir um objeto de uma lista.

#' 5. Excluir um elemento de uma lista.

## Opera��es em uma lista----
# 1. Observar um objeto espec�fico de uma lista

listaPoderosa[[2]] # Aparece o objeto 2 (salario)
listaPoderosa$salario # Aparece o objeto 2 (salario)

# 2. Modificar um elemento espec�fico ou acrescentar valores diretamente em uma lista.

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


#' Muitas dessas mesmas opera��es com listas podem tamb�m ser feitas em objetos do tipo `data.frame`.
#' Por enquanto � isso! :)

################################################# FIM