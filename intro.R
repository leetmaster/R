# Se recomienda empezar cada script con los siguientes comandos
# Limpiar el espacio de trabajo
rm(list=ls())
# Establecer el directorio de trabajo en la raiz
setwd('~')

# Tipos de datos en R

# Logico

verdadero <- TRUE
falso <- FALSE

# Numerico

numerico <- 23.5

# Entero

entero <- 2L

# Complejo

complejo <- 2+5i

# Caracter

caracter <- "Algo"

# Raw

Raw <- charToRaw("hola")

# Vectores (un solo tipo de datos)

manzana <- c('roja', 'verde', 'amarilla')
platano <- c('dominico', 'tabasco', 'macho')
print(manzana)

# Lista (varios tipos de datos)

lista1 <- list(c(2,5,3),21.3, sin)

# Matrices (dos dimensiones)

Matriz <- matrix(c('a','a','b','c','b','a'), nrow=2, ncol=3,byrow=TRUE)

# Arreglos (multiples dimensiones)

arreglo <- array(c('verde','amarillo'), dim=c(3,3,2))

# Factores

# Data Frames

frutas <- data.frame(manzana, platano)
frutas

# Funciones

my.summary <- function(x){
	
	#código a ejecutar
	s.out <- sum(x)
	l.out <- length(x)
	m.out <- s.out / l.out
	out <- c(s.out, l.out, m.out)
	names(out) <- c("sum", "lenght", "mean")
	return(out)
	
}

# asigno a una variable un rango de enteros del 1 al 10 
z <- 1:10

my.summary(z)

nombreCompleto <- function(x,y){
	
	return(paste(x,y))
}

nombreCompleto("Ruben","Garcia")

myBirthday <- function(a){
	
	return(2019-a)
}

myBirthday(1980)

# Condicionales

a <- 2
b <- 3

if(a == b){	
	print("Son iguales")
}else if (a<b){
	print("menor")
}else{
	print("mayor")
	
}

caso <- "T1"

switch(caso,
	T1={
		X <- "Caso 1"
	},
	T2={
		X <- "Caso 2"
	},
	T3={
		X <- "Caso 3"
	},
	stop("Nada")
	)


# Ciclos

v <- LETTERS[1:4]
for (i in v){
	
	print(i)
}

for (i in 1:10){
	print(i)
}

mymat = matrix(nrow=30, ncol=30)

for(i in 1:dim(mymat)[1])
{
	for(j in 1:dim(mymat)[2]){
		mymat[i,j] = i*j
	}
}

print(mymat)

dim(mymat)[1]
