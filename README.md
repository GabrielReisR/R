# R
### Introdução à linguagem R - do básico ao intermediário

O material desse repositório é educativo. Todos os *scripts* podem ser rodados diretamente no R.

Todos os materiais, em RMarkdown, podem ser encontrados aqui: https://rpubs.com/reisrgabriel

### Iniciando com R
  *Introdução ao R* ([RMarkdown](https://rpubs.com/reisrgabriel/IntroAoR) ou [Script](https://github.com/GabrielReisR/R/blob/master/Intro%20ao%20R/Intro%20ao%20R.R)) 
  - O que é o R e o RStudio?
  - Funções iniciais
  - Objetos, vetores, matrizes e listas
  
### Estrutura de dados
  *Importação de bancos de dados e diagnósticos iniciais* ([RMarkdown](https://rpubs.com/reisrgabriel/ImportDiagn) ou [Script](https://github.com/GabrielReisR/R/blob/master/Import%20e%20diagn/Import%20e%20diagn.R))
Tutorial de como importar arquivos .sav, .xls/xlsx e .csv para o R. Após isso, como realizar diagnósticos iniciais do banco de dados.
  - Importação de .sav, .xls/xlsx, .csv
    - Pacotes _haven_,_readxl_ e _readr_
  - Diagnósticos iniciais do banco
    - Entendendo missings com missmap()
  - Usando skim() e glimpse()
  
  *Dplyr: Parte 1* ([RMarkdown](https://rpubs.com/reisrgabriel/dplyrPt1) ou [Script](https://github.com/GabrielReisR/R/blob/master/Estrutura%20de%20dados/Manipulando%20data.frame%20com%20Tidyverse.R))   
Operações em data.frames feitas com o pacote _dplyr_, contido no tidyverse. Vamos selecionar, renomear e excluir variáveis de um banco de dados. Além disso, criar novas colunas em data.frames e recodificar valores de um banco de dados. Faremos isso com o banco de dados DASS42, que contém 39775 casos em 172 variáveis.
  - Usando select()
    - Selecionando e excluindo variáveis
    - Renomeando colunas com starts_with()
  - Usando mutate()
    - Criando novas variáveis com mutate_at()
    - Utilizando case_when()
    
  *Dplyr: Parte 2* ([RMarkdown](https://rpubs.com/reisrgabriel/dplyrPt2) ou [Script](https://github.com/GabrielReisR/R/blob/master/Estrutura%20de%20dados/Manipulando%20data.frame%20com%20Tidyverse.R))   
Operações em data.frames feitas com o pacote _dplyr_, contido no tidyverse.
    

  
