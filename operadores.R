# Limpiar espacio de trabajo
rm(list=ls())
# Establecer el directorio de trabajo en la raiz
setwd('~')
getwd()

# Operadores
# Aritméticos

# Suma
1 + 2

# Resta
2 - 2

# Multiplicación
5 * 3

# División
4 / 2
5/0

# Potencia

3 ** 3

# ¿Cómo saco una raiz cuadrada usando potencia?

9 ** 0.5
2 ** 0.5
2 ** (1/2)

# Relacionales
# son usados para hacer comparaciones y siempre devuelven como resultado TRUE o FALSE (verdadero o falso, respectivamente).

# Menor que	
5 < 3

# Menor o igual que	
5 <= 3

# Mayor que	
5 > 3

# Mayor o igual que	
5 >= 3

# Exactamente igual que	
5 == 3

# No es igual que	
5 != 3

# Lógicos
# se usan en álgebra booleana para describir relaciones lógicas

# O	
TRUE | FALSE

# y	
TRUE & FALSE

# Negación	
!TRUE

# Condicionales
# Usamos el operador $ para acceder a una columna del dataframe
if(informacion_planetas$rotacion >= 365) {
  print("Días terrestres")
} else {
  print("No son días terrestres")
}

# Ciclos

num <- 0
while(num < 8) {
  print(informacion_planetas[,num])
  num <- num +1
}
