# Limpiar el espacio de trabajo
rm(list=ls())
# Establecer el directorio de trabajo en la raiz del usuario
setwd('~')

# Puedo importar archivos de Excel?
#install.packages("readxl")

# Obtener el directorio de trabajo actual
getwd()

# Importar bibliotecas dplyr y readxl
library(dplyr)
library(readxl)

# Importar el dataset contador-ciclistas.xls y guardarlo en una variable

df <- read_excel("C:/Users/josegarcia/R/contador-ciclistas.xls")

# Mostrar estructura del dataframe
str(df)

# Mostrar resumen 
summary(df)

# graficar la ruta Revolución

plot(df[6])

# Ordenar la tabla con base en la variable Mes

arrange(df, Mes)

# Guardar en una variable únicamente las columnas 5, 6 y 7

reforma <- df[, 5]
patriotismo <- df[, 6]
revolucion <- df[,7]

# Obtener las medidas de dispresión de la Ruta Revolución

# TIP: El nombre de la tabla tiene espacios, se los quitamos con la siguiente función
names(df)[6]<-"Revolución"
# Cambiemos todos los nombres por el nombre de la calle
names(df)[5]<-"Reforma222"
names(df)[7]<-"Patriotismo"

var(df$Revolución)
sd(df$Revolución)


# Agrupar la columna Patriotismo por mes y guardarla en una variable
tabla_patriotismo_por_mes <- df %>%
group_by(Mes) %>%
summarise(mean(Patriotismo))

tabla_patriotismo_por_mes
# Notaste algo? Como contiene valores NA, debemos removerlos con na.rm=TRUE
# Funciona igual con la suma
# summarise(sum(Patriotismo,na.rm=TRUE))

# Extraer el 50% de los datos de forma aleatoria con reemplazo.

df %>% sample_frac(0.50, rep=T)

# Muestreo aleatorio simple con reemplazo: Después de que un elemento ha sido seleccionado del marco de la muestra se devuelve y es elegible para ser seleccionado nuevamente.

# Extraer 10 datos de forma aleatoria sin reemplazo.

df %>%
sample_n(10)

# En un objeto guardar los días que hubo más de 1000 ciclistas en Reforma222

names(df)[5]<-"Reforma222"
reforma_mayor_que_1000 <- filter(df, Reforma222 >=1000)
reforma_mayor_que_1000

# Guardar en una variable las fechas en que los 3 contadores registraron al menos 1000 ciclistas, cada uno

names(df)[7]<-"Revolucion"
contadores_mayor_1000 <- filter(select(df, Día, Mes, Año, Patriotismo, Reforma222, Revolucion), Patriotismo >= 1000, Reforma222 >= 1000, Revolucion >= 1000)
contadores_mayor_1000