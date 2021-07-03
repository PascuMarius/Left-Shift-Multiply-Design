# Left-Shift-Multiply-Design

## Simbol circuit
![Symbol](https://i.imgur.com/Dsf7hga.png?1)

## Descrierea porturilor
![ports](https://i.imgur.com/rk27ik9.png?1)

## Descrierea algoritmului de inmultire cu deplasare stanga
###### - reseteaza P (2*n biti)
###### - incarca deinmultitul in A (n biti)
###### - incarca inmultitorul in B (n biti)
###### - repeta de n ori
###### - deplaseaza cu o pozitie stanga P (LSB P = 0)
###### - daca MSB A = 1 atunci
###### - P <= P + B
###### - deplaseaza cu o pozitie stanga A (LSB A = X)
###### - P contine produs

## Structura de nivel inalt
![high](https://i.imgur.com/rh7JoUG.png?1)

## Calea de date
![date](https://i.imgur.com/6S2wyC7.png?1)

## Calea de control
![date](https://i.imgur.com/fGcVe28.png?1)

## Core cu pad-uri
![date](https://i.imgur.com/XqD2F47.png?1)
