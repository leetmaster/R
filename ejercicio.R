# Limpiar el espacio de trabajo

# Establecer el directorio de trabajo en la raiz del usuario


# �Puedo importar archivos de Excel?
# !Claro! Pero necesito instalar un paquete

install.packages("readxl")

# Obtener el directorio de trabajo actual

# Importar bibliotecas dplyr y readxl

# Importar el dataset contador-ciclistas.xls y guardarlo en una variable

df <- read_excel("C:/Users/josegarcia/R/contador-ciclistas.xls")

# Mostrar estructura del dataframe

# Mostrar resumen 

# graficar la ruta Revoluci�n

plot(df[,6])

# �Notaste algo? Esta es otra manera de acceder a las columnas, por su "�ndice"

# Ordenar la tabla con base en la variable Mes

# Guardar en una variable �nicamente las columnas 5, 6 y 7 (usemos una variable para cada una)

# Obtener las medidas de dispresi�n de la Ruta Revoluci�n
# TIP: El nombre de la tabla tiene espacios, se los quitamos con la siguiente funci�n
names(df)[6]<-"Revoluci�n"

# Cambiemos todos los nombres por el nombre de la calle


# Agrupar la tabla Patriotismo por mes y guardarla en una variable

tabla_patriotismo_por_mes
# Notaste algo? Como contiene valores NA, debemos removerlos con na.rm=TRUE
# Funciona igual con la suma
# summarise(sum(Patriotismo,na.rm=TRUE))

# Extraer el 50% de los datos de forma aleatoria con reemplazo.

# Extraer 10 datos de forma aleatoria sin reemplazo.


# En un objeto guardar los d�as que hubo m�s de 1000 ciclistas en Reforma222

reforma_mayor_que_1000

# Guardar en una variable las fechas en que los 3 contadores registraron al menos 1000 ciclistas, cada uno

contadores_mayor_1000