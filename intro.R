# Se recomienda empezar cada script con los siguientes comandos
# Limpiar el espacio de trabajo
rm(list=ls())
# Establecer el directorio de trabajo en la raiz
setwd('~')

getwd()

# Variables y Tipos de datos en R
# Usamos el operador <- para asignarle un valor a una variable

# Caracter
pP <- "Mercurio"

pT <- "Terrestre"

# Numerico entero
pD <- 4879

# Numerico real
pR <- 58.16

# Lógico
pA <- F

# ¿Puedo expresar el valor de F de otra manera?
pA <- FALSE
# Vectores (conjuntos de un solo tipo de datos)

planeta <- c(pP, "Venus", "Tierra", "Marte", "Júpiter", "Saturno", "Urano", "Neptuno")

tipo <- c(pT, "Terrestre", "Terrestre", "Terrestre", "Gas", "Gas", "Gas", "Gas")

diametro <- c(pD, 12104, 12742, 6779, 139882, 116464, 50724, 49242)

rotacion <- c(pR, 243, 365, 312.7, 314.2, 0.104, 0.1714, 0.167)

anillos <-c(pA, F, F, F, T, T, T, T)

# DataFrame (conjunto de vectores que soporta diferentes tipos de datos)
# Un DataFrame se almacena en forma tabular, es decir filas y columnas
# Usamos row.names para dar nombre a la columna principal
informacion_planetas <- data.frame( tipo, diametro, rotacion, anillos, row.names = planeta)

# Las funciones nos permiten realizar operaciones de manera automática
# Imprime el dataframe
print(informacion_planetas)

# Muestra la estructura (tipos de datos) de la tabla
str(informacion_planetas)

# Muestra un resuman de la tabla
summary(informacion_planetas)

# Media
# Usamos el operador $ para acceder a los datos numéricos de la tabla
mean(informacion_planetas$rotacion)
# Median
median(informacion_planetas$rotacion)

# Varianza
var(informacion_planetas$rotacion)
# Desviación estandar
sd(informacion_planetas$rotacion)

# Hay otra forma de calcular la desviación estandar
var(informacion_planetas$rotacion) ** 0.5

# Muestra toda la información del planeta tierra
informacion_planetas["Tierra",]

# Muestra toda la información de rotacion
informacion_planetas[,"rotacion"]

# Guardo mi dataframe final
write.csv(informacion_planetas,"planetas.csv")

# Podemos abrir un set de datos desde un archivo
df <- read.csv("planetas.csv", stringsAsFactors = TRUE)

# Cuando abrimos un sed de datos automáticamente agrega el número de observación
# Mueve a la derecha la columna principal con nombre "X"
# Le cambiamos el nombre a nuestra columna principal
colnames(df)[1] <- "planetas"

# R me permite graficar los datos
# Uso la función plot para graficar un diagrama de dispersión de magnitud vs. indice
plot(df)

# si le paso dos parametros grafica x vs. y
plot(df$diametro,xlab = "Planeta" , ylab = "Diametro", type = "h",  main="Diametro de los Planetas")
# Intenta cambiar type="s" por p, l, b, c, o, h, s, n
# ¿Qué ocurre?

plot(df$planeta,df$rotacion,xlab = "Planeta" , ylab = "Rotación", type = "p",  main="Rotación de los Planetas")

barplot(df$diametro, names.arg = df$planeta, main = "Planetas del sistema solar")
