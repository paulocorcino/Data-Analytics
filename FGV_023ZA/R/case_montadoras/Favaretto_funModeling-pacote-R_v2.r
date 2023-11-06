
#-------------------------------
#
#  Disciplina:  Análise Exploratória de Dados (EDA)
#
#  MBA FGV - Turma Live 023ZA (FGV Online) - pacote funModeling (extra Aula 03) 
#
#  Uso para finalidade didática em aula expositiva 
#
#  Prof. Dr. José Favaretto - ver. 1.3 | outubro/2023 
#  www.favaretto.net
#
#-------------------------------
#

# Fontes para estudo sobre este pacote:
# ---------------------------------
# https://cran.r-project.org/package=funModeling
# https://cloud.r-project.org/web/packages/funModeling/index.html
# https://cran.r-project.org/src/contrib/Archive/funModeling   (todas as versões)
#

# Sites do autor
#   http://pablo14.github.io/funModeling/
#   https://github.com/pablo14/funModeling/issues
#   http://pablo14.github.io/funModeling/articles/funModeling_quickstart.html
#   https://blog.datascienceheroes.com/author/pabloc/
#   https://blog.datascienceheroes.com/funmodeling-new-site-and-version/


# Baixar o arquivo compactado desta biblioteca
#   https://cran.r-project.org/src/contrib/Archive/funModeling   (todas as versões)
#   https://cran.r-project.org/src/contrib/Archive/funModeling/funModeling_1.9.4.tar.gz   (versão mais atual)
#

install.packages("tidyverse")
install.packages("funModeling")

# install.packages("Hmisc")  # possível instalação adicional se necessária
library(tidyverse)


#------- Ao instalar o pacote "funModeling" (via CRAN do R), com a versão do R 4.3.1, gerou ERRO -----------
# install.packages("funModeling")
# Installing package into ‘C:/Users/josef/AppData/Local/R/win-library/4.3’(as ‘lib’ is unspecified)
# Warning message:
# package ‘funModeling’ is not available for this version of R
# A version of this package for your version of R might be available elsewhere, see the ideas at
# https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages 
#---------------------


#------------
#------------
# seguir as instruções abaixo 
#------------
#------------

# 1) Antes de instalar o pacote "funModeling", instalar as dependências do pacote!
install.packages(c("Hmisc", "ROCR", "gridExtra", "pander", "reshape2", "lazyeval", "moments", "entropy"))

# 2) Faça o download manualmente do pacote em sua versão mais recente, disponível em: https://cran.r-project.org/src/contrib/Archive/funModeling/funModeling_1.9.4.tar.gz 

# 3) Faça a instalação diretamente via arquivo baixado:
# No Software RStudio
# ==========
#  No Menu superior, vá em 'Tools' > 'Install Packages...' 
#  No menu pull-down 'Install from:', selecione a opção 'Package Archive File (.zip, .tar.gz)'
#  Use o botão "Browse...", para procurar o caminho onde o arquivo 'tar.gz' foi baixado
#  Para finalizar, clique no botão 'Install'... Pronto, a instalação do pacote deverá iniciar!

# No Software R
# =============
#  Usar a linha de comando para instalação... 
#  install.packages("C:/caminho/onde/foi/baixado/funModeling_1.9.4.tar.gz", repos = NULL, type = "source")
#  Pronto, a instalação do pacote deverá iniciar!

# 4) Para finalizar, carregar o pacote com:
library(funModeling) 
#------------
#------------


#--------------------------
# Exemplo de uso (simplificado) e teste de funcionalidades iniciais do pacote 'funModeling'
#--------------------------  

# carregar um conjunto de dados para os testes, diretamente com observações em cada linha
# Dicas Importantes: 
# 1) não deve existir 'espaço' nos campos dos valores dos dados, apenas como separador!
# 2) não colocar vírgula (,) nas variáveis numéricas contínuas - deve ser ponto (.)
# ------------------------
fun_data <- read.table(header=TRUE, text='
nome turma altura sapato ultimo_titulo experiencia_dados uni_fed regiao
José turma1 1.72 42 doutorado S SP Sudeste
Lúcia turma1 1.65 39 mestrado N RO Norte
Antonio turma1 1.90 46 MBA N RJ Sudeste
Maria turma1 1.75 43 MBA S MG Sudeste
João turma1 1.68 40 pós-graduação S SP Sudeste
Carmem turma1 1.57 36 doutorado N SP Sudeste
Cláudia turma1 1.70 41 pós-graduação N SP Sudeste
Celso turma1 1.63 37 pós-graduação N BA Nordeste
Suely turma1 1.55 35 mestrado S PE Nordeste
Luís turma1 1.71 40 pós-graduação S BA Nordeste
Adelson turma1 1.72 37 graduação N PB Nordeste
Serafim turma1 1.59 35 graduação N PR Sul
Joana turma2 1.75 44 graduação S PR Sul
Catarina turma2 1.68 34 graduação N SC Sul
Carla turma2 1.60 35 graduação S DF Centro-Oeste
Marcelo turma2 1.67 38 graduação N DF Centro-Oeste
Frank turma2 1.54 34 graduação S GO Centro-Oeste
Cristiano turma2 1.76 40 pós-graduação N RS Sul
Pamela turma2 1.75 39 graduação S MT Centro-Oeste
Paola turma2 1.76 39 graduação N AM Norte
Kevin turma2 1.81 39 graduação N RJ Sudeste
Anderson turma2 1.63 32 graduação N PI Nordeste
Cristina turma2 1.63 35 graduação N MG Sudeste
Antonia turma2 1.57 36 graduação N AM Norte
')
#

# verificar os nomes das variáveis (primeira linha do dataset)
names(fun_data)
# [1] "nome"              "turma"             "altura"           
# [4] "sapato"            "ultimo_titulo"     "experiencia_dados"
# [7] "uni_fed"           "regiao"   

# mostra o conjunto de dados como tabela (Software R - abre uma janela; e R Studio Desktop - mostra na janela de código) 
View(fun_data)


#-----------------------------------
#   EDA rápida  - Automated Exploratory Data Analysis (autoEDA)
#
#   apenas uma introdução com "automatização básica"... 
#   o IMPORTANTE é partir SEMPRE partir qualquer EDA de um problema de negócio...
#   como discutido amplamente nas aulas!!!
#
# inspiração:
# https://blog.datascienceheroes.com/exploratory-data-analysis-in-r-intro/
#
#-----------------------------------
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
#

# library(tidyverse) 
# library(funModeling) 

# executa a função criada para realizar um procedimento rápido de EDA
# (essa é somente uma introdução com "automatização básica"... o IMPORTANTE é partir SEMPRE de um problema de negócio!!!)
EDA_rapida(fun_data)

# quando quiser escolher apenas algumas variáveis do conjunto de dados (dataset) já carregado
data1=fun_data %>% select(altura, ultimo_titulo)

# executar novamente, agora apenas com as variáveis de interesse
EDA_rapida(data1)

#----------------------------
#   Término do script do pacote funModeling (extra Aula 03) 
#----------------------------


