df <- read.csv(url("https://datos.cdmx.gob.mx/explore/dataset/contador-ciclistas/download/?format=csv&timezone=America/Mexico_City&use_labels_for_header=true"), sep = ';', stringsAsFactors = TRUE)

id <- c('Año', 'Alcaldia', 'Cursos')

apellido <- c('Muñoz', 'Perez')

persona <- data.frame(nombre, apellido)

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

str(df)

summary(df)

hist(df$Cursos)

plot(df$Alcaldia, df$Cursos)

abline(df[Año])

