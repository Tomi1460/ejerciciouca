valor1 = float(input("Ingresa el primer valor: "))
valor2 = float(input("Ingresa el segundo valor: "))


if valor1 > valor2:
    print(f"El mayor valor es: {valor1}")
elif valor2 > valor1:
    print(f"El mayor valor es: {valor2}")
else:
    print("Ambos valores son iguales.")
