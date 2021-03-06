#!/bin/bash

Arreglo=(SCRUM X.P Kanban Crystal)
Arreglo_1=(Cascada Espiral Modelo_V)

for Arreglo in ${Arreglo[@]} ; do
  touch $Arreglo.inf
done

for Arreglo_1 in ${Arreglo_1[@]} ; do
  touch $Arreglo_1.inf
done

Menu_1(){
    echo "Bienvenido a la guía rápida de Agile, para continuar seleccione un tema:"
    echo "1. SCRUM"
    echo "2. X.P."
    echo "3. Kanban"
    echo "4. Crystal"
    echo "5. Salir"
    echo
}

Menu_2(){
    echo "Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:"
    echo "1. Cascada"
    echo "2. Espiral"
    echo "3. Modelo V"
    echo "4. Salir"
    echo
}

Continuar(){
  opc1=0
  echo "Opciones:"
  echo "1. Volver al menu anterior"
  echo "2. Terminar la ejecucion"
    read -p "Ingrese una opcion: " opc1
  echo
  if [[ opc1 -eq 1 ]]; then
    Submenu $1
  else
    exit
  fi 
}

Continuar_1(){
  opc1=0
  echo "Opciones:"
  echo "1. Volver al menu anterior"
  echo "2. Terminar la ejecucion"
    read -p "Ingrese una opcion: " opc1
  echo
  if [[ opc1 -eq 1 ]]; then
    Menu_1
  else
    exit
  fi
}

Continuar_2(){
  opc1=0
  echo "Opciones:"
  echo "1. Volver al menu anterior"
  echo "2. Terminar la ejecucion"
    read -p "Ingrese una opcion: " opc1
  echo
  if [[ opc1 -eq 1 ]]; then
    Menu_2
  else
    exit
  fi
}

Submenu(){
  echo Usted esta en la sección $1 seleccione la opción que desea utilizar.
  echo "1. Agregar informacion"
  echo "2. Buscar"
  echo "3. Eliminar informacion"
  echo "4. Leer base de informacion"
  echo "5. Volver a menu anterior o salir"
  echo
  read -p "Ingrese una opcion: " opcion
      case $opcion in
          1)
              echo
              echo " - AGREGAR INFORMACION - "
              read -p "Ingrese el identificador del concepto: " identificador
              read -p "Ingrese la definicion del concepto: " definicion
              echo
              echo "[$identificador].- $definicion" >> "$1.inf"
              echo
              Continuar $1
              ;;
          2)
              echo
              echo " - BUSCAR INFORMACION - "
              read -p "Ingrese el identificador concepto a buscar: " buscar
              if [[ `grep "$buscar" -c "$1.inf"` -ge 1 ]]; then
                echo "Identificador se encontro"
                grep $buscar "$1.inf"
                echo
              else
                echo "Identificador no se encontro"
                echo
              fi
              Continuar $1
              ;;
          3)
              echo
              echo " - ELIMINAR INFORMACION - "
              read -p "Ingrese el identificador concepto a eliminar: " eliminar
              if [[ `grep "$eliminar" -c "$1.inf"` -ge 1 ]]; then
                aux=$(grep -n -m 1 $eliminar $1.inf | sed  's/\([0-9]*\).*/\1/')
                ed -s $1.inf <<!; $aux d; w
!
                echo "Identificador eliminado"
                echo
              else
                echo "Identificador no se encontro"
                echo
              fi
              Continuar $1
              ;;
          4)
              echo
              echo " - LEER INFORMACION - "
              if [[ -s "$1.inf" ]]; then
                cat "$1.inf"
                echo
              else
                echo "Informacion no encontrada"
                echo
              fi
              Continuar $1
              ;;
          5)
              echo
              Continuar_1
              ;;
          *)
              Submenu
              ;;
      esac
}


Submenu_1(){
  echo Usted esta en la sección $1 seleccione la opción que desea utilizar.
  echo "1. Agregar informacion"
  echo "2. Buscar"
  echo "3. Eliminar informacion"
  echo "4. Leer base de informacion"
  echo "5. Volver a menu anterior o salir"
  echo
  read -p "Ingrese una opcion: " opcion
      case $opcion in
          1)
              echo
              echo " - AGREGAR INFORMACION - "
              read -p "Ingrese el identificador del concepto: " identificador
              read -p "Ingrese la definicion del concepto: " definicion
              echo
              echo "[$identificador].- $definicion" >> "$1.inf"
              echo
              Continuar $1
              ;;
          2)
              echo
              echo " - BUSCAR INFORMACION - "
              read -p "Ingrese el identificador concepto a buscar: " buscar
              if [[ `grep "$buscar" -c "$1.inf"` -ge 1 ]]; then
                echo "Identificador se encontro"
                grep $buscar "$1.inf"
                echo
              else
                echo "Identificador no se encontro"
                echo
              fi
              Continuar $1
              ;;
          3)
              echo
              echo " - ELIMINAR INFORMACION - "
              read -p "Ingrese el identificador concepto a eliminar: " eliminar
              if [[ `grep "$eliminar" -c "$1.inf"` -ge 1 ]]; then
                aux=$(grep -n -m 1 $eliminar $1.inf | sed  's/\([0-9]*\).*/\1/')
                ed -s $1.inf <<!; $aux d; w
!
                echo "Identificador eliminado"
                echo
              else
                echo "Identificador no se encontro"
                echo
              fi
              Continuar $1
              ;;
          4)
              echo
              echo " - LEER INFORMACION - "
              if [[ -s "$1.inf" ]]; then
                cat "$1.inf"
                echo
              else
                echo "Informacion no encontrada"
                echo
              fi
              Continuar $1
              ;;
          5)
              echo
              Continuar_2
              ;;
          *)
              Submenu
              ;;
      esac
}

opc=0
case $1 in
  -a )
  Menu_1
  read -p "Ingrese una opcion: " opc
  until [ $opc -eq 5 ]
  do
      case $opc in
          1)
              Submenu SCRUM
              Menu_1
              ;;
          2)
              Submenu X.P
              Menu_1
              ;;
          3)
              Submenu Kanban
              Menu_1
              ;;
          4)
              Submenu Crystal
              Menu_1
              ;;
      esac
      read opc
  done
    ;;

  -t )

  Menu_2
  read -p "Ingrese una opcion: " opc
  until [ $opc -eq 4 ]
  do
      case $opc in
          1)
              Submenu_1 Cascada
              Menu_2
              ;;
          2)  
              Submenu_1 Espiral
              Menu_2
              ;;
          3)
              Submenu_1 Modelo_V
              Menu_2
              ;;
      esac
      read opc
  done
    ;;
  *)
  echo "- OPCION NO EXISTE -"
    ;;
esac
