# Limpiar espacio de trabajo
rm(list=ls())
# Establecer el directorio de trabajo en la raiz
setwd('~')
getwd()

# Usando el ejemplo de los planetas

# Crear un vector con los nombres de las alcaldías de la CDMX
alcaldia <- c("Azcapotzalco",
              "Coyoacán",
              "Cuajimalpa",
              "Gustavo A. Madero",
              "Iztacalco",
              "Iztapalapa",
              "Magdalena Contreras",
              "Milpa Alta",
              "Alvaro Obregón",
              "Tlahuac",
              "Tlalpan",
              "Xochimilco",
              "Benito Juarez",
              "Cuauhtemoc",
              "Miguel Hidalgo",
              "Venustiano Carranza")

# Crear un vector con el número de habitantes de cada uno

habitantes <- c(400161,
                608479,
                199224,
                1164477,
                390348,
                1827868,
                243886,
                137927,
                749982,
                361593,
                677104,
                415933,
                417416,
                532553,
                364439,
                427263)

# Crear un vector indicando si el partido gobernante es Morena o no

morena <- c(T,
             F,
             F,
             T,
             T,
             T,
             T,
             F,
             T,
             T,
             T,
             T,
             F,
             T,
             T,
             F
             )

informacion_alcaldias <- data.frame(habitantes, morena, row.names = alcaldia)

informacion_alcaldias["Cuauhtemoc",]

# Ordenamos el dataframe por alcaldía
informacion_alcaldias <- informacion_alcaldias[order(row.names(informacion_alcaldias), decreasing = FALSE),]

# ¿Qué otros ordenamientos podemos hacer?

print(informacion_alcaldias)

str(informacion_alcaldias)

summary(informacion_alcaldias)

# Obtengo el número total de habitantes de la CDMX
sum(informacion_alcaldias$habitantes)

# ¿Qué otra información podríamos agregar?

superficie <- c(96.17,
                33.66,
                26.63,
                54.40,
                74.58,
                32.40,
                94.07,
                23.30,
                117.00,
                74.58,
                46.99,
                228.41,
                85.34,
                312.00,
                33.40,
                122.00)

# Agregamos el vector como una nueva columna

informacion_alcaldias['superficie'] <- superficie

# ¿Cómo obteneos la superficie total de la CDMX?
sum(informacion_alcaldias$superficie)

# Guardo mi dataframe final
write.csv(informacion_alcaldias,"alcaldias.csv", row.names = TRUE)

# Abro el archivo en un nuevo dataFrame
df <- read.csv("alcaldias.csv", stringsAsFactors = TRUE)

# Cambio el nombre de la columna 1 a "alcaldias"
colnames(df)[1] <- "alcaldias"

# ¿Cómo calculamos la densidad de población?

densidad_de_poblacion <- df$habitantes / df$superficie

# agrego el valor de la densidad de población redondeada a dos decimales

df['densidad'] <- round(densidad_de_poblacion, 2)

# R me permite graficar los datos
# Uso la función plot para graficar un diagrama de dispersión de magnitud vs. indice
plot(df)

# si le paso dos parametros grafica x vs. y
plot(df$densidad, df$habitantes, xlab="densidad", ylab="habitantes", main="Densidad de Poblacion")

hist(df$superficie, main="Superficie por alcaldía",
     xlab="Superficie")

barplot(df$habitantes, names.arg = df$alcaldias, main = "Habitantes por Alcaldia")
barplot(df$superficie, names.arg = df$alcaldias, main = "Superficie por Alcaldia")


# Guardo mi dataframe en un archivo nuevo


