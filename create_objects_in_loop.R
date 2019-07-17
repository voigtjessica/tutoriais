# Open objects in loop and assign them to a new object

library(dplyr)

lista <- c("info_contratos.csv","info_estados.csv", 
           "info_item_contrato.csv","info_item_licitacao.csv","info_licitacoes.csv" ,
           "info_municipios.csv","info_rais.csv")

for(i in 1: length(lista)){
  
  print(lista[i])
  
  a <- fread(lista[i], encoding = "UTF-8" )
  n <- lista[i]
  
  assign(paste0(n), a) 
  
}

