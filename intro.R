# Se recomienda empezar cada script con los siguientes comandos
# Limpiar el espacio de trabajo
rm(list=ls())
# Establecer el directorio de trabajo en la raiz
setwd('~')



# invocación de la biblioteca dplyr
library(dplyr)

# Tipos de datos en R

# Caracter
pA <- "Mercurio"

pT <- "Terrestre"

# Numerico entero
pD <- 4879

# Numerico real
pR <- 58.16

# Lógico
pN <- F

# Vectores (un solo tipo de datos)

planeta <- c(pA, "Venus", "Tierra", "Marte", "Júpiter", "Saturno", "Urano", "Neptuno")

tipo <- c(pT, "Terrestre", "Terrestre", "Terrestre", "Gas", "Gas", "Gas", "Gas")

diametro <- c(pD, 12104, 12742, 6779, 139882, 116464, 50724, 49242)

rotacion <- c(pR, 243, 365, 312.7, 314.2, 0.104, 0.1714, 0.167)

anillos <-c(pN, F, F, F, T, T, T, T)

# DataFrame (conjunto de vectores de diferentes tipos)
informacion_planetas <- data.frame(planeta, tipo, diametro, rotacion, anillos)

# Condicionales

if(informacion_planetas$rotacion >= 365) {
  print("Días terrestres")
} else {
  print("No son días terrestres")
}

# Ciclos

num <- 0
while(num < 8) {
  print(informacion_planetas[,num])
  num <- num +1
}


# Funciones

print(informacion_planetas)

# Muestra la estructura (tipos de datos) de la tabla
str(informacion_planetas)

# Muestra un resumen de los datos de la tabla
summary(informacion_planetas)

# Muestra toda la información del planeta tierra

subset(informacion_planetas, planeta=="Tierra")


