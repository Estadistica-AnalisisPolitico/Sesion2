
#link="https://github.com/Estadistica-AnalisisPolitico/DataFiles-estadistica/raw/main/U1_e1.xlsx"
#inei=rio::import(link,skip = 2)
link="https://github.com/Estadistica-AnalisisPolitico/DataFiles-estadistica/raw/main/U1_e1.csv"
inei=read.csv(link,skip = 2)
#names(inei)
inei=inei[,c("Departamento","Provincia","Demográfico","Hogar","Social")]
#gsub(" ","_",inei[2,3:5]) 
newNames=gsub(" ","_",inei[2,3:5]) 
betterNames=stringi::stri_trans_general(str = newNames, id = "Latin-ASCII")
names(inei)[3:5]=gsub(" ","_",betterNames) 
inei=inei[-c(1:4),]
inei[,3:5]=lapply(inei[,3:5], as.numeric)
#str(inei)
hip=formula(Porcentaje_de_personas_que_tienen_algun_tipo_de_seguro~.)
resultado=lm(hip,data=inei[,3:5])
summary(resultado)
library(lm.beta)
lm.beta(resultado)