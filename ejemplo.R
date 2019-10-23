df <- read.csv(url("https://datos.cdmx.gob.mx/explore/dataset/contador-ciclistas/download/?format=csv&timezone=America/Mexico_City&use_labels_for_header=true"), sep = ';', stringsAsFactors = TRUE)

id <- c('Año', 'Alcaldia', 'Cursos')

summary(df)

str(df)

hist(df$Contador.Ruta.Reforma222)

hist(df$Contador.Ruta.Reforma222, 
     main="Contador Reforma", 
     xlab="Ciclistas", 
     border="blue", 
     col="green",
    
     breaks=5,10,15)

persona$apellido

df <- read.csv(url("https://datos.cdmx.gob.mx/explore/dataset/historico-de-resultados-de-los-cursos-de-capacitacion-a-locatarios-de-los-mercad/download/?format=csv&timezone=America/Mexico_City&use_labels_for_header=true"), sep = ";", col.names = (id),  stringsAsFactors = TRUE)

# En este caso el año es una variable cualitativa, lo indicamos con la función levels

df$Año <- factor(df$Año, levels = c("2013","2014", "2015", "2016", "2017", "2018", "2019"),
                    labels =c("2013","2014", "2015", "2016", "2017", "2018", "2019"))
str(df)

summary(df)

hist(df$Cursos)

plot(df$Alcaldia, df$Cursos)

head(df)
tail(df)

df$Año = 2019
