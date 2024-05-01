{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
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

sirvePino :: Number -> Bool
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

----------------------------------{-Modulo 3-}-------------------------------------

fst3 :: (a, b, c) -> a
fst3 (valor_a, valor_b, valor_c) = valor_a

snd3 :: (a, b, c) -> b
snd3 (valor_a, valor_b, valor_c) = valor_b

trd3 :: (a, b, c) -> c
trd3 (valor_a, valor_b, valor_c) = valor_c

aplicar :: (a->b,a->c) -> a -> (b,c)
aplicar (f, g) numero = (f numero, g numero)

cuentaBizarra :: (Number,Number) -> Number
cuentaBizarra (a,b) | a > b = a + b
                    | b > a + 10 = b - a 
                    | otherwise = a * b


esNotaBochazo :: Number -> Bool
esNotaBochazo numero = numero < 6

aprobo :: (Number,Number) -> Bool
aprobo (nota1, nota2) = (not.esNotaBochazo) nota1 && (not.esNotaBochazo) nota2

promociono :: (Number,Number) -> Bool
promociono (nota1, nota2) = (nota1 + nota2) >= 15 && nota1 >= 7 && nota2 >= 7 

{-
> (not.esNotaBochazo.fst) (5,8)
False
> (not.esNotaBochazo.snd) (5,8)
True
-}

notasFinales :: ((Number,Number),(Number,Number)) -> (Number,Number)
notasFinales ((a,b),(c,d)) = (max a c , max b d) 

{-
> (not.aprobo.notasFinales) ((2,7),(6,-1))
False
-}

{-
> (esNotaBochazo.fst.fst) ((2,7),(6,-1))    
True
-}

fueARecuperar :: (Number,Number) -> Bool
fueARecuperar (a,b) = a /= -1 || b /= -1

recuperoDeGusto :: ((Number,Number),(Number,Number)) -> Bool
recuperoDeGusto ((a,b),(c,d)) = promociono (a,b) && fueARecuperar (c,d)


esMayorDeEdad :: (String,Number) -> Bool
esMayorDeEdad = (> 21) . snd

duplicarPar :: Number -> Number
duplicarPar a = if even a then a*2 else a 

sumarImpar :: Number -> Number
sumarImpar b = if odd b then b+1  else b

calcular :: (Number,Number) -> (Number,Number)
calcular (a,b)= (duplicarPar a, sumarImpar b)

----------------------------------{-Modulo 4-}-------------------------------------

sumaLista :: [Number] -> Number
sumaLista [] = 0
sumaLista (x:xs) = x + sumaLista xs

frecuenciaCardiaca :: [Number]
frecuenciaCardiaca = [80, 100, 120, 128, 130, 123, 125]

promedioFrecuenciaCardiaca :: Number
promedioFrecuenciaCardiaca = sumaLista frecuenciaCardiaca / length frecuenciaCardiaca

frecuenciaCardiacaMinuto :: Number -> Number
frecuenciaCardiacaMinuto minuto = frecuenciaCardiaca !! (minuto/10)

frecuenciasHastaMomento :: Number -> [Number]
frecuenciasHastaMomento minuto = take (minuto/10+1) frecuenciaCardiaca


concatenarLista :: [String] -> String
concatenarLista [] = ""
concatenarLista (x:xs) = x ++ concatenarLista xs

esCapicua :: [String] -> Bool
esCapicua listaString = concatenarLista listaString == (reverse.concatenarLista) listaString


duracionLlamadas = (("horarioReducido",[20,10,25,15]),("horarioNormal",[10,5,8,2,9,10]))

sumarNumerosDeLista :: [Number] -> Number
sumarNumerosDeLista [] = 0
sumarNumerosDeLista (x:xs) = x + sumarNumerosDeLista xs

cuandoHabloMasMinutos :: String
cuandoHabloMasMinutos | (sumarNumerosDeLista.snd.fst) duracionLlamadas > (sumarNumerosDeLista.snd.snd) duracionLlamadas = (fst.fst) duracionLlamadas
                      | otherwise = (fst.snd) duracionLlamadas


