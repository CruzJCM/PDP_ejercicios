module Library where
import PdePreludat

----------------------------------{-Modulo 1-}-------------------------------------

doble :: Number -> Number
doble numero = numero + numero

esMultiploDeTres :: Number -> Bool
esMultiploDeTres numero = mod numero 3 == 0

esMultiploDe :: Number -> Number -> Bool
esMultiploDe divisor dividendo = mod dividendo divisor == 0

cubo :: Number -> Number
cubo numero = numero * numero * numero

area :: Number -> Number -> Number
area base altura = base * altura

esBisiesto :: Number -> Bool
esBisiesto anio
    |esMultiploDe 400 anio = True
    |esMultiploDe 4 anio && not(esMultiploDe 100 anio) = True
    |otherwise = False

celsiusToFahr :: Number -> Number
celsiusToFahr celsius = celsius* 9/5 + 32

fahrToCelsius :: Number -> Number
fahrToCelsius fahr = (fahr - 32) * 5/9

haceFrioF :: Number -> Bool
haceFrioF fahr = fahrToCelsius fahr < 8

mcm :: Number -> Number -> Number
mcm a b = (a*b)/gcd a b

dispersion :: Number -> Number -> Number -> Number
dispersion num1 num2 num3 = maximum [num1, num2, num3] - minimum [num1, num2, num3]

diasParejos :: Number -> Number -> Number -> Bool
diasParejos num1 num2 num3 = dispersion num1 num2 num3 < 30

diasLocos :: Number -> Number -> Number -> Bool
diasLocos num1 num2 num3 = dispersion num1 num2 num3 > 100

diasNormales :: Number -> Number -> Number -> Bool
diasNormales num1 num2 num3 = not(diasParejos num1 num2 num3) && not(diasLocos num1 num2 num3)

pesoPino :: Number -> Number
pesoPino altura
    | altura<=300 = altura*3
    | otherwise = 900 + (altura-300)*2

esPesoUtil :: Number -> Bool
esPesoUtil peso = peso >= 400 && peso <= 1000

sirvePino = esPesoUtil.pesoPino

----------------------------------{-Modulo 2-}-------------------------------------

siguiente :: Number -> Number
siguiente = (1+)

mitad :: Number -> Number
mitad = (/2)

inversa :: Number -> Number
inversa = (1/)

triple :: Number -> Number
triple = (*3)

esNumeroPositivo :: Number -> Bool
esNumeroPositivo = (>0)

esMultiploDe2 :: Number -> Bool
esMultiploDe2 = esMultiploDe 2

esBisiesto2 :: Number -> Bool
esBisiesto2 anio = esMultiploDe 400 anio || (esMultiploDe 4 anio && not(esMultiploDe 100 anio))

inversaRaizCuadrada :: Number -> Number
inversaRaizCuadrada = inversa.sqrt

incremento :: Number -> Number -> Number
incremento unNumero unNumeroAlCuadrado = unNumero + unNumeroAlCuadrado 

incrementMCuadradoN :: Number -> Number -> Number
incrementMCuadradoN = incremento . (^2)

potencia :: Number -> Number -> Number
potencia numero1 numero2 = numero1 ^ numero2

esResultadoPar :: Number -> Number -> Bool
esResultadoPar numero1 numero2 = even (potencia numero1 numero2)