# Limpiar el espacio de trabajo
rm(list=ls())
# Establecer el directorio de trabajo en la raiz del usuario
setwd('~')

# Obtener el directorio de trabajo actual
getwd()

#a) Guardarla en un objetos de nombre "datos_resi"
library(dplyr)

# Observen que son necesarios dobles diagonales regulares //

datos_resi <- read.csv("C://Users//josegarcia//R//residentes.csv", sep=",", header=T)

datos_resi <- read.csv("C:\\Users\\josegarcia\\R\\residentes.csv", sep=",", header=T)


id <- c('Año', 'Alcaldia', 'Cursos')

df <- read.csv(url("https://datos.cdmx.gob.mx/explore/dataset/historico-de-resultados-de-los-cursos-de-capacitacion-a-locatarios-de-los-mercad/download/?format=csv&timezone=America/Mexico_City&use_labels_for_header=true"), sep = ";", col.names = (id),  stringsAsFactors = TRUE)

# En este caso el año es una variable cualitativa, lo indicamos con la función levels

df$Año <- factor(df$Año, levels = c("2013","2014", "2015", "2016", "2017", "2018", "2019"),
                 labels =c("2013","2014", "2015", "2016", "2017", "2018", "2019"))

plot(datos_resi)
hist(datos_resi$temperatura)

plot(df)
hist(df$Cursos)

#b) Obtener el promedio de las variables: temperatura y glucosa

promedio_temp <- mean(datos_resi$temperatura)
promedio_glucosa <- mean(datos_resi$glucosa)

#b) Obtener el promedio de cursos

mean(df$Cursos)

#c) Ordenar la tabla con base en la variable año

arrange(df, Año)

#d)Guardar en una variable únicamente la columna 2.

alcaldias <- df[, 2]


#e) Mostrar y guardar en una variable, la media de la variable glucosa por tipo de residente 

tabla_cursos_por_año <- df %>%
  group_by(Año) %>%
  summarise(mean(Cursos))

# probar cambiar mean por sum

tabla_cursos_por_año


#f) Extraer el 50% de los datos de forma aleatoria con reemplazo.

df %>% sample_frac(0.50, rep=T)

#Muestreo aleatorio simple con reemplazo: Después de que un elemento ha sido seleccionado del marco de la muestra se devuelve y es elegible para ser seleccionado nuevamente.

#g)Extraer 10 datos de forma aleatoria sin reemplazo.

df %>% 
  sample_n(10)

#h)En un objeto guardar aquellas alcaldías que impartieron más de 10 cursos


alcaldias_con_mas_de_10_cursos <- filter(df, Cursos >=10)

alcaldias_con_mas_de_10_cursos

#i) Mostrar las alcaldías que dieron más de 10 cursos en 2019

filter (select(df, Año, Alcaldia, Cursos), Año == 2019, Cursos > 10)
