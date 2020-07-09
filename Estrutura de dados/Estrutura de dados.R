# install.packages("gapminder", dependencies = TRUE)
# library(gapminder)
# install.packages("janitor", dependencies = TRUE)
# install.packages("tidyverse", dependencies = TRUE)
# install.packages("haven", dependencies = TRUE)
# install.packages("readxl", dependencies = TRUE)
# install.packages("skimr", dependencies = TRUE)
# install.packages("psych", dependencies = TRUE)

# library(psych)
# library(gapminder)
# Lendo bancos de dados
## csv
### file.choose()
## spss
## excel


# banco de dados
# names(biblio)
## biblio($)
# janitor(biblio)
# str(biblio)

# describe(biblio$Total Users)
biblio <- read.csv(file.choose(), sep = ",")
library(readxl)
biblio <- read_excel(file.choose())
biblio
names(biblio)

summary

# dplyr

# arrange
# filter
# rename
# mutate
## transmute
