
#-------------------------------
#
#  Disciplina:  Análise Exploratória de Dados (EDA)
#  MBA FGV - Turma Live 023ZA (FGV Online) - Aula 02
#
#  Uso para finalidade didática em aula expositiva 
#
#  Prof. Dr. José Favaretto - ver. 1.2 | outubro/2023 
#  www.favaretto.net
#
#-------------------------------
#

#-----------------------------------
#-----------------------------------
# ambiente do R como uma 'calculadora'...

# atribuição de valor a uma variável numérica
var1 <- 9
var2 <- 2

# exibir o valor (conteúdo) da variável
var1

# operação de soma de variáveis
var1+var2       # (somente exibe a soma = 11)

# ou
Var3 <- var1+var2    # (atribui a soma a variável Var3)

# exibir o valor dessa soma (armazenado na Var3)
Var3


#-----------------------------------
#-----------------------------------
# nome da variável é sensível a ‘caixa alta ou baixa’

var1 <- 7
Var2 <- 5

var1
# [1] 7

Var2
# [1] 5

Var1
# Error: object 'Var1' not found 

# Retorno de erro do sofware R está correto... a sintaxe é sensível a ‘caixa alta ou baixa’, ou seja, são variáveis diferentes!

#---------

# Ao usar o console do R (ao invés do R Studio Desktop), quando um novo gráfico é gerado, ele sobrepõe o anterior. 
# Se você quer abrir uma nova janela gráfica, digite:
windows()
X11()
x11()

#---------

# Para ver algumas demonstrações de uso do R, digite cada uma das linhas, e uso do <ENTER> para avançar:
demo(graphics)
demo(image)
demo(persp)

#  Explorar ainda mais as demonstrações que estão em outros pacotes do R
demo()
demo(package = .packages(all.available = TRUE))

#---------



#-------------------------------
#
#   INTRODUÇÃO AO SOFTWARE R (operações básicas)
#
#  #  Uso para finalidade didática em aula expositiva 
#
#  Prof. Dr. José Favaretto - ver. 1.1 | outubro/2023 
#  www.favaretto.net
#
#-------------------------------
#

#  atribuição de um vetor (COLUNA das alturas dos alunos) - dataset disponível no arquivo Favaretto_EDA_alunos.xlsx
alturas_alunos <- c(1.72, 1.65, 1.90, 1.75, 1.68, 1.57, 1.70, 1.63, 1.55, 1.71, 1.72, 1.59, 1.75, 1.68, 1.60, 1.67, 1.54, 1.76, 1.75, 1.76, 1.81, 1.63, 1.63, 1.57)

#  exibir a altura do terceiro aluno
alturas_alunos[3] 
# [1] 1.9

# função 'tamanho’ do vetor Altura (número de alunos que informaram as alturas)
length(alturas_alunos)  
# [1] 24

mean(alturas_alunos)  #  função média das Alturas (esse vetor)
# [1] 1.68 

round(mean(alturas_alunos), digits=4)  # arredondamento c/4 dígitos
# [1] 1.68


#-----------------------------------
#-----------------------------------

#  usando um OUTRO vetor 'Numbs'
Numbs <- c(0:10, 50)     # gera a sequência de números  0  1  2  3  4  5  6  7  8  9 10 50

Numbs
# [1]  0  1  2  3  4  5  6  7  8  9 10 50


# exemplos de 'outras funções' internas do R... (isoladas)
x <- altura
xs <- sum(x)  # soma de x 
xm <- mean(x) # média de x
saida <- c(xm, xs) # retorna a média e soma


# GERAR uma função no R com UM ARGUMENTO 
# para automatizar algumas etapas de cálculo
#
minhafuncao <-function(arg1){
soma <- sum(arg1)  # média de arg1
media <- mean(arg1) # soma de arg1
saida <- c(media, soma) # retorna a média e soma
print(saida, digits=4) # com quatro casas decimais
}

# sempre responderá na saída com 2 dígitos...
minhafuncao(Numbs)
# [1]   8.75 105.00


#-----------------------------------
#-----------------------------------


# GERAR uma segunda função no R com DOIS ARGUMENTOS  (adicionando o 'arredondamento' que gostaria)
# para automatizar algumas etapas de cálculo (repete uma sequência de comandos)
minhafuncao2 <-function(arg1, arg2){
soma <- sum(arg1)     # soma de arg1
media <- mean(arg1)   # média de arg1  (primeiro parâmetro)
saida <- c(media, soma)    # retorna a média e a soma de ‘arg1’
print(round(saida, digits=arg2))   # usa o número de 'casas' conforme o valor do 'arg2'
}
# todos os comandos entre { } serão executados agrupados!


# 'chama' a função e informa o vetor 'Altura'
minhafuncao2(alturas_alunos)
# [1]  2 40

# demonstrar o uso da função com dois 'argumentos' informados de forma variada
minhafuncao2(alturas_alunos, 1)
# [1]  1.7 40.3

minhafuncao2(alturas_alunos, 2)
# [1]  1.68 40.32

minhafuncao2(alturas_alunos, 3)
# [1]  1.68 40.32


# demonstrar o uso da função com os 'argumentos' informados de forma variada (não variam para finais zero)
minhafuncao2(Numbs)
minhafuncao2(Numbs,1)
minhafuncao2(Numbs,2)
minhafuncao2(Numbs,3)

# mostra os argumentos da função criada
args(minhafuncao2)


# comando 'summary' para devolver um 'resumo' dos dados
summary(alturas_alunos)

#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  1.540   1.623   1.680   1.680   1.750   1.900

summary(Numbs)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   0.00    2.75    5.50    8.75    8.25   50.00 


#-----------------------------------
#-----------------------------------

####---------- EXTRAS ----------####

#-----------------------------------
#-----------------------------------

rm() #função remove elementos / registros / tabelas ....

# Exemplo de remoção do vetor 'alturas_alunos'
alturas_alunos
# [1] 1.72 1.65 1.90 1.75 1.68 1.57 1.70 1.63 1.55 1.71 1.72 1.59 1.75 1.68
#[15] 1.60 1.67 1.54 1.76 1.75 1.76 1.81 1.63 1.63 1.57
rm(alturas_alunos)

alturas_alunos
# Erro: objeto 'altura' não encontrado

#-----------------------------------
# se precisar de ajuda para alguma função, ou comando do R...
# basta colocar ? antes do comando/função requerida
# exemplos:
?mean()
?summary()
# vai abrir uma página no navegar Web com o material de ajuda


#-----------------------------------
#  Usar pasta do Windows para os arquivos do R
#-----------------------------------

# para identificar qual a pasta (ou diretório) você está trabalhando atualmente com o R, utilize o comando getwd()...
getwd()
# [1] "C:/principal/retorna/a-pasta/que-o-R-esta-direcionado"

# após criar uma pasta específica do Windows onde ficarão armazenados os seus arquivos do R, use o comando setwd() no console de comando do R ou do menu do R Studio Desktop, para definir essa pasta de trabalho como a atual
setwd("C:/quero/esta/pasta-de-arquivos")

# para confirmar se o procedimento foi realizado corretamente, digite novamente o comando getwd()...
getwd()  
# [1] "C:/quero/esta/pasta-de-arquivos" 



#-----------------------------------
# IMPORTANTE: ao iniciar o uso do software R, ou software R Studio Desktop, defina qual será
# a pasta de trabalho (ou diretório) onde serão armazenados os arquivos de uso.
# exemplo:
#
getwd()
# [1] "C:/Users/josef/Documents"
setwd("C:/FGV_EDA")
getwd()
# [1] "C:/FGV_EDA"
# OU, defina o caminho que você quiser...
setwd("C:/Users/meu_usuario/minha_pasta_preferida") # barra no R [para caminhos] é invertida

# ao finalizar o software R (encerrar o console do R) esse comando perderá o efeito

# fique atento com o uso da "barra" no caminho do software R, pois é diferente da forma conhecida no Windows
# C:\Users\meu_usuario\minha_pasta_preferida    #no Windows

#-----------------------------------
# o software R é construido por 'pacotes'... 
# a instalação inicial do R é básica... assim, você deverá solicitar a instalação de 'pacotes' adicionais, para ampliar os seus recursos 

# para instalar um novo pacote, por exemplo, que tenha o nome "abcxyz", digite:
install.packages("abcxyz")

# instalar o pacote "dplyr" - útil para realizar transformação de dados e manipular tabelas em R
#  (selecionar, filtrar, organizar, alterar, resumir, agrupar e unir dataframes e tibbles)
#  saiba mais em:  https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-transformation.pdf
#  cheat sheets  = são conhecidas como 'folhas de cola', cartão de dicas, guia de referência, ou cartão/folha de referência
install.packages("dplyr")

# carregar o pacote
library(dplyr)

# dica útil: coloque sempre nas primeiras linhas de seu código (início do script) os pacotes que serão utilizados
# mantendo as linhas 'install.packages' e 'library' próximas umas das outras
# isso facilitará possíveis reinstalações destes pacotes quando houver necessidade

# https://www.rstudio.com/resources/cheatsheets/#translations
# https://www.rstudio.com/resources/cheatsheets/

# para instalar vários pacotes de uma só vez, use o comando
install.packages(c("dplyr", "readr", "readxl", "ggplot2"))


#-----------------------------------
# importar conjunto de dados, ou datasets... conforme seus formatos de arquivos [ou de seus separadores]
#-----------------------------------

# XLS ou XLSx - formatos do MS-Excel – necessita da instalação prévia de um pacote
# pacote:  read.xlsx()
#-----------------------------------

# instalar e carregar o pacote
install.packages("readxl")
library("readxl")

# carregar arquivo 'xls'
meus_dados <- read_excel("meu_arquivo.xls")
# carregar arquivo 'xlsx'
meus_dados <- read_excel("meu_arquivo.xlsx")

# também é possível fazer o software R [ou R Studio Desktop] escolher o caminho para carregar o arquivo...
# quando você não souber o caminho e mesmo o nome correto do arquivo
meus_dados <- read_excel(file.choose())

# escolha uma aba da sua planilha pelo próprio nome da aba - neste exemplo: "aba1"
meus_dados <- read_excel("meu_arquivo.xlsx", sheet = "aba1")
  
# escolha uma aba da sua planilha pelo sequência numérica da aba - neste exemplo: 3 (terceira aba)
meus_dados <- read_excel("meu_arquivo.xlsx", sheet = 3)

# no caso de existirem dados faltantes na planilha (células com valores 'em branco'), troque esses valores por algum valor que quiser 
# neste exemplo os valores em brancos serão preenchidos pelo "x"
meus_dados <- read_excel("meu_arquivo.xlsx", na = "x")



# XLS ou XLSx - formatos do MS-Excel – necessita da instalação prévia de um pacote
# pacote:  xlsx()
#-----------------------------------

# instalar e carregar o pacote
install.packages("xlsx")
library("xlsx")

# existem duas funções principais no pacote 'xlsx' para carregar arquivos MS-Excel (xls e xlsx)
# read.xlsx() e read.xlsx2(), esta última função diz carregar arquivos maiores, em menor tempo que a primeira
meus_dados2 <- read.xlsx(file.choose(), sheetIndex = 1)
meus_dados2 <- read.xlsx2("meu_arquivo.xlsx", sheetIndex = 2, header=TRUE)


# Arquivo disponível na Área de Trabalho - Copiar direto para o R (Windows ou MacOS)
#-----------------------------------
# 1) primeiro abra o arquivo de dados de sua planilha
# 2) escreva esse comando abaixo para ser executado no console do software R [ou do R Studio Desktop]
# 3) marque as colunas desejadas na planilha do MS-Excel (ou arquivo texto tabulado) e clique em CTRL-C
# 4) execute o comando abaixo, e verifique a inicialização da variável na janela 3.de Ambiente/Histórico [do R Studio Desktop]
# 5) ao clicar na variável "meus_dados3" nessa janela, as colunas marcadas serão exibidas na janela 1.Editor
meus_dados3 <- read.table(file = "clipboard", sep = "\t", header=TRUE)  # no Windows, com o uso de Ctrl+c
meus_dados3 <- read.table(pipe("pbpaste"), sep="\t", header = TRUE) # no MacOS, com o uso de Cmd+c


#-----------------------------------
# CSV - Comma Separated Values (.csv) - arquivo separador por vírgulas [ou, ponto e vírgulas] 
# TAB - arquivos separados por tabulações... e outros
#-----------------------------------
#
# o pacote "readr" [integrado ao pacote "tidyverse"], disponível no link: https://tidyverse.tidyverse.org, foi desenvolvido por Hadley Wickham. 
# Fornece uma solução rápida e amigável para carregar um arquivo delimitado no software R.

# instalar e carregar o pacote
install.packages("readr")
library("readr")

#  Cheat Sheet disponível em:  https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-import.pdf 

# read.csv() # dataset separado por uma vírgula ","
# read.csv2() # dataset separado por um ponto e vírgula ";" – normalmente no formato europeu ou brasileiro é esse que utilizamos 
# read_tsv() # dataset separado por tabulações
#-----------------------------------

# ou ainda, uma função GENÉRICA para ler arquivos com delimitadores específicos
# neste caso, o delimitador é o caracter pipe "|", e a primeira linha do dataset contém os nomes das colunas
my_data <- read_delim(file.choose(), sep = "|", col_names = TRUE) 

# Exemplo para ler um arquivo através da Internet, separado por tabulações
# é possível que as funções read_delim(), read_csv() e read_tsv() importem arquivos diretamente da Web
my_data <- read_tsv("http://www.endereco-da-web.com.br/arquivo.txt")
head(my_data)

# para selecionar apenas ALGUMAS COLUNAS para importar [do conjunto de dados] para o software R
my_data <- read_tsv("C:/FGV_EDA/Favaretto_EDA_tab_alunos_.txt", col_select = c(experiencia_dados, turma, altura, sapato), locale =
locale(decimal_mark = ","))

# importar o dataset completo, com o formato .CSV (padrão ";" brasileiro), para o software R
my_data2 <- read.csv2("C:/FGV_EDA/Favaretto_EDA_csv_alunos_.csv")



#-----------------------------------
#   rápida olhada em um conjunto de dados (dataset) importado como dataframe
#-----------------------------------

# Exemplo: importar o dataset completo, com o formato .XLSX (padrão MS-Excel), para o software R 
df_alunos <- read_excel("C:/FGV_EDA/Favaretto_EDA_alunos_.xlsx", sheet = 1)

# mostrar a estrutura do arquivo
str(df_alunos) 

# mostra 6 primeiros registros
head(df_alunos) 

# mostra nome das colunas (variáveis do cabeçalho) do dataset
names(df_alunos)

# mostra exemplos dos últimos registros
tail(df_alunos) 

# mostra o conjunto de dados como tabela (Software R e R Studio Desktop)
View(df_alunos)


#-----------------------------------
#   EDA rápida 
#
#   apenas uma introdução com "automatização básica"... 
#   o IMPORTANTE é partir SEMPRE partir qualquer EDA de um problema de negócio...
#   como veremos nessa aula
#-----------------------------------

# inspiração:
# https://blog.datascienceheroes.com/exploratory-data-analysis-in-r-intro/
#
install.packages("tidyverse")
install.packages("funModeling")
install.packages("Hmisc")

library(funModeling) 
library(tidyverse) 
# library(Hmisc)

# constrói uma função para EDA rápida
EDA_rapida <- function(data)
{
  glimpse(data)
  print(status(data))
  freq(data) 
  print(profiling_num(data))
  plot_num(data)
  describe(data)
}

# para selecionar apenas ALGUMAS COLUNAS para importar [do conjunto de dados] para o software R
data <- read_tsv("C:/FGV_EDA/Favaretto_EDA_tab_alunos_.txt", col_select = c(experiencia_dados, turma, altura, sapato, ultimo_titulo), locale =
locale(decimal_mark = ","))

# executa a função criada para realizar um procedimento rápido de EDA
# (essa é somente uma introdução com "automatização básica"... o IMPORTANTE é partir SEMPRE de um problema de negócio!)
EDA_rapida(data)

# quando quer escolher apenas algumas variáveis do conjunto de dados (dataset) já carregado
data1=data %>% select(altura, sapato)


#----------------------------
#   Término do script da Aula 02
#----------------------------

