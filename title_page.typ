#set page(
  paper: "a4",
  margin: (left: 12mm, right: 12mm, top: 10mm, bottom: 10mm),
)

#set text(
  font: "Liberation Serif",
  size: 10pt,
)

#set par(leading: 0.65em)

#let line = "........................................................................"
#let short-line = "........................"

#let cell(content, colspan: 1, rowspan: 1, align: left, fill: none) = table.cell(
  colspan: colspan,
  rowspan: rowspan,
  align: align,
  fill: fill,
  inset: (x: 7pt, y:9pt),
)[#content]

#align(center + horizon)[
#table(
  columns: (1.65fr, 0.8fr, 1.15fr),
  stroke: 0.5pt,
  inset: 4pt,
  align: center,

  // Nagłówek
  cell([*Politechnika Gdańska*]),
  cell([*Wydział ETI*]),
  cell([*KSA - KSDiR*]),

  cell([*TECHNIKA CYFROWA. LABORATORIUM.*], colspan: 3),

  cell([*#text(size: 12pt)[CYKL ĆWICZEŃ GRUPOWYCH]*]),
  cell([ĆWICZENIE NR 3], colspan: 2),

  cell([Tytuł ćwiczenia: Układy iteracyjne], colspan: 3),

  // Skład grupy
  cell([Skład grupy ćwiczeniowej:], colspan: 2),
  cell([Rok studiów: 2], align: left),

  cell([
    #set text(size: 11pt)
    1. Marcin Brzozowski
    #align(center)[#text(size: 8pt, weight: "bold")[imię i nazwisko]]
  ]),
  cell([
    #set text(size: 10pt)
    #align(center)[210915]
    #align(center)[#text(size: 8pt, weight: "bold")[nr indeksu]]
  ]),
  cell([
    Semestr: 3
    #v(3pt)
    Grupa dziek.: 1A
  ], align: left),

  cell([
    #set text(size: 11pt)
    2. Dawid Filoda
    #align(center)[#text(size: 8pt, weight: "bold")[imię i nazwisko]]
  ]),
  cell([
    #align(center)[211421]
    #align(center)[#text(size: 8pt, weight: "bold")[nr indeksu]]
  ]),
  cell([
    #align(center)[Specjalność:]
    #align(center)[Informatyka]
  ]),

  // Sprawdzenie przewodów
  cell([
    #align(center)[sprawdzenie stanu przewodów z wtyczkami bananowymi:]
    #v(3pt)
    - przewody koloru ....................................  - sztuk: .........
    #v(2pt)
    - przewody koloru ....................................  - sztuk: .........
  ], colspan: 3),


  // Potwierdzenie wykonania zadań
  cell([
    #align(center)[*POTWIERDZENIA WYKONANIA ZADAŃ*]
    #v(4pt)
    1. zadanie 1: Projekt 5
    #v(7pt)
    2. zadanie 2: Projekt 15 
    #v(5pt)
  ], colspan: 2, rowspan: 2),

  cell([
    #align(center)[*DATA WYKONANIA*]
    #align(center)[*ĆWICZENIA:*]
    #v(12pt)
    #align(center)[15.11.2026 r.]
  ]),

  cell([
    #align(center)[*OCENA:*]
    #v(22pt)
    #align(center)[#short-line]
  ]),
)]
