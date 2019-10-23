# Limpiar el espacio de trabajo
rm(list=ls())
# Establecer el directorio de trabajo en la raiz del usuario
setwd('~')
#install.packages("readxl")

# Obtener el directorio de trabajo actual
getwd()

#a) Guardarla en un objetos de nombre "datos_resi"
library(dplyr)
library(readxl)

df <- read_excel("C:/Users/josegarcia/R/contador-ciclistas.xls")

summary(df)
str(df)

# graficar la ruta Revolución

plot(df[6])

df[5]

#b) Obtener el promedio de todos los contadores

mean(df[2])

promedio_glucosa <- mean(datos_resi$glucosa)

promedio_temp

#c) Ordenar la table con base en la variable Mes

arrange(df, Mes)

#d)Guardar en una variable únicamente las columnas 5, 6 y 7

reforma <- df[, 5]
patriotismo <- df[, 6]
revolucion <- df[,7]

#e) Mostrar y guardar en una variable, la media de la variable glucosa por tipo de residente 


# TIP: El nombre de la tabla tiene espacios, se los quitamos con la siguiente función
names(df)[6]<-"Patriotismo"

tabla_patriotismo_por_mes <- df %>%
group_by(Mes) %>%
#summarise(mean(Patriotismo, na.rm=TRUE))

# Notaste algo? Como contiene valores NA, debemos removerlos con na.rm=TRUE
# Funciona igual con la suma
# summarise(sum(Patriotismo,na.rm=TRUE))

#f) Extraer el 50% de los datos de forma aleatoria con reemplazo.

df %>% sample_frac(0.50, rep=T)

#Muestreo aleatorio simple con reemplazo: DespuÃ©s de que un elemento ha sido seleccionado del marco de la muestra se devuelve y es elegible para ser seleccionado nuevamente.

#g)Extraer 10 datos de forma aleatoria sin reemplazo.

df %>%
sample_n(10)

#h)En un objeto guardar los días que hubo más de 1000 ciclistas en Reforma222

names(df)[5]<-"Reforma222"
reforma_mayor_que_1000 <- filter(df, Reforma222 >=1000)
reforma_mayor_que_1000

#i) Guardar en una variable las fechas en que los 3 contadores registraron al menos 1000 ciclistas, cada uno

names(df)[7]<-"Revolucion"
contadores_mayor_1000 <- filter(select(df, Día, Mes, Año, Patriotismo, Reforma222, Revolucion), Patriotismo >= 1000, Reforma222 >= 1000, Revolucion >= 1000)
contadores_mayor_1000