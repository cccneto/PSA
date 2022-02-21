# instalando e carregando pacote 
#install.packages("bibliometrix")
library(bibliometrix)
library(bibtex)

# carregando app
bibliometrix::biblioshiny()

#Importing databases
file_web <- "C:/Users/User/Documents/GitHub/PSA/data/savedrecs_web.bib"
file_scopus <- "C:/Users/User/Documents/GitHub/PSA/data/scopus_full.bib"

#convertendo em dataframes
M_web <- convert2df(file = file_web, dbsource = "wos", format = "bibtex")
M_scopus <- convert2df(file = file_scopus, dbsource = "scopus", format = "bibtex")

# realizando junção das bases

M <- mergeDbSources(M_web, M_scopus, remove.duplicated=TRUE) # o resultado é 220 x 29

results <- biblioAnalysis(M, sep = ";")

options(width=100)
S <- summary(object = results, k = 10, pause = FALSE)