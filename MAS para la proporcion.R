#Highly recommended commands
#cleans up R workspace
rm(list=ls()) 
#sets workspace to user root
setwd("~")

# declaramos las variables iniciales

barplot(a)

N = 20000
n = 250
autos = 70


intensidad = n/N # No se considera el factor de corrección porque < 0.5

# Proporción
p = autos/n
q = 1-p

# Calcule la desviación estandar de la proporción 
SP = sqrt(p*q/n)

# Calcule un intervalo de confianza al 90, 95 y 99% e interprete los resultados obtenidos. 

z_90 = qnorm(1-0.05) # Usamos la distribución Z porque n > 30 
z_95 = qnorm(1-0.025) # Estos valores los validé con la tabla T-Student
z_99 = qnorm(1-0.005)

intervalo_90 = c(p - z_90 * SP,
                p + z_90* SP)
#Con un grado de confianza del 90%, hay una probabilidad de entre 23% y 32% que el auto sea americano

intervalo_95 = c(p - z_95 * SP,
                p + z_95 * SP)
#Con un grado de confianza del 95%, hay una probabilidad de entre 22% y 33% que el auto sea americano

intervalo_99 = c(p - z_99 * SP,
                p + z_99 * SP)

#Con un grado de confianza del 99%, hay una probabilidad de entre 20% y 35% que el auto sea americano

# Estimar el número total de autos estadounidenses
total = N * p

#Intervalos de confianza para el total estimados
total_90 = c(total - z_90 * N * SP,
            total + z_90 * N * SP)


total_95 = c(total - z_95 * N * SP,
            total + z_95 * N * SP)
#Con un grado de confianza del 95%, el gasto total de los estudiantes estará entre 37928.51 y 37951.48

total_99 = c(total - z_99 * N* SP,
            total + z_99 * N* SP)

#Con un grado de confianza del 99%, el gasto total de los estudiantes estará entre 37922.9 y 37957.10

# Suponga que los estudiantes seleccionados son una muestra preliminar (o muestra piloto) de tamaño n=15 
# ¿Cuál es el tamaño de muestra necesario para estimar el gasto promedio por estudiante, de tal manera que el promedio tenga una precisión de más menos 6 pesos y una confiabilidad de 95%? 
d = 0.05

n_optima_90 = (N * z_90^2 * (p*q)) / (N * d^2 + z_90^2 * (p*q))
n_optima_95 = (N * z_95^2 * (p*q)) / (N * d^2 + z_95^2 * (p*q))
n_optima_99 = (N * z_99^2 * (p*q)) / (N * d^2 + z_99^2 * (p*q))

# Suponga que el muestreo con el que se llevó a cabo la muestra piloto no registro ningún problema mayor. 
# ¿Cuál es el número de elementos que se deben seleccionar aleatoriamente para completar la muestra?
n_optima

