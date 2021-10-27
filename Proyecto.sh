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

opc=0
case $1 in
  -a )
  Menu_1
  read -p "Ingrese una opcion: " opc
  until [ $opc -eq 5 ]
  do
      case $opc in
          1)
              Menu_1
              ;;
          2)
              Menu_1
              ;;
          3)
              Menu_1
              ;;
          4)
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
              Menu_2
              ;;
          2)
              Menu_2
              ;;
          3)
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
