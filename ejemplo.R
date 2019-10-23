# Limpiar el espacio de trabajo
rm(list=ls())
# Establecer el directorio de trabajo en la raiz del usuario
setwd('~')

# Obtener el directorio de trabajo actual
getwd()

#a) Guardarla en un objetos de nombre "datos_resi"
library(dplyr)

# Declaro un vector para darle nombre a las columnas

id <- c('A�o', 'Alcaldia', 'Cursos')

alcaldias <- c("�lvaro Obreg�n",
                "Azcapotzalco",
                "Benito Ju�rez",
                "Coyoac�n",
                "Cuajimalpa",
                "Cuauht�moc",
                "Gustavo A. Madero",
                "Iztacalco",
                "Iztapalapa",
                "Magdalena Contreras",
                "Miguel Hidalgo",
                "Milpa Alta",
                "Tl�huac",
                "Tlalpan",
                "Venustiano Carranza",
                "Xochimilco")

# Observen que son necesarios dobles diagonales regulares //

df <- read.csv("C://Users//josegarcia//R//historico-de-capacitacion.csv", sep = ";", col.names = (id),  stringsAsFactors = TRUE)

# En este caso el a�o es una variable cualitativa, lo indicamos con la funci�n levels

df$A�o <- factor(df$A�o, levels = c("2013","2014", "2015", "2016", "2017", "2018", "2019"))

# Las alcald�as tienen errores de codificaci�n, puedo cambiar los nombres
levels(df$Alcaldia) <- alcaldias 

df$Alcaldia

plot(datos_resi)
hist(datos_resi$temperatura)

plot(df)
hist(df$Cursos)

#b) Obtener el promedio de las variables: temperatura y glucosa

promedio_temp <- mean(datos_resi$temperatura)
promedio_glucosa <- mean(datos_resi$glucosa)

#b) Obtener el promedio de cursos

mean(df$Cursos)

#c) Ordenar la tabla con base en la variable a�o

arrange(df, A�o)

#d)Guardar en una variable �nicamente la columna 2.

alcaldias <- df[, 2]


#e) Mostrar y guardar en una variable, la media de la variable glucosa por tipo de residente 

tabla_cursos_por_a�o <- df %>%
  group_by(A�o) %>%
  summarise(mean(Cursos))

# probar cambiar mean por sum

tabla_cursos_por_a�o


#f) Extraer el 50% de los datos de forma aleatoria con reemplazo.

df %>% sample_frac(0.50, rep=T)

#Muestreo aleatorio simple con reemplazo: Despu�s de que un elemento ha sido seleccionado del marco de la muestra se devuelve y es elegible para ser seleccionado nuevamente.

#g)Extraer 10 datos de forma aleatoria sin reemplazo.

df %>% 
  sample_n(10)

#h)Mostrar aquellas alcald�as que impartieron m�s de 20 cursos


filter(df, Cursos >=20)

#i) Mostrar las alcald�as que dieron m�s de 10 cursos en 2019

filter (select(df, A�o, Alcaldia, Cursos), A�o == 2019, Cursos > 10)

#j) Mostrar los cursos impartidos por la alcald�a Benito Ju�rez

filter (select(df, A�o, Alcaldia, Cursos), Alcaldia == "Benito Ju�rez")