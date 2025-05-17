## [12. Übungsblatt](https://web.archive.org/web/20241212082357/https://iccl.inf.tu-dresden.de/w/images/4/45/TheoLog24-Uebung-12.pdf)

### Aufgabe 12.1

> Wir betrachten das folgende Datalog-Programm $P$:
>
> $T(x) \leftarrow e(x)$ \
> $T(x) \leftarrow a(x, y) \land T(y) \land b(x, z) \land T(z)$
>
> $e(1)$, $e(2)$, $e(6)$ \
> $a(3, 1), a(4, 3), a(5, 3), a(7, 5)$ \
> $b(3, 2), b(5, 3), b(7, 6)$
>
> **a)** Geben Sie einen Ableitungsbaum für $T(5)$ an.

  * $T(5) \leftarrow a(5, 3) \land T(3) \land b(5, 3) \land T(3)$
      * $T(3) \leftarrow a(3, 1) \land T(1) \land b(3, 2) \land T(2)$
          * $T(2) \leftarrow e(2)$
          * $T(1) \leftarrow e(1)$

> Wir betrachten das folgende Datalog-Programm $P$:
>
> $T(x) \leftarrow e(x)$ \
> $T(x) \leftarrow a(x, y) \land T(y) \land b(x, z) \land T(z)$
>
> $e(1)$, $e(2)$, $e(6)$ \
> $a(3, 1), a(4, 3), a(5, 3), a(7, 5)$ \
> $b(3, 2), b(5, 3), b(7, 6)$
>
> **b)** Berechnen Sie die Mengen $T_P^0$, $T_P^1$, $T_P^2$, $\ldots$. An welchem Punkt wird der Grenzwert erreicht?

$T_P^{i+1}$ ... welche $T(x)$ lassen sich mit den bereits berechneten $T(y) \in T_P^i$ berechnen?

  * $T_P^0 = \emptyset$
  * $T_P^1 = T_P^0 \cup \left\{ T(1), T(2), T(6) \right\}$
  * $T_P^2 = T_P^1 \cup \left\{ T(3) \right\}$
      * $T(3) \leftarrow a(3, 1) \land T(1) \land b(3, 2) \land T(2)$
  * $T_P^3 = T_P^2 \cup \left\{ T(5) \right\}$
      * $T(5) \leftarrow a(5, 3) \land T(3) \land b(5, 3) \land T(3)$
  * $T_P^4 = T_P^3 \cup \left\{ T(7) \right\}$
      * $T(7) \leftarrow a(7, 5) \land T(5) \land b(7, 6) \land T(6)$
  * es gibt keine weiteren Fakten für $T(k)$ mit $k > 7$
  * $T_P^n = \left\{ T(1), T(2), T(3), T(5), T(6), T(7) \right\}$

### Aufgabe 12.2

> Sei $E \subseteq V \times V$ die Kantenrelation eines gerichteten Graphen $G = (V, E)$ mit (endlicher) Knotenmenge $V$. Weiter sei $e$ das dazugehörige Datalog-Prädikat mit $e(v_1, v_2) \Leftrightarrow (v_1, v_2) \in E$ für alle $v_1, v_2 \in V$.
>
> Formalisieren Sie die nachfolgenden Probleme als Datalog-Programme, d.h. geben Sie Regeln an, die für einen gegebenen Graphen eine Lösung für das jeweilige Problem liefern.
>
> **a)** Nicht-Terminiertheit: Alle Paare von Knoten, die über eine Kante miteinander verbunden sind, so dass der Knoten mit der eingehenden Kante wieder verlassen werden kann.

$T(x, y) \leftarrow e(x, y) \land e(y, z)$

> Sei $E \subseteq V \times V$ die Kantenrelation eines gerichteten Graphen $G = (V, E)$ mit (endlicher) Knotenmenge $V$. Weiter sei $e$ das dazugehörige Datalog-Prädikat mit $e(v_1, v_2) \Leftrightarrow (v_1, v_2) \in E$ für alle $v_1, v_2 \in V$.
>
> Formalisieren Sie die nachfolgenden Probleme als Datalog-Programme, d.h. geben Sie Regeln an, die für einen gegebenen Graphen eine Lösung für das jeweilige Problem liefern.
>
> **b)** Erreichbare Knoten: Alle Knoten, die von einem festen Startknoten $s$ erreichbar sind.

$T(s)$ \
$T(x) \leftarrow e(s, x)$ \
$T(x) \leftarrow e(y, x) \land T(y)$

> Sei $E \subseteq V \times V$ die Kantenrelation eines gerichteten Graphen $G = (V, E)$ mit (endlicher) Knotenmenge $V$. Weiter sei $e$ das dazugehörige Datalog-Prädikat mit $e(v_1, v_2) \Leftrightarrow (v_1, v_2) \in E$ für alle $v_1, v_2 \in V$.
>
> Formalisieren Sie die nachfolgenden Probleme als Datalog-Programme, d.h. geben Sie Regeln an, die für einen gegebenen Graphen eine Lösung für das jeweilige Problem liefern.
>
> **c)** Alternative Wege: Alle Paare von Knoten, die sowohl über einen Weg der Länge eins als auch über einen Weg der Länge zwei verbunden sind.

$T(x ,y) \leftarrow e(x, y) \land e(x, z) \land e(z, y)$
