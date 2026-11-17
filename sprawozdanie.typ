#import "@preview/finite:0.5.1": automaton, transition-table
#import "@preview/k-mapper:1.4.0": *

#include "title_page.typ"

= Ćwiczenie 3.6
Zaprojektować iteracyjny komparator dwóch liczb 8-bitowych porównujący w kierunku od bitów młodszych do starszych.

#let IO_section = [
  == Oznaczenia
  #align(center, [
    === Wejścia układu: 
    $x_1, x_2, q_1, q_2$ \
    === Wyjścia układu: 
    $q'_1 q'_2$
  ])
  === Legenda
 - $x_1$ - n-ty bit pierwszej liczby
 - $x_2$ - n-ty bit drugiej liczby
 - $q_(1,2)$ - bity stanu z poprzedniego bloku
 - $q'_(1,2)$ - bity stanu aktualnego bloku
]

#let state_graph = [
    == Graf układu

    #align(center, [

      #automaton(
        (
          R: (R: "00,11", M: "01", W: "10"),
          W: (W: "00, 11, 10", M: "01"),
          M: (M: "00, 01, 11", W: "10"),
        ),
        initial: (),
        final: (),
        style: (
          traansition: (curve: 0),
          R-W: (anchor: bottom + left, transition: (curve: 0)),
          R-M: (anchor: bottom + right),
          W-M: (anchor: right, transition: (curve: 0)),
          M-W: (anchor: left),
          R-R: (anchor: bottom),
          W-W: (anchor: bottom),
          M-M: (anchor: bottom),
        ),
      )
    ])
  ]

#let state_coding_section = [
    == Kodowanie stanów
    #align(center, [

      #table(
        columns: (auto, auto, auto),
        inset: 5pt,
        $ R $, "Bity są równe", $ 00 $,
        $ M $, "Liczba pierwsza jest mniejsza", $ 01 $,
        $ W $, "Liczba pierwsza jest większa", $ 10 $,
      )
    ])
    == Tabela przejść między stanami
    #align(center, [
      #table(
        columns: 5,
        align: center,

        table.cell(rowspan: 1)[Stan obecny],
        table.cell(colspan: 4)[Stan następny],
        table.cell(rowspan: 1)[Wyjście],
        [00], [01], [10], [11],

        [R], [R], [M], [W], [R],
        [M], [M], [W], [W], [M],
        [W], [W], [M], [W], [W],
      )
    ])

    == Zakodowana tabela przejść
    #align(left, [

      #table(
        columns: 5,
        align: center,
        inset: 8pt,
        stroke: (x, y) => {
          if x == 0 or y == 0 { none } else { 1pt }
        },

        [$q_1 q_2 \\ x_1 x_2$], [00], [01], [11], [10],
        [00], [00], [01], [00], [10],
        [01], [01], [01], [01], [10],
        [11], [\-\-], [\-\-], [\-\-], [\-\-],
        [10], [10], [01], [10], [10],
      )])

  #align(left, [
    Na rzeczywistym układzie w stanie nieokreślonym należy podać $q'_1 q'_2$ jako 00.
  ])
]

#let truth_tables_section = [
== Tablice prawdy
    #grid(
      columns: (1fr, 1fr),
      align: center,
      table(
        columns: 6,
        stroke: none,
        table.vline(
          x: 5,
        ),
        [], [$x_1$], [$x_2$], [$q_1$], [$q_2$], [$q'_1$],
        [$I_2$], [1], [0], [0], [0], [1],
        [$I_6$], [1], [0], [0], [1], [1],
        [$I_8$], [0], [0], [1], [0], [1],
        [$I_10$], [1], [0], [0], [1], [1],
        [$I_11$], [1], [1], [1], [0], [1],
      ),
      table(
        columns: 6,
        stroke: none,
        table.vline(
          x: 5,
        ),
        [], [$x_1$], [$x_2$], [$q_1$], [$q_2$], [$q'_2$],
        [$I_1$], [0], [1], [0], [0], [1],
        [$I_4$], [0], [0], [0], [1], [1],
        [$I_5$], [0], [1], [0], [1], [1],
        [$I_7$], [1], [1], [0], [1], [1],
        [$I_9$], [0], [1], [1], [0], [1],
      ),
    )
]

#grid(
  columns: (1fr, 1fr),
  inset: 15pt,
  grid.cell(colspan:1, IO_section),
  grid.cell(colspan: 1, state_graph),
  grid.cell(colspan:1, state_coding_section),
  grid.cell(colspan: 1, truth_tables_section),
)

== Wynik
Wynikiem działania komparatora jest stan zwrócony przez ostatni blok w naszym układzie iteracyjnym

== Schemat ideowy
#show link: it => underline(text(fill: blue)[#it])
#figure(
  image("circuit-1.svg", width: 100%),
  caption: [#link(
    "https://www.falstad.com/s.py?s=TRlrix",
    [Schemat w programie Falstad],
  )],
)

#pagebreak()
= Ćw 15
Zaprojektować jako układ iteracyjny 8-bitowy konwerter kodu Gray'a na kod binarny, przy czym na wejście każdego bloku podawany jest tylko jeden bit liczby wejściowej.
#grid(columns: (1fr,1fr),inset:15pt, align:center,
    [
    == Wejścia układu
    $ g, b $
  ],
  [
    == Wyjścia układu
    $ b', y $
  ],
  grid.cell(colspan:2, align:left, [
    - $g$ - n-ty bit liczby podanej w kodzie Gray'a;
    - $b$ - poprzedni bit liczby w postaci binarnej
    - $b', y$ - bit liczby skonwertowany do postaci binarnej, wyjścia zwarte
  ]),
  [
  == Tabela wejść/wyjść
  #table(
        columns: 3,
        align: center,
        inset: 8pt,
        stroke: (x, y) => {
          // Return none for outer boundaries
          if x == 0 or y == 0 { none } else { 1pt } // Internal lines
        },

        [$g \\ b$], [0] , [1],
        [0], [0], [1],
        [1], [1], [0],

    )
],
  [
  == Tablica prawdy
    #table(
        columns: 4,
        stroke: none,
        table.vline(
          x: 3,
        ),
        [], [$g$], [$b$], [$b'$],
        [$I_1$], [0], [1], [1],
        [$I_2$], [1], [0], [1],
      )
]

)

== Wynik
Liczba w postaci binarnej przedstawiona jako sekwencja wyjść y kolejnych układów, tj. $y_1 y_2 ... y_7 y_8$

#figure(
  image("circuit-2.svg", width: 55%),
  caption: [#link(
    "https://www.falstad.com/s.py?s=78nAxO",
    [Schemat w programie Falstad],
  )],
)


