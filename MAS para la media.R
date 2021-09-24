#Highly recommended commands
#cleans up R workspace
rm(list=ls()) 
#sets workspace to user root
setwd("~") 

# declaramos las variables iniciales
a = c(120, 150, 100, 80, 100, 90, 60, 70, 90, 100, 50, 90, 80, 65, 110)

barplot(a)

N = 420
n = length(a)

intensidad = n/N # No se considera el factor de corrección porque < 0.5

# Haga una estimación puntual del gasto semanal promedio por estudiante. 
media = mean(a)

# Calcule la varianza muestral para el gasto. 
varianza = var(a)

# Calcule la varianza y la desviación estándar de la media muestral para el gasto.     
des_media =sqrt(varianza)/sqrt(n)

var_media = des_media^2

# Calcule un intervalo de confianza del gasto promedio por estudiante al 90, 95 y 99% e interprete los resultados obtenidos. 

t90 = qt(0.90, 14) # Usamos la distribución T porque n > 30 
t95 = qt(0.95, 14) # Estos valores los validé con la tabla T-Student
t99 = qt(0.99, 14)

intervalo90 = c(media - t90*des_media,
                media + t90*des_media)
#Con un grado de confianza del 90%, el gasto promedio de los estudiantes estará entre 81.56 y 99.10

intervalo95 = c(media - t95*des_media,
                media + t95*des_media)
#Con un grado de confianza del 95%, el gasto promedio de los estudiantes estará entre 78.85 y 101.81

intervalo99 = c(media - t99*des_media,
                media + t99*des_media)

#Con un grado de confianza del 99%, el gasto promedio de los estudiantes estará entre 73.22 y 107.44

# Realice una estimación puntual del gasto total de los estudiantes.
total = N * media

# Calcule un intervalo de confianza del gasto total de los estudiantes al 90, 95 y 99% de confianza. 
total90 = c(total - t90*des_media,
                total + t90*des_media)
#Con un grado de confianza del 90%, el gasto total de los estudiantes estará entre 37931.23 y 37948.77

total95 = c(total - t95*des_media,
                total + t95*des_media)
#Con un grado de confianza del 95%, el gasto total de los estudiantes estará entre 37928.51 y 37951.48

total99 = c(total - t99*des_media,
                total + t99*des_media)

#Con un grado de confianza del 99%, el gasto total de los estudiantes estará entre 37922.9 y 37957.10

# Suponga que los estudiantes seleccionados son una muestra preliminar (o muestra piloto) de tamaño n=15 
# ¿Cuál es el tamaño de muestra necesario para estimar el gasto promedio por estudiante, de tal manera que el promedio tenga una precisión de más menos 6 pesos y una confiabilidad de 95%? 
n_optima = (N * t95^2 *varianza) / (N*6^2 + t95^2 * varianza)

# Suponga que el muestreo con el que se llevó a cabo la muestra piloto no registro ningún problema mayor. 
# ¿Cuál es el número de elementos que se deben seleccionar aleatoriamente para completar la muestra?
n_optima
