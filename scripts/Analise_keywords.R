library(tidyverse)

scopus_all_en <- read_csv("C:/Users/User/Downloads/dados_bibliometria_psa/Scopus/scopus_all_en.csv")

base_keywords <- scopus_all_en %>% select(`Author Keywords`, `Index Keywords`)

saveRDS(object = base_keywords, file = "base_webScience.xls")
readr::write_delim(base_keywords, file = "base_webScience.csv", delim = ";")
