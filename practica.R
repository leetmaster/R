# Limpiar espacio de trabajo
rm(list=ls())
# Establecer el directorio de trabajo en la raiz
setwd('~')
getwd()

# Siguiendo el ejemplo de los planetas
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

# Crear un vector con el número de habitantes de cada una
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

# Crear un nuevo dataframe usando el vector de alcaldias como columna principal
informacion_alcaldias <- data.frame(habitantes, morena, row.names = alcaldia)

# Visualizar la información de algúna alcaldía
informacion_alcaldias["Cuauhtemoc",]

# Ordenamos el dataframe por alcaldía
informacion_alcaldias <- informacion_alcaldias[order(row.names(informacion_alcaldias), decreasing = FALSE),]

# Mostramos el dataframe ordenado


# mostrar la estructura y el resumen del dataframe


# mostrar las medidas de tendencia central y de dispersión


# ¿Cómo obtengo el número total de habitantes de la CDMX?
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

# Agregamos el vector como una nueva columna a la tabla

informacion_alcaldias['superficie'] <- superficie

# ¿Cómo obtenemos la superficie total de la CDMX?


# Guardo mi dataframe final
write.csv(informacion_alcaldias,"alcaldias.csv", row.names = TRUE)

# Abro el archivo en un nuevo dataFrame


# Cambio el nombre de la columna 1 a "alcaldia"
colnames(df)[1] <- "alcaldia"

# ¿Cómo calculamos la densidad de población?

densidad_de_poblacion <- df$habitantes / df$superficie

# agrego el valor de la densidad de población redondeada a dos decimales

df['densidad'] <- round(densidad_de_poblacion, 2)

# Muestro mi nuevo dataframe


# R me permite graficar los datos
# Uso la función plot para graficar un diagrama de dispersión de magnitud vs. indice
plot(df)

# Graficar habitantes, superficie y densidad de población

barplot(df$habitantes, names.arg = df$alcaldia, main = "Habitantes por Alcaldia")



# Guardo mi dataframe en un archivo nuevo


