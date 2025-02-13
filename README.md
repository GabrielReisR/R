# R
Introdução à linguagem R - do básico ao intermediário. Esse é um documento feito para ensinar e para reforçar conteúdos de manipulação de dados usando dplyr. 

Qualquer comentário, erro ou sugestão, é só falar comigo entrando em contato através de:

* Issues aqui no GitHub
* Por email em reisrgabriel@gmail.com
* Através do meu LinkedIn https://www.linkedin.com/in/gabrielreisrodrigues/.

O material desse repositório é educativo. **Todos os *scripts* podem ser rodados diretamente no R.**

Todos os materiais, em RMarkdown, podem ser encontrados aqui: https://rpubs.com/reisrgabriel

## Introdução ao R

#### Introdução ao R
**[RMarkdown](https://rpubs.com/reisrgabriel/introaor) ou [Script](https://github.com/GabrielReisR/R/blob/master/intro%20ao%20r/intro-ao-r.R)**

Um tutorial prático que apresenta os básicos em R.

  - O que é o R e o RStudio?
  - Funções iniciais
  - Objetos, vetores, matrizes e listas

## Estrutura de dados
#### Importação de bancos de dados e diagnósticos iniciais
**[RMarkdown](https://rpubs.com/reisrgabriel/importdiagn) ou [Script](https://github.com/GabrielReisR/R/blob/master/estrutura%20de%20dados/import-e-diagn.R)**

Tutorial de como importar arquivos .sav, .xls/xlsx e .csv para o R. Após isso, como realizar diagnósticos iniciais do banco de dados.
  - Importação de .sav, .xls/xlsx, .csv
    - Pacotes _haven_,_readxl_ e _readr_
  - Diagnósticos iniciais do banco
    - Usando skim() e glimpse()
  - Visualizando missings com missmap()
  
#### Dplyr: Parte 1
**[Medium](https://medium.com/psicodata/corrigindo-uma-escala-psicometrica-com-r-bfd6340f9609?source=collection_home---4------3-----------------------), [RMarkdown](https://rpubs.com/reisrgabriel/dplyrPt1) ou [Script](https://github.com/GabrielReisR/R/blob/master/estrutura%20de%20dados/dplyr-parte-1.R)**

Operações em data.frames feitas com o pacote _dplyr_, contido no tidyverse. Vamos selecionar, renomear e excluir variáveis de um banco de dados. Além disso, criar novas colunas em data.frames e recodificar valores de um banco de dados. Faremos isso com o banco de dados DASS42 que contém 39775 casos.

  - Usando select()
    - Selecionando e excluindo variáveis
    - Renomeando colunas com starts_with()
  - Usando mutate()
    - Criando novas variáveis com mutate_at()
    - Utilizando case_when()
    
#### Dplyr: Parte 2
**[RMarkdown](https://rpubs.com/reisrgabriel/dplyrPt2) ou [Script](https://github.com/GabrielReisR/R/blob/master/estrutura%20de%20dados/estrutura%20de%20dados/dplyr-parte-2.R)** 

Operações em data.frames feitas com o pacote _dplyr_, contido no tidyverse. Vamos juntar colunas de bancos de dados diferentes e também juntar linhas de bancos diferentes com bind(). Além disso, aprenderemos sobre joins() para juntar bancos de dados em uma fatia do banco da DASS42 que possuem colunas de nomes iguais. Ademais, usaremos filtering joins() para escolher condições específicas para entrada de casos ao juntarmos dois bancos de dados.
  - Usando bind()
  - Joins()

#### Tidyr: Parte 1
**[Medium](https://medium.com/psicodata/transformando-colunas-em-linhas-com-tidyr-a649f287a238), [RMarkdown](https://rpubs.com/reisrgabriel/tidyrPt1) ou [Script](https://github.com/GabrielReisR/R/blob/master/estrutura%20de%20dados/estrutura%20de%20dados/tidyr-parte-1.R)** 

Fazendo alterações em data.frame com o pacote tidyr buscando qualidade dos dados. Transformações de dados wide para long, e união de valores entre colunas e linhas.
  - Uma célula, um valor único
  - Uma coluna, uma variável
  - Uma linha, uma observação
  - Unir valores
  
#### Tidyr: Parte 2
**[Medium](https://medium.com/psicodata/valores-missing-parte-1-4382bb026660?source=collection_home---4------0-----------------------), [RMarkdown](https://rpubs.com/reisrgabriel/tidyrPt2) ou [Script](https://github.com/GabrielReisR/R/blob/master/estrutura%20de%20dados/estrutura%20de%20dados/tidyr-parte-2.R)** 

Fazendo alterações em data.frame com o pacote tidyr buscando qualidade dos dados. Alterando nomes de todas colunas com o pacote janitor, limpando missings do banco de dados.
  - Limpando nome das colunas
    - Pacote *janitor*
  - Excluindo missings
    - drop_na
  - Substituindo missings
    - fill_na, replace_na
  - Imputando missings com regressão linear
  
## Estatística
#### Medidas comuns
**[Medium](https://medium.com/psicodata/entenda-a-media-pelo-menos-1-desvio-padrao-acima-da-media-145e9edb6a8f), [RMarkdown](https://rpubs.com/reisrgabriel/medidascomuns) ou [Script](https://github.com/GabrielReisR/R/blob/master/estatistica/medidas-comuns.R)**

Entendendo amplitude, moda, média, mediana, boxplot e desvio-padrão.

#### Avaliação de normalidade
**[Medium](bit.ly/normalcomr), [RMarkdown](https://rpubs.com/reisrgabriel/avalicaodenormalidade) ou [Script](https://github.com/GabrielReisR/R/blob/master/estatistica/avaliacao-de-normalidade.R)**

Passo a passo sobre como avaliar a normalidade de uma variável.
  - Histograma e densidade
  - QQ Plot
  - Assimetria e Curtose com `stat.desc`
  - Shapiro-Wilk e Kolgomorov-Smirnov
<<<<<<< HEAD
  
#### Correlação
**[Medium](https://medium.com/psicodata/entendendo-de-coracao-a-correlacao-ad27a948c14a) ou [Script](https://github.com/GabrielReisR/R/blob/master/estatistica/correlacoes.R)**

Discutidos procedimentos de correlação no R. São vistas as seguintes correlações:
  - Linear de Pearson (contínua-contínua)
    - Cálculo da correlação do zero
    - Correlação parcial
  - Point-biserial (contínua-dicotômica)
  - Biserial (contínua-dicotomizada)
  - Tetracórica (dicotomizada-dicotomizada)
  - Policórica (ordinal-ordinal)
  - qgraph::cor_auto() (detecta automaticamente o tipo das variáveis)
  - Análise de redes (brevemente citada a partir da matriz de correlação policórica)
    
#### Análise Fatorial Exploratória
**[Medium](https://medium.com/psicodata/tutorial-de-analise-fatorial-exploratoria-no-r-1db5b6bf8dd5) ou [Script](https://github.com/GabrielReisR/R/blob/master/estatistica/analise_fatorial_exploratoria.R)**

É feita a discussão passo a passo do procedimento de Análise Fatorial Exploratória.

  - Matriz inicial de correlação
  - Seleção de fatores
    - Cálculo do Eigenvalue
    - Scree plot
    - Análise paralela
  - Análise fatorial exploratória
    - Explicação de factor loadings (escores fatoriais)
    - Explicação de comunalidade e unicidade (communality e uniqueness)
    - Explicação do novo valor de Eigenvalue
    - Explicação do que significa Proportion of Variance (proporção de variância)
  - Diagrama da análise fatorial
    - Diagrama mais bonitinho da análise
    - Visualização geométrica do modelo
  - CURIOSIDADE
    - Descobrindo Eigenvalue e Proportion Var da EFA na mão
