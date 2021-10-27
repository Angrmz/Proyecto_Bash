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
