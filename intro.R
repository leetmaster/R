# Se recomienda empezar cada script con los siguientes comandos
# Limpiar el espacio de trabajo
rm(list=ls())
# Establecer el directorio de trabajo en la raiz
setwd('~')

# Operadores

# Aritméticos

# Suma
1 + 2

# Resta
2 - 2

# Multiplicación
5 * 3

# División
4 / 2

# Potencia

3 ** 3

# ¿Cómo saco una raiz cuadrada usando potencia?



# Relacionales
# son usados para hacer comparaciones y siempre devuelven como resultado TRUE o FALSE (verdadero o falso, respectivamente).

# Menor que	
5 < 3

# Menor o igual que	
5 <= 3

# Mayor que	
5 > 3

# Mayor o igual que	
5 >= 3

# Exactamente igual que	
5 == 3

# No es igual que	
5 != 3

# Lógicos
# se usan en álgebra booleana para describir relaciones lógicas

# O	
TRUE | FALSE

# y	
TRUE & FALSE

# Negación	
!TRUE

# Afirmación
isTRUE(TRUE)	

# Variables y Tipos de datos en

# Usamos el operador <- para asignarle un valor a una variable

# Caracter
pA <- "Mercurio"

pT <- "Terrestre"

# Numerico entero
pD <- 4879

# Numerico real
pR <- 58.16

# Lógico
pN <- F

# ¿Puedo expresar el valor de F de otra manera?

# Vectores (conjuntos de un solo tipo de datos)

planeta <- c(pA, "Venus", "Tierra", "Marte", "Júpiter", "Saturno", "Urano", "Neptuno")

tipo <- c(pT, "Terrestre", "Terrestre", "Terrestre", "Gas", "Gas", "Gas", "Gas")

diametro <- c(pD, 12104, 12742, 6779, 139882, 116464, 50724, 49242)

rotacion <- c(pR, 243, 365, 312.7, 314.2, 0.104, 0.1714, 0.167)

anillos <-c(pN, F, F, F, T, T, T, T)

# DataFrame (conjunto de vectores que soporta diferentes tipos de datos)
# Un DataFrame se almacena en forma tabular, es decir filas y columnas

informacion_planetas <- data.frame(planeta, tipo, diametro, rotacion, anillos)

# Condicionales

# Usamos el operador $ para acceder a una columna del dataframe
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

# Instalación de paquetes
# Solo se hace una vez
#install.packages("dplyr")

# invocación de la biblioteca dplyr
library(dplyr)

# Muestra toda la información del planeta tierra
subset(informacion_planetas, planeta=="Tierra")
