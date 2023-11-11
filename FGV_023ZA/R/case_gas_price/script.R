#-------------------------------
#
#  Disciplina:  Análise Exploratória de Dados (EDA)
#  MBA FGV - Turma Live 023ZA (FGV Online) - Trabalho AV
#
#  MIT License
#
#  Paulo Corcino - ver. 1.0 | novembro/2023 | R version 4.3.2
#  paulo@corcino.com.br
#
#-------------------------
# Variaveis globais
# ------------------------

# Limpar tudo
rm(list=ls()) 

library(plyr)

# Path base de dados
# Objetivo é importar todos os arquivos CSV e consolidar
# paste concatena R reference pg 10. 
str_path <- paste0(getwd(),"/base")

# obtem todos os arquivos contendo os precos
gas_price_files <- list.files(str_path, pattern='^precos.*\\.csv', full.names = TRUE) 

# Combinando arquivos csv 
# https://stackoverflow.com/questions/30242065/trying-to-merge-multiple-csv-files-in-r
# function read.csv2 - https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/read.table
gas_price <- ldply(gas_price_files, read.csv2, header=TRUE, sep=';')
gas_price$data_coleta <- as.Date(gas_price$Data.da.Coleta, format = "%d/%m/%Y")
gas_price$periodo_ref <- format(gas_price$data_coleta, "%Y-%m")
gas_price$Data.da.Coleta <- NULL

dolar_brl_price <- read.csv2(paste0(str_path,"/2023_dolar_price.csv"), sep=',')
dolar_brl_price$data_cotacao <- as.Date(dolar_brl_price$dataHoraCotacao)
dolar_brl_price$periodo_ref <- format(dolar_brl_price$data_cotacao, "%Y-%m")
dolar_brl_price$dataHoraCotacao <- NULL


brent_price <- read.csv(paste0(str_path,"/brent-crude-oil-prices-10-year-daily-chart.csv"))
brent_price$date <- as.Date(brent_price$date)
brent_price$periodo_ref <- format(brent_price$date, "%Y-%m")

#--------------------------
# Importando os conjuntos de dados
#--------------------------
