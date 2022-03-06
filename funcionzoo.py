
from multiprocessing import connection
from sqlite3 import SQLITE_UPDATE, Cursor
import sys
import MySQLdb

def conectar(host,user,passwr,namedb):
    try:
        db = MySQLdb.connect(host,user,passwr,namedb)
        return db
    except MySQLdb.Error as a:
        print("\n·No se ha podido conectar con la base de datos:",a)
        sys.exit(1)

def desconectar(db):
    db.close()


def listar_cantanimal(db):
    sql="select * from animales"
    cursor=db.cursor(MySQLdb.cursors.DictCursor)
    try:
        cursor.execute(sql)
        registros=cursor.fetchall()
        for elem in registros:
            print("\n\n-Especie:", elem["Especie"], "\n·Cantidad: ",elem["Cantidad"])
    except:
        print("-x- Error -x-")

def listar_animalinfo(db,cadena):
    sql="select * from animales where Especie regexp '^[%s]'" %cadena
    cursor=db.cursor(MySQLdb.cursors.DictCursor)
    try:
        cursor.execute(sql)
        if cursor.rowcount == 0:
            print("\n- No hay animales que empiecen por esa cadena -")
        else:
            registros=cursor.fetchall()
            for elem in registros:
                print("\n\n-ID: ", elem["ID"], "\n-Especie: ", elem["Especie"], "\n-Grupo animal: ", elem["GrupoAnimal"], "\n-Cantidad: ", elem["Cantidad"])
    except:
        print("-x- ERROR -x-")

def listar_exhibicion(db,cadena):
    sql="select * from exhibicion where Nombre='%s'" %cadena
    cursor=db.cursor(MySQLdb.cursors.DictCursor)
    try:
        cursor.execute(sql)
        if cursor.rowcount == 0:
            print("\n- No hay exhibiciones con ese nombre -")
        else:
            registros=cursor.fetchall()
            for elem in registros:
                print("\n· Exhibicion: ", elem["Nombre"])
                sqlanimal="select Especie from animales where ID='%s'" %elem["AnimalID"]
                sqlempleado="select Nombre from empleados where DNI='%s'" %elem["EmpleadoDNI"]
                cursoranimal=db.cursor(MySQLdb.cursors.DictCursor)
                cursoranimal.execute(sqlanimal)
                cursorempleado=db.cursor(MySQLdb.cursors.DictCursor)
                cursorempleado.execute(sqlempleado)
                registroanimal=cursoranimal.fetchall()
                for elem in registroanimal:
                    print("\n- Animal: ", elem["Especie"])
                
                registroempleado=cursorempleado.fetchall()
                for elem in registroempleado:
                    print("- Nombre del empleado: ", elem["Nombre"])


    except:
        print("-x- ERROR -x-")


def insertar_animal(db,codigo,especie,grupoanimal,cantidad):
    cursor=db.cursor()
    sql="insert into animales values ('%s','%s','%s',%d)" %(codigo,especie,grupoanimal,cantidad)
    try:
        cursor.execute(sql)
        db.commit()
    except:
        print("-x- Error -x-")
        db.rollback()

def eliminar_exhibicion(db,name):
    sql="delete from exhibicion where Nombre='%s'" %name
    cursor=db.cursor()
    confirmar=input("¿Seguro que quieres borrar '%s'?(s/n)" %name)
    if confirmar == "s":
        try:
            cursor.execute(sql)
            db.commit()
            if cursor.rowcount==0:
                print("- No existen exhibiciones con ese nombre -")
        except :
            print("-x- ERROR -x-")
            db.rollback()


def actualizar_prec(db,descuento):
    sql="update exhibicion set Precio = Precio-(Precio*%f/100)" %descuento
    cursor=db.cursor()
    try:
        cursor.execute(sql)
        db.commit()
        print("\n- Se ha actualizado correctamente -")
    except Exception as e:
        print("\n-x- ERROR -x-", e)