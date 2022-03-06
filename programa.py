from funcionzoo import *

db=conectar("localhost","zooemp","asdasd","zoologico")

print('''1. Mostrar la cantidad total de cada especie.
2. Mostrar la informacion de los animales que empiecen por una subcadena
3. Mostrar el animal y el empleado que participa en una exhibición
4. Insertar nuevos animales
5. Eliminar una exhibición
6. Realizar un descuento a las exhibiciones''')

opcion=int(input("\n·Introduce una opción: "))

if opcion == 1:
    listar_cantanimal(db)

#-------------------------------------------------------------------------------------------------

if opcion == 2:
    nombre=input("\nIntroduce una cadena: ")
    listar_animalinfo(db,nombre)

#-------------------------------------------------------------------------------------------------

if opcion == 3:
    nombre=input("\nIntroduce el nombre de una exhibicion: ")
    listar_exhibicion(db,nombre)

#-------------------------------------------------------------------------------------------------

if opcion == 4:
    codigoanimal=input('\n·Introduce el código del animal: ')
    especieanimal=input('·Introduce la especie del animal:')
    grupoanimal= input('·Introduce el grupo del animal: ')
    cantidadanimal= int(input('·Introduce la cantidad de animales: '))
    insertar_animal(db,codigoanimal,especieanimal,grupoanimal,cantidadanimal)

#-------------------------------------------------------------------------------------------------

if opcion == 5:
    exhibicion_erase=input("\n·Introduce la exhibición a eliminar: ")
    eliminar_exhibicion(db,exhibicion_erase)

#-------------------------------------------------------------------------------------------------

if opcion == 6:
    descuento=float(input("\n·Introduce un descuento: "))
    actualizar_prec(db,descuento)

#-------------------------------------------------------------------------------------------------