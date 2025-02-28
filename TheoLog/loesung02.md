## [2. Übungsblatt](https://web.archive.org/web/20241212082357/https://iccl.inf.tu-dresden.de/w/images/9/97/TheoLog24-Uebung02.pdf)

### Aufgabe C

> Zeigen Sie, dass $\{1\}^{*}$ unentscheidbare Teilmengen besitzt.

Die Potenzmenge einer abzählbar unendlichen Menge ist überabzählbar.

Cantors Diagonalargument:

  * $\mathcal{P}(A) = \left\{ S_1, S_2, S_3, \ldots \right\}$
  * $T = \left\{ a_i | a_i \in A, a \notin S_i \right\}$
  * $\Rightarrow T$ enthält $a_i$, aber $S_i$ nicht $\Rightarrow T \neq S_i$
      * $\Rightarrow T$ enthält $a_1$, aber $S_1$ nicht $\Rightarrow T \neq S_1$
      * $\Rightarrow T$ enthält $a_2$, aber $S_2$ nicht $\Rightarrow T \neq S_2$
      * $\ldots$
  * $\Rightarrow T \notin \mathcal{P}(A)$
  * $\Rightarrow \mathcal{P}(A)$ ist überabzählbar.

### Aufgabe D

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **d)** Die Ackermannfunktion ist total und damit LOOP-berechenbar.

siehe [3. Vorlesung, Seite 17ff](https://web.archive.org/web/20250222123745/https://iccl.inf.tu-dresden.de/w/images/1/19/TheoLog2024-Vorlesung-03-print.pdf#page=17)

### Aufgabe 2.1

> Zeigen Sie, dass folgende Funktionen $f : \mathbb{N}^2 \rightarrow \mathbb{N}$ LOOP-berechenbar sind: \
> **a)** $f(x, y) := \text{max}(x - y, 0)$

[While simulator](https://tools.iccl.inf.tu-dresden.de/while/)

```
result := x + 0
LOOP y DO
  result := result - 1
END
```

> Zeigen Sie, dass folgende Funktionen $f : \mathbb{N}^2 \rightarrow \mathbb{N}$ LOOP-berechenbar sind: \
> **b)** $f(x, y) := x \cdot y$

```
result := 0
LOOP x DO
  LOOP y DO
    result := result + 1
  END
END
```

> Zeigen Sie, dass folgende Funktionen $f : \mathbb{N}^2 \rightarrow \mathbb{N}$ LOOP-berechenbar sind: \
> **c)** $f(x, y) := \text{max}(x, y)$

[While simulator](https://tools.iccl.inf.tu-dresden.de/while/)

```
result := x
LOOP x DO
  y := y - 1
END
LOOP y DO
  result := result + 1
END
```

> Zeigen Sie, dass folgende Funktionen $f : \mathbb{N}^2 \rightarrow \mathbb{N}$ LOOP-berechenbar sind: \
> **d)** $f(x, y) := \text{ggT}(x, y)$

[While simulator](https://tools.iccl.inf.tu-dresden.de/while/),
[Euklidischer Algorithmus](https://de.wikipedia.org/wiki/Euklidischer_Algorithmus#Beschreibung_durch_Pseudocode)

(Beim Verwenden von `IF x != 0 THEN` scheint es einen Bug zu geben und das ganze Programm einfach nicht zu laufen.)

```
result := b
# <if a > 0>
nonzero := 0
LOOP a DO
  nonzero := 1
END
LOOP nonzero DO
# </if a > 0>
  LOOP b DO
    # <if b > 0>
    nonzero := 0
    LOOP b DO
      nonzero := 1
    END
    LOOP nonzero DO
    # </if b > 0>
      # now we are inside WHILE b != 0
      aminusb := a
      LOOP b DO
        aminusb := aminusb - 1
      END
      # <if aminusb > 0>
      nonzero := 0
      LOOP aminusb DO
        nonzero := 1
      END
      else := 1
      LOOP nonzero DO
      # </if aminusb > 0>
        # if a > b
        LOOP b DO
          a := a - 1
        END
        else := 0
      END
      LOOP else DO
        # if b <= a
        LOOP a DO
          b := b - 1
        END
      END
    END
  END
  result := a
END
```

### Aufgabe 2.3

> Zeigen Sie, dass es keine Many-One-Reduktion vom Halteproblem $P_\text{halt}$ von Turing-Maschinen auf das Leerheitsproblem \
> $P_\text{leer} := \{\text{enc}(M) | L(M) = \emptyset\}$ \
> von Turing-Maschinen gibt.

  * $P_\text{halt}$ ist semi-entscheidbar und unentscheidbar. Daraus folgt $P_\text{halt}$ ist nicht co-semi-entscheidbar. (Wäre $P_\text{halt}$ semi-entscheidbar und $\neg P_\text{halt}$ ebenfalls semi-entscheidbar (gleichbedeutend mit $P_\text{halt}$ ist co-semi-entscheidbar), wäre $P_\text{halt}$ entscheidbar.)
  * $P_\text{halt}$ ist *nicht co-semi-entscheidbar* und $P_\text{halt} \leq_m P_\text{leer}$ \
    $\Rightarrow$ $P_\text{leer}$ ist *nicht co-semi-entscheidbar* \
    $\Leftrightarrow$ $\neg P_\text{leer} := \{\text{enc}(M) | L(M) \neq \emptyset\}$ (das Komplement zu $P_\text{leer}$) ist nicht semi-entscheidbar
  * Um einen Widerspruch herbeizuführen, ist zu zeigen, dass $\neg P_\text{leer}$ semi-entscheidbar ist, bspw. mit einer Reduktion $\neg P_\text{leer} \leq_m P_\text{halt}$.

    [Wikipedia](https://en.wikipedia.org/wiki/Emptiness_problem) verweist auf [Introduction to Automata Theory, Languages, and Computation (3rd Edition)](https://web.archive.org/web/20250220163117/https://lecture-notes.tiu.edu.iq/wp-content/uploads/2022/02/Introduction-to-Automata-Theory-Languages-and-Computations-by-John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-z-lib.org_.pdf). In Kapitel [9.3.2 Turing Machines That Accept the Empty Language (Seite 410)](https://web.archive.org/web/20250220163117/https://lecture-notes.tiu.edu.iq/wp-content/uploads/2022/02/Introduction-to-Automata-Theory-Languages-and-Computations-by-John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-z-lib.org_.pdf#page=410) wird $P_\text{leer}$ als $L_e$ eingeführt und $L_{ne} = \neg P_\text{leer} = \{\text{enc}(M) | L(M) \neq \emptyset\}$.

    [Theorem 9.8](https://web.archive.org/web/20250220163117/https://lecture-notes.tiu.edu.iq/wp-content/uploads/2022/02/Introduction-to-Automata-Theory-Languages-and-Computations-by-John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-z-lib.org_.pdf#page=410) beweist, dass $\neg P_\text{leer}$ semi-entscheidbar ist ($L_u$ ist in [Kapitel 9.2.3 (Seite 403)](https://web.archive.org/web/20250220163117/https://lecture-notes.tiu.edu.iq/wp-content/uploads/2022/02/Introduction-to-Automata-Theory-Languages-and-Computations-by-John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-z-lib.org_.pdf#page=403) als die Sprache der Universellen Turing-Maschine definiert ($L_u = \{\text{enc}(M, w) | M$ ist eine Turing-Maschine, $w \in L(M)\}$).):

      * Konstruktion einer **nicht-deterministische** Turing-Maschine $M_\text{Orakel}$ mit der Eingabe $\text{enc}(M) \in \neg P_\text{leer}$
      * $M_\text{Orakel}$ nutzt seine nicht-deterministischen Fähigkeiten, um $w \in L(M)$ zu raten.
      * $w$ wird auf das Band geschrieben.
      * Halteproblem:
          * Die Turing-Maschine $M$ wird auf $w$ simuliert.
          * Akzeptiert $M$, so akzeptiert auch $M_\text{Orakel}$.

    Sollte $M$ also irgendeine Eingabe akzeptieren ($L(M) \neq \emptyset$), rät $M_\text{Orakel}$ diese und akzeptiert somit die Eingabe $\text{enc}(M)$.

    Damit ist $\neg P_\text{leer}$ semi-entscheidbar.

    **Widerspruch:** Es kann somit keine Many-One-Reduktion $P_\text{halt} \leq_m P_\text{leer}$ geben.

siehe auch:

  * ["Berechenbarkeit #33 - Epsilon-Halteproblem und Leerheitsproblem sind unentscheidbar" von @NLogSpace (ab 8min)](https://www.youtube.com/watch?v=vDy9H2B0Kpk&t=482)
  * ["Berechenbarkeit #36 - Semi-Entscheidbarkeit" von @NLogSpace](https://www.youtube.com/watch?v=f3cSzXHg584&t=999)

### Aufgabe 2.4

> Zeigen Sie, dass jede semi-entscheidbare Sprache $L$ auf das Halteproblem $P_\text{halt}$ many-one-reduziert werden kann.

Dazu muss eine totale turing-berechenbare Funktion $f : L \rightarrow P_\text{halt}$ gefunden werden. Da $L$ semi-entscheidbar ist existiert eine Turing-Maschine $M_L$, die alle Worte $w \in L$ akzeptiert und ewig läuft, wenn $w \notin L$.

Idee: $f(w)$ mit $w \in L$ konstruiert einer Turing-Maschine $M_w$, die zuerst das Band löscht, dann $w \in L$ auf das Band schreibt und anschließend das Halteproblem $\text{enc}(M_L, w) \in P_\text{halt}$ simultiert.

Wenn $M_L$ auf $w$ hält, hält auch $M_w$ und die Eingabe $w \in L$ wird akzeptiert. Ist $w \notin L$ läuft $M_L$ und damit auch $M_w$ ewig.
