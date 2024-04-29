module Library where
import PdePreludat
import GHC.Num (Num)

{-
    Simples -> No se puede descomponer

    LISTAS
    Una lista es recursiva porque se puede definir como un elemento (la cabeza) seguido por varias listas y terminando con una lista vacia
    un string es una lista de caracteres "Hola"= ['H', 'o', 'l', 'a']
    
    Utilidades
        [1..10] = [1,2,3,4,5,6,7,8,9,10]
        [1, 3..16] = [1,3,5,7,9,11,13,15] 16 es el tope, la cota superior pero no pertenece
        [1..] = "infinito"
        head -> da la cabeza   tail -> da la cola
        length -> Devuelve la longitud de una lista
        sum -> Suma los elementos de una lista de números
        (++) -> Concatena dos listas. Concatena en el orden que des.
        take -> Toma los primeros n elementos de la lista
        drop -> Devuelve la lista sin los primeros n elementos
        (!!) -> Devuelve el elemento que está en la posición n (donde 0 es el primer elemento)  -> [] !! n
        reverse -> Devuelve una lista con los elementos en orden inverso
        composicion de funciones:ej (sum.take n) []

    Pattern Matching
    []
    (x:xs) o (x:y:ys)
    [x] o [x, y]

        head (x:xs) =x o head (x:_)=x
        tail (x:xs) =xs o tail (_:xs)=x

    DATA

    data Persona = Persona String Int  
    Data se puede hacer asi o darle una estructura como el ejemplo de abajo, esto nos evita luego tener que definir funciones para obtener info
    Esto se lee como: “el tipo de dato Persona (en azul) utiliza un constructor –de nombre Persona, en rojo- que recibe un String y un Int”.
    nombre (Persona _nombre _edad) = _nombre
    edad (Persona _nombre _edad) = _edad

-} 

{-
data Persona = Persona {
   nombre :: String,
   edad :: Number,
   domicilio :: String,
   telefono :: String,
   fechaNacimiento :: (Number,Number, Number),
   buenaPersona :: Bool,
   plata :: Number
} deriving (Show)

juan = Persona {
    nombre = "Juan",
    telefono = "45232598",
    domicilio = "Ayacucho 554",
    fechaNacimiento = (17,7,1988),
    buenaPersona = True,
    edad = 29,
    plata = 30.0
    data Persona = Persona String Number
    juana :: Persona
    juana = Persona "Juan" 30

    edad :: Persona -> Number
    edad (Persona _ edad)= edad 

    data Color = Rojo | Ama |Azul
    recargoPorColor :: Color -> Number
    recargoPorColor Rojo = 50
    recargoPorColor _ = 20

    data Vehiculo = Auto Number | Moto Bool
    vehiculos :: [Vehiculo]
    vehiculos= [Auto 2006, Auto 1, Moto True]

}
-}

------ Practica

data Alumno = Alumno {
    nombre :: String,
    fechaNacimiento :: (Number, Number, Number),
    legajo :: Number,
    materiasQueCursa :: [String],
    criterioDeEstudio :: CriterioDeEstudio --number es una poronga en este caso
}

data Parcial = Parcial {
    nombreMateria :: String,
    cantDePreguntas :: Number
}

type CriterioDeEstudio = Parcial -> Bool

estudioso :: CriterioDeEstudio
estudioso _ = True

hijodelrigor :: Number -> CriterioDeEstudio
hijodelrigor cantminima parcial = ((> cantminima).cantDePreguntas) parcial

cabulero ::CriterioDeEstudio
cabulero = (even.length.nombreMateria) 

estudiaPara ::Parcial ->Alumno -> Bool
estudiaPara parcial alumno  = (criterioDeEstudio alumno) parcial



nicolas = Alumno {
    nombre = "Nico",
    fechaNacimiento = (10,10,2001),
    legajo= 1111111,
    materiasQueCursa = ["Pdep"],
    criterioDeEstudio= estudioso
}

cambiarCriterio :: Alumno -> CriterioDeEstudio ->Alumno
cambiarCriterio alumno nuevocriterio = Alumno {
    criterioDeEstudio = nuevocriterio
}