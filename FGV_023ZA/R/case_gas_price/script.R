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

# Importando preço do etanol e gasolina
# Combinando arquivos csv 
# https://stackoverflow.com/questions/30242065/trying-to-merge-multiple-csv-files-in-r
# function read.csv2 - https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/read.table
gas_price <- ldply(gas_price_files, read.csv2, header=TRUE, sep=';')

# convertendo para formato data
gas_price$data_coleta <- as.Date(gas_price$Data.da.Coleta, format = "%d/%m/%Y")

# convertendo data para uma variavel categorica ordinal
gas_price$periodo_ref <- format(gas_price$data_coleta, "%Y-%m")
gas_price$Data.da.Coleta <- NULL

# Importando cotação do dolar 
dolar_brl_price <- read.csv2(paste0(str_path,"/2023_dolar_price.csv"), sep=',')

# convertendo para formato data
dolar_brl_price$data_cotacao <- as.Date(dolar_brl_price$dataHoraCotacao)

# convertendo data para uma variavel categorica ordinal
dolar_brl_price$periodo_ref <- format(dolar_brl_price$data_cotacao, "%Y-%m")
dolar_brl_price$dataHoraCotacao <- NULL

# Importando preço do barril de petroleo
brent_price <- read.csv(paste0(str_path,"/brent-crude-oil-prices-10-year-daily-chart.csv"))

# convertendo para formato data
brent_price$date <- as.Date(brent_price$date)

# convertendo data para uma variavel categorica ordinal
brent_price$periodo_ref <- format(brent_price$date, "%Y-%m")

#--------------------------
# Criando boxplot
#--------------------------

# Boxplot 1
price_gas_UF <- "SP"
price_gas_produto <- "GASOLINA"

# Boxplot 2
price_gas_cidade <- "SAO PAULO"
price_gas_dataref <- "2023-01"

# imprimir boxplot 
boxplot(gas_price$Valor.de.Venda ~ gas_price$periodo_ref, las=1, col="yellow", subset = (gas_price$Estado...Sigla == price_gas_UF & gas_price$Produto == price_gas_produto),  ylab = paste("Preço Venda", price_gas_produto,  "R$"), xlab = "Periodo", boxwex=0.2, main = paste("Variação preço de venda", price_gas_produto, "em", price_gas_UF ), ylim=c(4,9))

unique_price_gas_periodoref <- unique(gas_price$periodo_ref)

# calculando os quartis  
med <- tapply(gas_price$Valor.de.Venda, gas_price$periodo_ref, median, na.rm = TRUE)
min <- tapply(gas_price$Valor.de.Venda, gas_price$periodo_ref, min, na.rm = TRUE)
max <- tapply(gas_price$Valor.de.Venda, gas_price$periodo_ref, max, na.rm = TRUE)

len_price_gas_dataref <- length(med)

for(i in 1:length(med)) {
  text(x = ( (i - 1) + 0.7), y = ( round(med[i],0) + 0.4), labels = paste("Max:", round(max[i], 2)), pos = 1, cex = 0.6, col = "red")
  text(x = ( (i - 1) + 0.7), y = ( round(med[i],0) + 0.2), labels = paste("Med:", round(med[i], 2)), pos = 1, cex = 0.6, col = "black")
  text(x = ( (i - 1) + 0.7), y = ( round(med[i],0) + 0), labels = paste("Min:", round(min[i], 2)), pos = 1, cex = 0.6, col = "blue")
}

boxplot(dolar_brl_price$cotacaoCompra ~ dolar_brl_price$periodo_ref, subset = ( dolar_brl_price$periodo_ref %in% unique_price_gas_periodoref), las=1, col="orange", boxwex = 0.2,  at = 1:len_price_gas_dataref +0.3, axes = FALSE, ann = FALSE, add = T, ylim=c(4,9))

# calculando os quartis  
min <- tapply(dolar_brl_price$cotacaoCompra, dolar_brl_price$periodo_ref, min, na.rm = TRUE)
max <- tapply(dolar_brl_price$cotacaoCompra, dolar_brl_price$periodo_ref, max, na.rm = TRUE)

i <- 1

for(i in 1:length(unique_price_gas_periodoref)) {
  text(x = (i + 0.3), y = round(max[i],2), labels = round(max[i], 2), pos = 3, cex = 0.6, col = "red")
  text(x = (i + 0.3), y = round(min[i],2), labels = round(min[i], 2), pos = 1, cex = 0.6, col = "blue")
}

par(new = TRUE)
boxplot(brent_price$value ~ brent_price$periodo_ref, subset = ( brent_price$periodo_ref %in% unique_price_gas_periodoref), las=1, col="brown", boxwex = 0.2,  ylim=c(30,120),  axes = FALSE, ann = FALSE, at = 1:len_price_gas_dataref +1.6)

axis(side = 4, at = pretty(range(c(30, 129))), las = 1)

# calculando os quartis  
med <- tapply(brent_price$value, brent_price$periodo_ref, median, na.rm = TRUE)
min <- tapply(brent_price$value, brent_price$periodo_ref, min, na.rm = TRUE)
max <- tapply(brent_price$value, brent_price$periodo_ref, max, na.rm = TRUE)

i <- 0

for(i in 1:length(unique_price_gas_periodoref)) {
  text(x = ( (i - 1) + 0.1), y = ( round(min[i],0) - 20 + 10), labels = paste("Max:", round(max[i], 2)), pos = 1, cex = 0.6, col = "red")
  text(x = ( (i - 1) + 0.1), y = ( round(min[i],0) - 20 + 5), labels = paste("Med:", round(med[i], 2)), pos = 1, cex = 0.6, col = "black")
  text(x = ( (i - 1) + 0.1), y = ( round(min[i],0) - 20), labels = paste("Min:", round(min[i], 2)), pos = 1, cex = 0.6, col = "blue")
}

# boxplot(gas_price$Valor.de.Venda ~ gas_price$Bairro, las=1, col="yellow", subset = (gas_price$Estado...Sigla == price_gas_UF & gas_price$periodo_ref == price_gas_dataref & gas_price$Municipio == price_gas_cidade & gas_price$Produto == price_gas_produto),  ylab = paste("Preço Venda", price_gas_produto,  "R$"), xlab = "Bairro", boxwex=0.2, main = paste("Variação preço de venda por Bairro", price_gas_produto, "em", price_gas_cidade, "/", price_gas_UF ))

