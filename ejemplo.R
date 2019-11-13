# Limpiar el espacio de trabajo
rm(list=ls())
# Establecer el directorio de trabajo en la raiz del usuario
setwd('~')

# Obtener el directorio de trabajo actual
getwd()

# Invocar la biblioteca dplyr
library(dplyr)

# Vamos a importar un set de datos (data set) pero primero:

# Declarar un vector que contenga los nombres de las alcaldías de la CDMX 
# Lo usaremos para darle nombre a las filas
alcaldias <- c("Álvaro Obregón",
                "Azcapotzalco",
                "Benito Juárez",
                "Coyoacán",
                "Cuajimalpa",
                "Cuauhtémoc",
                "Gustavo A. Madero",
                "Iztacalco",
                "Iztapalapa",
                "Magdalena Contreras",
                "Miguel Hidalgo",
                "Milpa Alta",
                "Tláhuac",
                "Tlalpan",
                "Venustiano Carranza",
                "Xochimilco")

# Ordenamos el vector de manera ascendente 
alcaldias <- sort(alcaldias, decreasing = FALSE)

# Declarar un vector para darle nombre a las columnas
id <- c('Año', 'Alcaldia', 'Cursos')

# Importamos el dataset historico-de-capacitacion.csv usando los nombres de columna que definimos con col.names = (id)
# Observen que son necesarios dobles diagonales regulares //

df <- read.csv("C://Users//josegarcia//R//historico-de-capacitacion.csv", sep = ";", col.names = (id),  stringsAsFactors = TRUE)

# Visualizamos la estructura de la tabla

str(df)

# En este caso el año es una variable cualitativa, lo indicamos con la función levels

df$Año <- factor(df$Año, levels = c("2013","2014", "2015", "2016", "2017", "2018", "2019"))

# Las alcaldías tienen errores de codificación, puedo cambiar los nombres
levels(df$Alcaldia) <- alcaldias 

# Visualizo sólo los nombres de las alcaldías
df$Alcaldia

#¿Cómo puedo visualizar las otras columnas?

# Mostrar el resumen de la tabla
summary(df)

# ¿Qué valores puedes observar?

# R me permite graficar los datos
#install.packages("ggplot2")
library("ggplot2")

ggplot(df, aes(x=Cursos)) + geom_histogram(binwidth=5, color="white", fill="navy")

ggplot(df, aes(x=Alcaldia,y=Cursos)) + geom_boxplot(color="black", fill="red")

ggplot(df, aes(x=Alcaldia,y=Cursos)) + geom_point(color="green")


plot(df)
hist(df$Cursos)

# Obtener el promedio de cursos impartidos

mean(df$Cursos)
median(df$Cursos)

# Obtener la varianza de la columna Cursos
var(df$Cursos)

# Obtener la desviación estándar de la columna Cursos
sd(df$Cursos)

# ¿De qué otra manera puedo obtener la desviación estándar?

# var(df$Cursos) ** .5 == sd(df$Cursos)

# Ordenar la tabla con base en la variable año

arrange(df, Año)

# Guardar en una variable únicamente la columna 2, para ello utilizamos su índice

alcaldias <- df[, 2]

print(alcaldias)

# Agrupar la columna Cursos por año y guardarla en una variable
# Usamos %>% para separar el código en líneas para hacerlo más legible
tabla_cursos_por_año <- df %>%
  group_by(Año) %>%
  summarise(mean(Cursos))

# probar cambiar mean por sum en la sentencia anterior
# ¿Cuál es el resultado?
tabla_cursos_por_año


# Extraer el 50% de los datos de forma aleatoria con reemplazo.

df %>% 
  sample_frac(0.50, rep=T)

# Muestreo aleatorio simple con reemplazo: 
# Después de que un elemento ha sido seleccionado del marco de la muestra se devuelve y es elegible para ser seleccionado nuevamente.
# Extraer 10 datos de forma aleatoria sin reemplazo.

df %>% 
  sample_n(10)

# Mostrar aquellas alcaldías que impartieron 20 cursos o más
filter(df, Cursos >=20)

# Mostrar las alcaldías que dieron más de 10 cursos en 2019

filter (select(df, Año, Alcaldia, Cursos), Año == 2019, Cursos > 10)

# Mostrar los cursos impartidos por la alcaldía Benito Juárez

filter (select(df, Año, Alcaldia, Cursos), Alcaldia == "Benito Juárez")

# ¿Puedo mostrar los cursos impartidos por otra alcaldía?
