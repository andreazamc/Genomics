# Escribe un código que imprima un número y su cuadrado a lo largo de un rango de valores


#Tambien que imprima la suma de todos los cuadrados de dicho rango 

# Define el valor minimo y el valor maximo

lower=1
upper=5

# Crea una variable que se llame squaresum y que tenga al inicio cero

squaresum = 0

# Haz un loop a lo largo del rango y por cada valor:
     # Imprime el valor y valor^2
     # Adiciona el valor^2 a la linea de la variable squaresum
for (ii in lower:upper) 
  {
  cat (ii, ii^2, "\n" )
  squaresum = squaresum + ii^2
}

cat("the sum of it all is",squaresum) 
# Una vez que terminado el loop imprime la variable suquaresum

