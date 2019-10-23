# Limpiar el espacio de trabajo
rm(list=ls())
# Establecer el directorio de trabajo en la raiz del usuario
setwd('~')

# Obtener el directorio de trabajo actual
getwd()

# Extraemos el dataset Contador Ciclista en formato CSV directamente de la página de datos abiertos de la CDMX y lo guardamos como DataFrame

df <- read.csv(url("https://datos.cdmx.gob.mx/explore/dataset/contador-ciclistas/download/?format=csv&timezone=America/Mexico_City&use_labels_for_header=true"), sep = ";", stringsAsFactors = FALSE)

#Ver la estructura
str(df)

# El día es un factor númerico, lo convierto a caracter para que no meta ruido
df$Día <- as.character(df$Día)

# Lo mismo pasa con el año
df$Año <- as.character(df$Año)

#Ver los primeros registros
head(df,20)

#Ver los últimos registros
tail(df,20)

#Ver el número de filas en la base de datos
nrow(df)

#Ver el número de columans en la base de datos
ncol(df)

#Ver datos min,max, quintiles
summary(df)

#Obtener algún dato
df[1,3]

head(df[order(df$Año, decreasing = TRUE),], 1)

tail(df[order(df$Año, df$Mes),], decreasing = FALSE, 1)


#----------------------------------------------
# OBTENER COLUMNAS DEL DATA FRAME
#----------------------------------------------

#Obtener toda una columna por su índice
df[[5]] 

#Obtener toda una columna por su nombre
df[["Cont"]]

df[2,]

tail(df[order(df$Año),])

df
