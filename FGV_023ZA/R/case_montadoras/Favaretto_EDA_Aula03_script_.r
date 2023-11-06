
#-------------------------------
#
#  Disciplina:  Análise Exploratória de Dados (EDA)
#  MBA FGV - Turma Live 023ZA (FGV Online) - Aula 03
#
#  Uso para finalidade didática em aula expositiva 
#
#  Prof. Dr. José Favaretto - ver. 1.3 | outubro/2023 
#  www.favaretto.net
#
#-------------------------------
#

#--------------------------
# Prática 1:  Adequação do Cabeçalho do Dataset 
#--------------------------  
#  Objetivo: corrigir eventuais caracteres impróprios (limpeza) na geração de Datasets adequados para a EDA
#--------------------------

# pacote "janitor" | para limpeza e exploração de dados 
install.packages("janitor")
library(janitor)

# Possui funções para examinar e adequar dados incorretos no dataset
# Exemplo de uso: criar um data.frame com nomes de colunas (variáveis) contendo caracteres incorretos (sem seguir o padrão adequado)
teste_df <- as.data.frame(matrix(ncol = 6))
names(teste_df) <- c("primeiroNome", "ábc@K!*", "% atenção (2009)",
                    "VALOR REPETIDO", "Valor Repetido", "")
# mostrar os nomes das colunas (variáveis) criadas
names(teste_df)
# [1] "primeiroNome"     "ábc@K!*"          "% atenção (2009)" "VALOR REPETIDO"   "Valor Repetido"   ""                

teste_df
#  primeiroNome ábc@K!* % atenção (2009) VALOR REPETIDO Valor Repetido   
#           NA      NA               NA             NA             NA NA

# adequar AUTOMATICAMENTE os nomes destes variáveis [do cabeçalho] do dataset 
# (limpar e excluir os carcteres inválidos, e mostrar o resultado)
teste_df %>%
  clean_names()
# primeiro_nome abc_k percent_atencao_2009 valor_repetido valor_repetido_2  x

names(teste_df)


#--------------------------
# Prática 2:  Tidy Data (princípio basico) - dataset do modo wide ou long
#--------------------------  
#  Objetivo: reorganizar os formatos de dados de wide para long, ou vice-versa, na geração de Datasets adequados para a EDA
#--------------------------

#------------------------
# instalar e carregar o pacote "tidyverse" 
#------------------------
###  instala, com um único comando, os pacotes:
###  ggplot2, para visualização de dados
###  dplyr, para manipulação de dados
###  tidyr, para organização de dados
###  readr, para importação de dados
###  dentre outros...
#------------------------
install.packages("tidyverse")
library(tidyverse)


# Dataframes gerados diretamente "colando" os valores das colunas e dos dados de cada linha separado por um espaço
# (para uso desse modo, não deixar espaços nos valores das células)

# Dataset tipo WIDE
df_wide <- read.table(header=TRUE, text='
country year cases pop
A 1999 0.7K 19M
A 2000 2K 20M
B 1999 37K 172M
B 2000 80K 174M
C 1999 212K 1T
C 2000 213K 1T
')

# EXEMPLO 1: para converter o dataframe 'df_wide' do formato wide para long
# parâmetros: 'names_to' (cabeçalho) para "type", e 'values_to' (valores) para "count"
wide2long <- pivot_longer(df_wide, cols = 3:4, names_to ="type", values_to = "count")

# cols = Columns to pivot into longer format. Exemplo: var1:var10 = variables lying between var1 on the left and var10 on the right.
# para ajuda, use o comando:  ?pivot_longer

# consultar o dataframe convertido (de wide para long)
wide2long

# Dataset tipo LONG
df_long <- read.table(header=TRUE, text='
country year type count
A 1999 cases 0.7K
A 1999 pop 19M
A 2000 cases 2K
A 2000 pop 20M
B 1999 cases 37K
B 1999 pop 172M
B 2000 cases 80K
B 2000 pop 174M
C 1999 cases 212K
C 1999 pop 1T
C 2000 cases 213K
C 2000 pop 1T
')

# EXEMPLO 2: para converter o dataframe 'df_long' do formato long para wide
# parâmetros: 'names_from' (cabeçalho) vem de "type", e 'values_from' (valores) vem de "count"
long2wide <- pivot_wider(df_long, names_from ="type", values_from = "count")

# consultar o dataframe convertido (de long para wide)
long2wide

#--------------------------


# instalar o pacote "dplyr" - útil para realizar transformação de dados e manipular tabelas em R
#  (selecionar, filtrar, organizar, alterar, resumir, agrupar e unir dataframes e tibbles)
#  saiba mais em:  https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-transformation.pdf
#  cheat sheets  = são conhecidas como 'folhas de cola', cartão de dicas, guia de referência, ou cartão/folha de referência
install.packages("dplyr")

# carregar o pacote
library(dplyr)


# para instalar vários pacotes de uma só vez, use o comando
install.packages(c("dplyr", "readr", "readxl", "ggplot2"))


# o pacote "readr" [integrado ao pacote "tidyverse"], disponível no link: https://tidyverse.tidyverse.org, foi desenvolvido por Hadley Wickham. 
# Fornece uma solução rápida e amigável para carregar um arquivo delimitado no software R.

#--------------------------



#----------------------------
#  Explicações sobre o Mini Casos de EDA para a identificação do Problema de Negócio, 
#  e a Pergunta [de Negócio] que se quer responder ...
#----------------------------
#
#  verificar conteúdos dos materiais da Aula
#
#----------------------------


#------------------------
#  EDA Ckeck List (passo a passo de Análise Exploratória de Dados)
#------------------------
#  Objetivo: amplo entendimento sobre os dados, para responder ao problema de negócio elencado
#
#
# Passo 1 - Entendimento geral sobre a estrutura e os dados do dataset (exploração inicial)
#           Tidy Data = Limpeza e Organização dos dados (adequações das colunas do Dataset) - ver slides da Aula
#           Gravação de cópia de segurança (backup) com essas etapas já vencidas
#
# Passo 2 - Análise Univariada
#           Analisar variáveis categóricas
#           Analisar variáveis numéricas
#
# Passo 3 - Análise Bivariada
#           Analisar variáveis numéricas e categórias (combinadas)
#------------------------

# instalar e carregar o pacote "readxl" (leitura de planilhas do MS-Excel)
install.packages("readxl")
library("readxl")

# escolha uma aba da planilha Montadoras, pela sequência numérica da aba - neste exemplo: 1 (primeira aba)
# se existir 'missing data' (ou, dados faltantes), preencha com o valor numérico "0"
# montadoras_licenciamentos <- read_excel("C:/FGV_EDA/Favaretto_EDA_montadoras-BR_.xlsx", sheet = 1, na = "0")
montadoras_licenciamentos <- read_excel("C:/FGV_EDA/Favaretto_EDA_montadoras-BR_.xlsx", sheet = 1)
montadoras_licenciamentos <- read_excel("Favaretto_EDA_montadoras-BR_.xlsx", sheet = 1)

# alternativa (aba 2) - com procedimentos semelhantes, substituindo o nome 'montadoras_licenciamentos' por 'montadoras_combustivel'
# ao carregar a outra aba da planilha (aba 2), tipo de combustível, ignore a substituição dos dados faltantes (manter sem alteração) 
montadoras_combustivel <- read_excel("C:/FGV_EDA/Favaretto_EDA_montadoras-BR_.xlsx", sheet = 2)
montadoras_combustivel <- read_excel("Favaretto_EDA_montadoras-BR_.xlsx", sheet = 2)


#===================# Passo 1 #====================

###################################################
###                                             ###
###  ENTENDIMENTO GERAL E EXPLORAÇÃO INICIAL    ###
###                                             ###
###################################################

# => Tamanho do dataset (size):
# dim(data): rows and columns
# nrow(data): number of rows
# ncol(data): number of columns
dim(montadoras_licenciamentos)
# [1] 84 39
nrow(montadoras_licenciamentos)
# [1] 84
ncol(montadoras_licenciamentos)
# [1] 39

# => Conteúdo (carregado) do dataset
# mostra 6 primeiros registros [de todas as colunas]
head(montadoras_licenciamentos)

# mostra 6 primeiros registros [apenas das 3 primeiras colunas]
head(montadoras_licenciamentos[, 1:3])


# mostra exemplos dos últimos registros
tail(montadoras_licenciamentos) 
# mostra o conjunto de dados como tabela (Software R - abre uma janela; e R Studio Desktop - mostra na janela de código) 
View(montadoras_licenciamentos)


#-------------------------
# janitor: Simple Tools for Examining and Cleaning Dirty Data
#-------------------------
# https://cran.r-project.org/web/packages/janitor/index.html
#
# The main janitor functions can: perfectly format data.frame column names; provide quick counts of variable combinations (i.e., frequency tables and crosstabs); and isolate duplicate records. Other janitor functions nicely format the tabulation results. These tabulate-and-report functions approximate popular features of SPSS and Microsoft Excel. This package follows the principles of the "tidyverse" and works well with the pipe function %>%. janitor was built with beginning-to-intermediate R users in mind and is optimized for user-friendliness. Advanced R users can already do everything covered here, but with janitor they can do it faster and save their thinking for the fun stuff.

# https://docs.exploratory.io/data-wrangling/clean_names
# https://exploratory.io/note/kanaugust/2617200410576325




# => Diagnosticar se todas os NOMES das variáveis (colunas e linhas) foram carregados corretamente
# exibe nome de todas as colunas (variáveis do cabeçalho) do dataset
names(montadoras_licenciamentos)
colnames(montadoras_licenciamentos)

# [1] "tipo_veiculo"   "nome_montadora" "marca"          "jan_22"         "fev_22"        
# [6] "mar_22"         "abr_22"         "mai_22"         "jun_22"         "jul_22"        
#[11] "ago_22"         "set_22"         "out_22"         "nov_22"         "dez_22"        
#[16] "jan_21"         "fev_21"         "mar_21"         "abr_21"         "mai_21"        
#[21] "jun_21"         "jul_21"         "ago_21"         "set_21"         "out_21"        
#[26] "nov_21"         "dez_21"         "jan_20"         "fev_20"         "mar_20"        
#[31] "abr_20"         "mai_20"         "jun_20"         "jul_20"         "ago_20"        
#[36] "set_20"         "out_20"         "nov_20"         "dez_20"  

# exibe nome de todas as linhas do dataset (na ausência de um nome em cada linha, são exibidos números)
rownames(montadoras_licenciamentos)

#[1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24"
#[25] "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48"
#[49] "49" "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61" "62" "63" "64" "65" "66" "67" "68" "69" "70" "71" "72"
#[73] "73" "74" "75" "76" "77" "78" "79" "80" "81" "82" "83" "84"

# sumariza apenas uma variável escolhaida no dataset
summary(montadoras_licenciamentos$tipo_veiculo)
# Length     Class      Mode 
#       84 character character 

# verificar se existem Missing Data (dados faltantes)
sum(is.na(montadoras_licenciamentos))
# [1] 336



# quando quer escolher apenas algumas variáveis do conjunto de dados (dataset) já carregado
# data1=data %>% select(altura, sapato)


#------------------------
# instalar e carregar o pacote "funModeling" (auxilia na rápida exploração e visualização dos dados)
#  https://cran.r-project.org/web/packages/funModeling/funModeling.pdf
#------------------------
install.packages("funModeling")
library(funModeling) 

# df_status - função do pacote "funModeling" (obter um sumário das variáveis do data frame)
# => Diagnosticar a existência de valores nulos ou NA, o tipo do dado e quantidade de valores único. 
df_status(montadoras_licenciamentos)

# Para cada variável retorna: Quantidade e porcentagem de zeros (q_zeros e p_zeros respectivamente).
# Mesmas métricas para valores NA (q_NA/p_na) e valores infinitos (q_inf/p_inf). 
# Duas últimas colunas indicam o tipo de dados, e a quantidade de valores exclusivos. 

#         variable q_zeros p_zeros q_na   p_na q_inf p_inf      type unique
#1    tipo_veiculo       0       0    0   0.00     0     0 character      8
#2  nome_montadora       0       0    0   0.00     0     0 character     23
#3           marca       0       0    0   0.00     0     0 character     33
#4          jan_22       0       0    7   8.33     0     0   numeric     69
#5          fev_22       0       0    8   9.52     0     0   numeric     67
#6          mar_22       0       0    9  10.71     0     0   numeric     70
#7          abr_22       0       0    7   8.33     0     0   numeric     71
#8          mai_22       0       0   10  11.90     0     0   numeric     69
#9          jun_22       0       0    8   9.52     0     0   numeric     69
#10         jul_22       0       0    6   7.14     0     0   numeric     72
#11         ago_22       0       0    5   5.95     0     0   numeric     72
#12         set_22       0       0   84 100.00     0     0   logical      0
#13         out_22       0       0   84 100.00     0     0   logical      0
#14         nov_22       0       0   84 100.00     0     0   logical      0
#15         dez_22       0       0   84 100.00     0     0   logical      0
#16         jan_21       0       0   11  13.10     0     0   numeric     68
#17         fev_21       0       0    9  10.71     0     0   numeric     66
#18         mar_21       0       0   10  11.90     0     0   numeric     71
#19         abr_21       0       0    9  10.71     0     0   numeric     69
#20         mai_21       0       0    8   9.52     0     0   numeric     75
#21         jun_21       0       0    8   9.52     0     0   numeric     71
#22         jul_21       0       0    8   9.52     0     0   numeric     72
#23         ago_21       0       0    5   5.95     0     0   numeric     69

#--------------------------
# legenda das mensurações acima
#--------------------------
# q_zeros: quantidade de zeros (p_zeros: em percentual)
# q_inf: quantidade de valores infinitos (p_inf: em percentual)
# q_na: quanridade de NA (p_na: em percentual) = Missing Data ou Not Available (NA)
# type: character, logic, numeric
# unique: quantidade de valores únicos
#

#  outro modo similiar (considera 1, ao invés vez de 100%, no cálculo das proporções que são subtotalizadas)
print(status(montadoras_licenciamentos))


#--------------------------
#  freq - função do pacote "funModeling" | gera a tabela de frequência e o gráfico para variáveis categóricas
#  http://127.0.0.1:22656/library/funModeling/html/freq.html
#--------------------------
freq(montadoras_licenciamentos) # para todas as categóricas do dataset

freq(data=montadoras_licenciamentos$nome_montadora) # apenas para a variável categórica 'nome_montadora'

freq(montadoras_licenciamentos, input = c('tipo_veiculo','marca')) # apenas para algumas variáveis categóricas selecionadas deste dataset

### para a variável 'tipo_veiculo' gerou a tabela abaixo (além do gráfico)
#           tipo_veiculo frequency percentage cumulative_perc
#1            Automóveis        26      30.95           30.95
#2      Comerciais leves        16      19.05           50.00
#3     Caminhões Pesados         8       9.52           59.52
#4   Caminhões Semileves         8       9.52           69.04
#5 Caminhões Semipesados         8       9.52           78.56
#6       Caminhões Leves         6       7.14           85.70
#7      Caminhões Médios         6       7.14           92.84
#8       Ônibus (chassi)         6       7.14          100.00
#

### para a variável 'tipo_veiculo' gerou a tabela abaixo (além do gráfico)
#                   marca frequency percentage cumulative_perc
#1          Mercedes-Benz         8       9.52            9.52
#2                   Ford         7       8.33           17.85
#3                  Iveco         7       8.33           26.18
#4                    MAN         7       8.33           34.51
#5                 Agrale         5       5.95           40.46
#6                Citroën         3       3.57           44.03
#7                    DAF         3       3.57           47.60
#8                  Dodge         3       3.57           51.17
#9                Peugeot         3       3.57           54.74
#10                Scania         3       3.57           58.31
#11                 Volvo         3       3.57           61.88
# [...]  continua

#--------------------------
#  plot_num - função do pacote "funModeling" | Plotting numerical data
#  Retrieves one plot containing all the histograms for numerical variables. NA values will not be displayed.
#  http://127.0.0.1:22656/library/funModeling/html/plot_num.html
#--------------------------

plot_num(montadoras_licenciamentos)  # Gera um gráfico (distribuição / histograma) para todas as variáveis numéricas 

# changing the bins parameter and exporting the plot
# plot_num(data=mtcars, bins=5, path_out="my_folder")


print(profiling_num(montadoras_licenciamentos))  #  Profiling numerical data
# http://127.0.0.1:22656/library/funModeling/html/profiling_num.html


# Get a metric table with many indicators for all numerical variables, automatically skipping the non-numerical variables.
# Current metrics are: mean, std_dev: standard deviation, all the p_XX: percentile at XX number, skewness, kurtosis, 
# iqr: inter quartile range, variation_coef: the ratio of sd/mean, range_98 is the limit for which the 98
plot_num(data)  # Gera um gráfico (distribuição) para variáveis numéricas 

#--------------------------
# Concise Statistical Description of a Vector, Matrix, Data Frame, or Formula
# pacote "Hmisc"
#  http://127.0.0.1:22656/library/Hmisc/html/describe.html
#--------------------------

# install.packages("Hmisc")  # é carregado com o "tidyverse"
# library(Hmisc)
#
describe(montadoras_licenciamentos)



#------------------------
#  instalar e carregar o pacote "skimr" (amplia os recursos do comando summary() fornecendo rapidamente outras estatísticas já integradas)
#  https://github.com/ropensci/skimr
#------------------------
install.packages("skimr")
library(skimr) 

# executa o 'sumário' via pacote "skimr"
skim(montadoras_licenciamentos)




#------------------------
# instalar e carregar o pacote "tidyverse" 
#------------------------
###  instala, com um único comando, os pacotes:
###  ggplot2, para visualização de dados
###  dplyr, para manipulação de dados
###  tidyr, para organização de dados
###  readr, para importação de dados
###  dentre outros...
#------------------------
install.packages("tidyverse")
library(tidyverse)

# glimpse - função do pacote "tidyverse"
glimpse(montadoras_licenciamentos)

#Columns: 39
#$ tipo_veiculo   <chr> "Automóveis", "Automóveis", "Automóveis", "Automóveis", "Automóveis", "Automóve…
#$ nome_montadora <chr> "Audi", "BMW", "BMW", "Caoa - Hyundai", "Caoa - Hyundai", "Caoa - Hyundai", "FC…
#$ marca          <chr> "Audi", "BMW", "Mini", "Caoa Chery", "Hyundai", "Subaru", "Chrysler", "Dodge", …
#$ jan_22         <dbl> 470, 656, 84, 3131, 269, 76, 2, 4, 11484, 11352, 256, 12363, 4728, 403, 99, 122…
#$ fev_22         <dbl> 293, 876, 76, 3302, 866, 2, NA, 5, 14193, 8594, 200, 15622, 4096, 657, 135, 125…
#$ mar_22         <dbl> 278, 1234, 82, 3171, 630, 62, 1, 5, 14605, 10351, 258, 16638, 4693, 636, 156, 1…
#$ abr_22         <dbl> 214, 1108, 52, 3259, 68, 53, 4, 6, 20203, 10829, 244, 18492, 4176, 601, 149, 13…
#$ mai_22         <dbl> 381, 1293, 81, 3045, 185, NA, NA, 5, 19713, 12825, 256, 22640, 4244, 893, 112, …
#$ jun_22         <dbl> 308, 1568, 51, 2914, 255, 1, 1, 4, 18601, 11653, 368, 16146, 4016, 586, 96, 163…
#$ jul_22         <dbl> 445, 1269, 54, 2115, 45, 59, 1, 4, 18681, 10161, 292, 25706, 3975, 439, 86, 142…
#$ ago_22         <dbl> 565, 1380, 60, 3148, 55, 64, 3, 10, 23299, 12291, 285, 28441, 4081, 462, 75, 17…
#$ set_22         <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#$ out_22         <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#$ nov_22         <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#$ dez_22         <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#$ jan_21         <dbl> 457, 796, 107, 2292, 548, 28, 1, NA, 14513, 12126, 6202, 23972, 6386, 603, 163,…
#$ fev_21         <dbl> 652, 845, 77, 1649, 597, 141, 1, 1, 16289, 10469, 2438, 23068, 7314, 626, 153, …
#$ mar_21         <dbl> 420, 1142, 66, 2453, 534, 1, NA, 4, 18896, 11401, 1920, 21499, 7113, 638, 143, …
#$ abr_21         <dbl> 407, 1111, 57, 2560, 405, NA, 1, 2, 15667, 12147, 1547, 18420, 5828, 665, 137, …
# ...

###################################################
###                                             ###
###  FAZER A ADEQUAÇÃO DAS COLUNAS DO DATASET   ###
###                                             ###
###################################################

#------------------------
# uso do pacote "tidyr" (arrumador / organizador), incluído no pacote "tidyverse"
# para ajudar na criação de datasets com dados organizados 
#------------------------
# 1. cada coluna é nomeada como uma variável;
# 2. cada linha contém uma observação [da amostra de dados];
# 3. cada célula possui um valor (individualizado) da linha de observação.
#------------------------
# install.packages("tidyr")
# library(tidyr) # já consta no pacote "tidyverse"
#
# consultar:  https://github.com/rstudio/cheatsheets/blob/master/tidyr.pdf
#             https://tidyr.tidyverse.org/
#
# informa o nome das duas novas colunas 'mes_ano' e 'qtd_licenciada' para a transformação do formato do dataset
# de "wide" (84 linhas x 39 colunas) para Dataset formato "long" (3024 linhas x 5 colunas)
#  saiba mais em:  https://tidyr.tidyverse.org/reference/pivot_longer.html
#
# Dataset alterado para formato "long" (3024 linhas x 5 colunas)
montadoras_licenc2 <- pivot_longer(montadoras_licenciamentos, cols = 4:39, names_to ="mes_ano", values_to = "qtd_licenciada")

# na necessidade de realizar a conversão inversa (de "long" para "wide")...
#  saiba mais em: https://tidyr.tidyverse.org/reference/pivot_wider.html
#
# Dataset retornado ao formato "wide" (84 linhas x 39 colunas)
# montadoras_licenc3 <- pivot_wider(montadoras_licenc2, names_from = "mes_ano", values_from = "qtd_licenciada")

# OPÇÃO1: usando comandos da "Base R" | duplicar o valor de uma coluna no dataset (incluir um novo nome de coluna, 
# utilizando o nome de coluna de interesse para duplicar)
#--------------
montadoras_licenc2$mes_ano1 <- montadoras_licenc2$mes_ano    # duplica o conteúdo dessa coluna (todos seus valores) 
#  OU com o uso da função cbind()
#--------------
montadoras_licenc2 <- cbind(montadoras_licenc2, mes_ano2 = montadoras_licenc2$mes_ano) # duplica o conteúdo dessa coluna (todos seus valores) 

# OPÇÃO2: usando o pacote "dplyr", incluído no pacote "tidyverse"
# install.packages("dplyr") 
# library(dplyr) # já consta no pacote "tidyverse"
#--------------
montadoras_licenc2 <- montadoras_licenc2 %>% mutate(mes_ano3 = mes_ano) # duplica o conteúdo dessa coluna (todos seus valores) 

# separa valores de uma coluna em outras duas colunas, exemplo:  "mes_ano1" com jan_22 => em "mes", "ano" contendo jan , 22
# função do pacote "tidyr"
# saiba mais em: https://tidyr.tidyverse.org/reference/separate.html ou https://tidyr.tidyverse.org/reference/unite.html
#--------------
montadoras_licenc2 <- separate(montadoras_licenc2, "mes_ano1", sep = "_", into = c("mes", "ano"))

# OPÇÃO1: usando comandos da "Base R"  | remover colunas do dataset
# informar um vetor com os nomes das colunas (sem aspas!)
#--------------
montadoras_licenc2 <- subset(montadoras_licenc2, select = -c(mes_ano2, mes_ano3))

# OPÇÃO2: usando o pacote "dplyr", incluído no pacote "tidyverse"
# install.packages("dplyr") 
# library(dplyr) # já consta no pacote "tidyverse"
#--------------
montadoras_licenc2 <- montadoras_licenc2 %>% select(-c(mes_ano2, mes_ano3))

### outras variações de uso de REMOÇÃO DE COLUNAS com alguns critérios
#  onde 'my_df' é a variável do dataframe já carregado na memória
#--------------
#--------------  EXEMPLOS possíveis de utilização
#--------------
#  remove colunas que começam com "jan"
my_df %>% select(-starts_with("jan"))
#  remove colunas que terminam com "22"
my_df %>% select(-ends_with("22"))
#  remove colunas que contém a string "ev"
my_df %>% select(-contains("ev"))


### OPÇÃO1:  renomear os nomes das variáveis de TODAS as colunas, repetindo os nomes que serão mantidos sem alteração
#--------------
colnames(my_df) <- c("a_novo", "b_novo", "c", "d", "e")

### OPÇÃO2:  usando o pacote "dplyr", incluído no pacote "tidyverse"
#--------------
#--------------  EXEMPLOS possíveis de utilização
#--------------
old_names <- c("a", "b")
new_names <- c("a_novo", "b_novo")
#  usando a função rename_at() 
my_df %>% rename_at(vars(old_names), ~new_names)
#  OU usando a função setnames()
my_df %>% setnames(old_names, new_names)

# If you want to evaluate an expression in the context, of a data frame, you can use with and within.
#
aa$z <- with(aa, x + y - 2)
# or
aa <- within(aa, z <- x + y - 2)
#
# Or, if your expression is in the form of a text string (you should see if there are other ways to write your code; evaluating arbitrary text strings can lead to lots of problems):
aa$z <- eval(parse(text="x + y - 2"), aa)


### gerar algum cálculo nas colunas já existentes, ou criar alguma nova derivada de uma existente
# library(dplyr)
my_df %>% mutate(ano_new = lag(stock + cumsum(purchase - sales)))
# https://stackoverflow.com/questions/63278534/calculating-new-column-in-a-data-frame-based-on-existing-columns
my_df <- my_df %>% mutate(z = x+y-2) # gera o cálculo diretamente
#--------------
#--------------
#--------------

# converter uma variável "char" para "numeric" no dataset
montadoras_licenc2$ano <- as.numeric(as.character(montadoras_licenc2$ano))  # 'char' para 'numeric'
# adiciona a variável 'ano' o formato de 4 dígitos a partir da variável já existente com 2 dígitos
montadoras_licenc2 <- montadoras_licenc2 %>% mutate(ano = 2000 + ano)

# converter uma variável "char" para "fator" no dataset
montadoras_licenc2$tipo_veiculo <- as.factor(as.character(montadoras_licenc2$tipo_veiculo))  # 'char' para 'factor'
montadoras_licenc2$mes <- as.factor(as.character(montadoras_licenc2$mes))  # 'char' para 'factor'


# verifica a conversão efetivada
str(montadoras_licenc2)

#'data.frame':	3024 obs. of  7 variables:
# $ tipo_veiculo  : Factor w/ 8 levels "Automóveis","Caminhões Leves",..: 1 1 1 1 1 1 1 1 1 1 ...
# $ nome_montadora: chr  "Audi" "Audi" "Audi" "Audi" ...
# $ marca         : chr  "Audi" "Audi" "Audi" "Audi" ...
# $ mes_ano       : chr  "jan_22" "fev_22" "mar_22" "abr_22" ...
# $ qtd_licenciada: num  470 293 278 214 381 308 445 565 NA NA ...
# $ mes           : Factor w/ 12 levels "abr","ago","dez",..: 5 4 9 1 8 7 6 2 12 11 ...
# $ ano           : num  2022 2022 2022 2022 2022 ...
#
 

#-----------------------
# constrói uma função para descrever rapidamente a 
# estrutura do dataset (conjunto de dados) que foi modificada
#------------------------
desc_dataset <- function(data)
{
  print("---- Dimensões do Dataset ----")
  print(dim(data))
  print("---- Início do Dataset ----")
  print(head(data[, 1:5]))
  print("")
  print("---- Final do Dataset ----")
  print(tail(data))
  print("")
  print("---- Nomes das Colunas do Dataset ----")
  print(colnames(data))
  print("")
  print("---- Estruturação do Dataset ----")
  summary(data)
}

# executa a função criada 'desc_dataset()'
desc_dataset(montadoras_licenc2)
desc_dataset(montadoras_licenc3)

#------------------------
#
#[1] "---- Dimensões do Dataset ----"
#[1] 3024    5
#[1] "---- Início do Dataset ----"
# A tibble: 6 × 5
#  tipo_veiculo nome_montadora marca mes_ano qtd_licenciada
#  <chr>        <chr>          <chr> <chr>            <dbl>
#1 Automóveis   Audi           Audi  jan_22             470
#2 Automóveis   Audi           Audi  fev_22             293
#3 Automóveis   Audi           Audi  mar_22             278
#4 Automóveis   Audi           Audi  abr_22             214
#5 Automóveis   Audi           Audi  mai_22             381
#6 Automóveis   Audi           Audi  jun_22             308
#[1] ""
#[1] "---- Final do Dataset ----"
# A tibble: 6 × 5
#  tipo_veiculo    nome_montadora marca mes_ano qtd_licenciada
#  <chr>           <chr>          <chr> <chr>            <dbl>
#1 Ônibus (chassi) Volvo          Volvo jul_20              50
#2 Ônibus (chassi) Volvo          Volvo ago_20              37
#3 Ônibus (chassi) Volvo          Volvo set_20              37
#4 Ônibus (chassi) Volvo          Volvo out_20              38
#5 Ônibus (chassi) Volvo          Volvo nov_20              12
#6 Ônibus (chassi) Volvo          Volvo dez_20              52
#[1] ""
#[1] "---- Nomes das Colunas do Dataset ----"
#[1] "tipo_veiculo"   "nome_montadora" "marca"          "mes_ano"        "qtd_licenciada"
#[1] ""
#[1] "---- Estruturação do Dataset ----"
# tipo_veiculo       nome_montadora        marca             mes_ano          qtd_licenciada    
# Length:3024        Length:3024        Length:3024        Length:3024        Min.   :    0.00  
# Class :character   Class :character   Class :character   Class :character   1st Qu.:   23.75  
# Mode  :character   Mode  :character   Mode  :character   Mode  :character   Median :  270.50  
#                                                                             Mean   : 2021.56  
#                                                                             3rd Qu.: 1073.25  
#                                                                             Max.   :38645.00  
#                                                                             NA's   :336    
#
#------------------------



###################################################
###                                             ###
###  GRAVAÇÃO DE CÓPIA DE SEGURANÇA (BACKUP)    ###
###                                             ###
###################################################

#-----------------------------------
#  exportar conjunto de dados para arquivo CSV, ou datasets... conforme seus formatos de arquivos [ou de seus separadores]
#-----------------------------------
write.csv2(montadoras_licenc2, "C:/FGV_EDA/montadoras_licenciamentos_longo_.csv")
write.csv2(montadoras_licenc2, "montadoras_licenciamentos_longo_.csv")


#-----------------------------------
#  exportar em MS-Excel (diretamente) ou outros formatos comerciais
#  
# Pacote rio | "Canivete Suiço" - A Swiss-Army Knife for Data I/O
# 
#  https://cran.r-project.org/web/packages/rio/index.html
#  https://cran.r-project.org/web/packages/rio/rio.pdf
#-----------------------------------



#----------------------------
#   Término do script da Aula 03
#----------------------------

