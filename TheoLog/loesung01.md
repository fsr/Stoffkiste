## [1. Übungsblatt](https://web.archive.org/web/20241212082357/https://iccl.inf.tu-dresden.de/w/images/f/fb/TheoLog24-Uebung01.pdf)

### Aufgabe B

> Zeigen Sie: Wenn es möglich ist, für zwei beliebige Turing-Maschinen zu entscheiden, ob sie dieselbe Sprache akzeptieren, so ist es auch möglich, für beliebige Turing-Maschinen zu entscheiden, ob sie die leere Sprache akzeptieren.

gesucht: Erkennt die Turing-Maschine $M$ die leere Sprache $L(M) = \emptyset$?

  * Konstruktion einer Turing-Maschine $M_\emptyset$, die für jedes Wort $w$ ablehnt $\Rightarrow L(M_\emptyset) = \emptyset$
  * Entscheide, ob $M$ und $M_\emptyset$ die gleiche Sprache erkennen:
      * $M$ und $M_\emptyset$ erkennen die gleiche Sprache $\Rightarrow L(M) = \emptyset$
      * $M$ und $M_\emptyset$ erkennen **nicht** die gleiche Sprache $\Rightarrow L(M) \neq \emptyset$

### Aufgabe 1.1

> Zeigen Sie folgende Aussagen: \
> **c)** $\left|\mathbb{R}\right| \neq \left|\mathbb{N}\right|$

siehe [Cantors zweites Diagonalargument](https://de.wikipedia.org/wiki/Cantors_zweites_Diagonalargument)

> Zeigen Sie folgende Aussagen: \
> **d)** für jede nicht-leere endliche Menge $\Sigma$ ist $\Sigma^{*}$ abzählbar unendlich.

**besser** $f : \mathbb{N} \rightarrow \Sigma^{*}$:

  * $\Sigma = \left\{ a_1, a_2, \ldots, a_n \right\}$, $w \in \Sigma^{*}$
  * $\left| w \right| = 0$
      * $1 \mapsto w = \varepsilon$

    ($\left| \ldots \right| = n^0 = 1$)
  * $\left| w \right| = 1$ (falls $\left| a_1 \right| = \left| a_2 \right| = \ldots = \left| a_n \right| = 1$)
      * $2 \mapsto w = a_1$
      * $3 \mapsto w = a_2$
      * $\ldots$
      * $n + 1 \mapsto w = a_n$

    ($\left| \ldots \right| = n$)
  * $\left| w \right| = 2$ (falls $\left| a_1 \right| = \left| a_2 \right| = \ldots = \left| a_n \right| = 1$)
      * $n + 2 \mapsto w = a_1 a_1$
      * $n + 3 \mapsto w = a_2 a_1$
      * $\ldots$
      * $2n + 1 \mapsto w = a_n a_1$
      * $2n + 2 \mapsto w = a_1 a_2$
      * $2n + 3 \mapsto w = a_1 a_2$
      * $\ldots$
      * $3n + 1 \mapsto w = a_n a_2$
      * $3n + 2 \mapsto w = a_1 a_3$
      * $\ldots$
      * $(n + 1) n + 1 \mapsto w = a_n a_n$

    ($\left| \ldots \right| = n^2$)
  * $\ldots$

**wahrscheinlich falsch:**

 1. $\Sigma^{*} = \{\varepsilon\} \cup \Sigma \cup \Sigma^2 \cup \ldots$
 2. $\left|\Sigma\right| = \left|\mathbb{N}\right|$
 3. $\left|\Sigma^{*}\right| = 1 + \left|\mathbb{N}\right| + \left|\mathbb{N} \times \mathbb{N}\right| + \left|\mathbb{N} \times \mathbb{N} \times \ldots\right| + \ldots$
 4. $\left|\mathbb{N} \times \mathbb{N}\right| = \left|\mathbb{N}\right|$ \
    $\Rightarrow \left|\mathbb{N} \times \mathbb{N} \times \mathbb{N}\right| = \left|\mathbb{N}\right|$ \
    $\Rightarrow \ldots$
 5. $\left|\mathbb{N}\right| + \left|\mathbb{N}\right| = \left|\mathbb{N}\right|$
 6. $\left|\Sigma^{*}\right| = \left|\mathbb{N}\right|$

### Aufgabe 1.2

> Geben Sie für folgende Sprachen Aufzähler an: \
> **a)** $L_1 = \{3n | n \in \mathbb{N}\}$, wobei die Ausgabe unär kodiert sein soll

[turingmachine.io](https://turingmachine.io/)

```yaml
input: "11"
blank: _
start state: mark_input_end
table:
  mark_input_end:
    1: {R: mark_input_end}
    _: {write: S, L: move_left}
  move_left:
    [1, S]: L
    _: {R: take1}
  take1:
    1: {write: _, R: append3}
    S: {write: _, R: done}
  append3:
    [1, S]: R
    _: {write: 1, R: append2}
  append2:
    _: {write: 1, R: append1}
  append1:
    _: {write: 1, L: move_left}
  done:
```

(siehe auch [1.4 b](aufgabe-1.4))

> Geben Sie für folgende Sprachen Aufzähler an: \
> **b)** $L_2 = \{a^n b^n | n \in \mathbb{N}\}$

[turingmachine.io](https://turingmachine.io/)

```yaml
input: "111"
blank: _
start state: move_right
table:
  move_right:
    1: R
    [_, a]: {L: prepend_a}
  prepend_a:
    [a, b]: L
    _: {R: done}
    1: {write: a, R: append_b}
  append_b:
    [a, b]: R
    _: {write: b, L: prepend_a}
  done:
```

### Aufgabe 1.3

> **a)** Konstruieren Sie eine Turing-Maschine $A_{mul}$, welche die Multiplikation zweier natürlicher Zahlen implementiert. Dabei sollen sowohl die Eingaben als auch die Ausgabe unär kodiert sein.

[turingmachine.io](https://turingmachine.io/)

```yaml
input: "11_111"
blank: _
start state: skip_right_a
table:
  skip_right_a:
    1: R
    _: {R: skip_right_b}
  skip_right_b:
    1: R
    _: {write: S, L: skip_left_b}
  # move left over the inputs
  skip_left_b:
    1: L
    _: {L: skip_left_a}
  skip_left_a:
    1: L
    _: {R: take1}
  # subtract one from a
  take1:
    1: {write: _, R: skip_input}
    _: {R: cleanup}
  # skip right over inputs and outputs
  skip_input:
    [_, 1]: R
    S: {R: skip_output}
  skip_output:
    1: R
    _: {L: skip_output_to_b}
  # add 1 to output for every 1 in b and turn 1 to 2 in b
  skip_output_to_b:
    1: L
    S: {L: flip_b}
  flip_b:
    2: L
    1: {write: 2, R: append_1}
    _: {R: unflip_b}
  append_1:
    [2, S, 1]: {R: append_1}
    _: {write: 1, L: skip_output_to_b}
  # turn 2 to 1 in b
  unflip_b:
    2: {write: 1, R: unflip_b}
    S: {L: skip_left_b}
  # erase up to and including "S"
  cleanup:
    [_, 1]: {write: _, R: cleanup}
    S: {write: _, R: done}
  done:
```

### Aufgabe 1.4

> Auf [Folie 27 der 2. Vorlesung vom 11.4.2024](https://iccl.inf.tu-dresden.de/w/images/d/d7/TheoLog2024-Vorlesung-02-print.pdf#page=27) wird innerhalb des Widerspruchsbeweises zur
Berechenbarkeit der Busy-Beaver-Funktion eine Turingmaschine $M_{*2}$ mit Alphabet $\{x, ␣\}$
verwendet, welche die Funktion $x^n \rightarrow x^{2n}$ berechnet. \
> **b)** Geben Sie eine Einband-Turingmaschine über dem Alphabet $\{x, ␣\}$ an, die die Funktion
$x^n \rightarrow x^{2n}$ berechnet.

[turingmachine.io](https://turingmachine.io/)

```yaml
input: "xxxx"
blank: _
start state: add_space
table:
  add_space:
    x: {write: _, L: prepend_x}
    _: {R: skip_x0_right_x}
  prepend_x:
    _: {write: x, L: add_space}
  skip_x0_right_x:
    x: {R: skip_x0_right_0}
    _: {L: fill_space_left_0}
  skip_x0_right_0:
    _: {R: skip_x0_right_x}
    x: {L: add_space}
  fill_space_left_0:
    _: {write: x, L: fill_space_left_x}
  fill_space_left_x:
    x: {L: fill_space_left_0}
    _: {R: cleanup}
  cleanup:
    x: {write: _, R: done}
  done:
```
