## [4. Übungsblatt](https://web.archive.org/web/20241212082357/https://iccl.inf.tu-dresden.de/w/images/5/58/TheoLog24-Uebung-04.pdf)

### Aufgabe H

> Sei $L$ eine unentscheidbare Sprache. Zeigen Sie: \
> **a)** $L$ hat eine Teilmenge $T \subseteq L$, die entscheidbar ist.

$T = \emptyset$ mit Entscheider $M_T$: $M_T$ hat nur einen Zustand, der ein nicht-akzeptierender Endzustand ist.

> Sei $L$ eine unentscheidbare Sprache. Zeigen Sie: \
> **b)** $L$ hat eine Obermenge $O \supseteq L$, die entscheidbar ist.

$O = \Sigma^{*}$ mit Entschieder $M_O$: $M_O$ hat nur einen Zustand, der ein akzeptierender Endzustand ist. 

> Sei $L$ eine unentscheidbare Sprache. Zeigen Sie: \
> **c)** Es gibt jeweils nicht nur eine sondern unendlich viele entscheidbare Teilmengen bzw. Obermengen wie in (a) und (b).

Jede überabzählbare Menge $L(M)$ hat unendlich viele abzählbare Teilmengen $T \subseteq L(M)$. Wenn $T$ abzählbar ist, dann ist $T$ entscheidbar.

$O = (\Sigma \cup \Sigma_{+})^{*}$ mit $\Sigma \cap \Sigma_{+} = \emptyset$ (Das Alphabet von $O$ wird um weitere Zeichen, die nicht in $\Sigma$ liegen, erweitert.): Es existieren unendlich viele $\Sigma_{+}$.

### Aufgabe 4.1

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **a)** Falls $\text{P} \neq \text{NP}$ gilt, dann auch $\text{P} \cap \text{NP} \neq \emptyset$

falsch, für eine deterministische Turing-Maschine in *P* lässt sich auch immer eine nicht-deterministische Turing-Maschine in *NP* konstruieren.

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **b)** Es gibt Probleme, die *NP*-hard, aber nicht *NP*-vollständig sind.

wahr, Gegenbeispiel $P_\text{halt}$: Jedes Problem in *NP* kann auf $P_\text{halt}$ reduziert werden $\Rightarrow P_\text{halt} \in \text{NP-hard}$, aber $P_\text{halt} \notin \text{NP}$ (siehe Ackermann-Funktion, Busy-Beaver, ...) und damit nicht *NP*-complete.

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **c)** Polynomielle Reduzierbarkeit ist nicht transitiv.

falsch, Many-One-Reduktionen sind transitiv: aus $A \leq_m B$ mit $f_a : A \rightarrow B$ und $B \leq_m C$ mit $f_b : B \rightarrow C$ folgt $f_{a,b} : A \rightarrow C$ mit $f_{a,b}(x) := f_b(f_a(x))$. Eine polynomielle Reduktion ist eine Many-One-Reduktion mit polynomieller Laufzeit. Eine Verkettung von polynomiellen Funktion erzeugt auch wieder eine polynomielle Funktion.

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **d)** Ist $L_2 \in \text{P}$ und $L_1 \leq_p L_2$, dann ist auch $L_1 \in \text{P}$.

wahr, für $L_2$ existiert eine deterministische Turing-Maschine mit polynomieller Laufzeit $M_2$ als Entscheider. Jedes Wort in $w_1$ in $L_1$ lässt sich entscheiden, indem man es mit einer Funktion $f$ in ein Wort $w_2$ in $L_2$ überführt und anschließend der Entscheider $M_2$ simuliert. Sowohl $f$ als auch $M_2$ laufen in polynomieller Zeit, also ist $L_1$ in *P* entscheidbar.

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **e)** Ist $L_1$ eine *NP*-vollständige Sprache und gilt $L_1 \leq_p L_2$, dann ist auch $L_2$ eine *NP*-vollständige Sprache.

wahr, da $L_1$ polynomiell entscheidbar ist und $L_1$ mit einer polynomiellen Funktion in $L_2$ überführt werden kann, muss auch der Entscheider für $L_2$ ebenfalls polynomiell lange laufen. Damit liegt $L_2$ in *NP*. Da $L_1$ aber auch in *NP*-hard liegt, muss also auch $L_2$ in *NP*-hard liegen. Da $L_2$ in *NP* und *NP*-hard liegt, liegt es in *NP*-complete.

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **f)** Ist $L_2$ eine *NP*-vollständige Sprache und gilt $L_1 \leq_p L2$, dann ist auch $L_1$ eine *NP*-vollständige Sprache.

falsch, $L_1 \in \text{NP} \setminus \text{NP-complete}$ ist möglich.

Gegenbeispiel:

  * $L_2 = \text{SAT} \in \text{NP-complete}$
  * $L_1 = \text{HORN-SAT} \in \text{P}$
  * $L_1 \subseteq L_2 \Rightarrow$ Reduktion mit $O(1)$

### Aufgabe 4.2

> Zeigen Sie, dass das Wortproblem deterministischer endlicher Automaten in LogSpace liegt: \
> ist $P_\text{DFA} := \{\text{enc}(A)\#\#\text{enc}(w) | A$ ist ein DFA, der $w$ akzeptiert$\}$, dann gilt $P_\text{DFA} \in \text{LogSpace}$

Der Speicherbedarf ist mit $O(\log{\left| \text{enc}(A)\#\#\text{enc}(w) \right|})$ beschränkt. Der Automat ist wie folgt definiert $A = (Q, \Sigma, \delta, q_0, F)$. Um $P_\text{DFA}$ zu simulieren, muss die aktuelle Position in $w$ und der aktuelle Zustand von $A$ gespeichert werden. Da der Automat $A$ deterministisch ist, kann er sich immer nur in genau einem $q \in Q$ befinden. Also $i \in \{0, 1, \ldots, m - 1\}$ mit $Q = \{q_0, q_1, \ldots, q_{m - 1}\}$ und $j \in \{0, 1, \ldots, n - 1\}$ mit $w = w_0 w_1 \ldots w_{n - 1}$ zu speichern. Solange $i$ und $j$ nicht unär kodiert sind, ist $\left| i \right| \sim \log{i}$ mit $\left| i \right|$ als Länge der Kodierung der Zahl $i$.

### Aufgabe 4.3

> Wir betrachten das folgende Problem $K$: Gegeben sind zwei gerichtete Graphen $G_1 = (V_1, E_1)$ und $G_2 = (V_2, E_2)$ sowie eine Zahl $k \in N$. Gefragt ist, ob es Teilmengen $V_1' \subseteq V_1$ und $V_2' \subseteq V_2$ gibt, so dass $\left|V_1'\right| = \left|V_2'\right| = k$ ist und es eine Bijektion $f : V_1' \rightarrow V_2'$ gibt, so dass gilt \
> $(u, v) \in E_1 \Leftrightarrow (f(u), f(v)) \in E_2$. \
> **a)** Zeigen Sie $K \in \text{NP}$.

$K$ ermittelt, ob $G_1$ und $G_2$ isomorphe Subgraphen mit $k$ Knoten enthalten. $K \in \text{NP}$ genau dann, wenn eine Lösung $V_1'$, $V_2'$, $f$ in polynomieller Zeit überprüft werden kann:

```python
def check(V1_, V2_, f):
    assert len(V1_) == len(V2_)
    for u in V1_:
        for v in V1_:
            u_v_in_E1 = False
            for e in E1:
                if (u, v) == e:
                    u_v_in_E1 = True
            if u_v_in_E1:

                u2 = f(u)
                u2_in_V2 = False
                for x in V2_:
                    if u2 == x:
                        u2_in_V2 = True
                assert u2_in_V2

                v2 = f(v)
                v2_in_V2 = False
                for x in V2_:
                    if v2 == x:
                        v2_in_V2 = True
                assert v2_in_V2

                u2_v2_in_E2 = False
                for e in E2:
                    if (u2, v2) == e:
                        u2_v2_in_E2 = True
                assert u2_v2_in_E2
```

`check(V1_, V2_, f)`{.python} hat eine Laufzeit $O(\left| V_1' \right|^2 (\left| E_1 \right| + 2(\left| f \right| + \left| V_2' \right|) + \left| E_2 \right|))$ mit $f$ der Laufzeit von $O(\left| V_1' \right| \cdot \left| V_2' \right|)$. Damit ist `check(V1_, V2_, f)`{.python} polynomiell. Überprüfung der Lösung ist in polynomieller Zeit möglich, damit ist $K \in \text{NP}$.

> Wir betrachten das folgende Problem K: Gegeben sind zwei gerichtete Graphen $G_1 = (V_1, E_1)$ und $G_2 = (V_2, E_2)$ sowie eine Zahl $k \in N$. Gefragt ist, ob es Teilmengen $V_1' \subseteq V_1$ und $V_2' \subseteq V_2$ gibt, so dass $\left|V_1'\right| = \left|V_2'\right| = k$ ist und es eine Bijektion $f : V_1' \rightarrow V_2'$ gibt, so dass gilt \
> $(u, v) \in E_1 \Leftrightarrow (f(u), f(v)) \in E_2$. \
> **b)** Zeigen Sie, dass $K$ ein *NP*-schweres Problem ist. Zeigen Sie dafür, dass das Problem *CLIQUE* auf *K* in polynomieller Zeit reduzierbar ist.

*CLIQUE* sucht für einen ungerichteten Graph $G = (V, E)$ und $k \in \mathbb{N}$ einen Subgraph $G' = (V', E')$ mit $V' \subseteq V$, $\left| V' \right| = k$ und $E' := \{\{u, v\} | u, v \in V', u \neq v, \{u, v\} \in E\}$, so dass jeder Knoten des Subgraphs mit jedem anderen Knoten des Subgraphs verbunden ist.

$\text{CLIQUE} \leq_p K$:

  * gegeben: ungerichteter Graph $G_\text{CLIQUE} = (V_\text{CLIQUE}, E_\text{CLIQUE})$ und $k_\text{CLIQUE} \in \mathbb{N}$
  * $G_\text{CLIQUE}$ ist ungerichtet $\Rightarrow$ $E_\text{CLIQUE}^{\rightarrow} := \displaystyle \bigcup_{\{u,v\} \in E_\text{CLIQUE}} \{(u, v), (v, u)\}$ ($O(n)$)
  * Führe $K$ aus:
      * $G_1 := (V_\text{CLIQUE}, E_\text{CLIQUE}^{\rightarrow})$ ($O(1)$)
      * $G_2 := (V_\text{CLIQUE}, E_\text{total})$ mit $E_\text{total} = \{(u, v) | u \in V, v \in V\}$ ($O(n^2)$)
      * $k := k_\text{CLIQUE}$ ($O(1)$)
      * $K \in \text{NP}$ sucht also einen Subgraph, der sowohl in $G_1$ als auch $G_2$ enthalten ist. (Da $V_1 = V_2 = V$ ist $f(x) = x$ und spart die Bijektion der Knoten.) Da in $G_2$ alle Knoten miteinander verbunden sind, ist der Subgraph nur in $G_1$ enthalten, wenn dort auch alle Knoten des Subgraphs miteinander verbunden sind.
      * Ergebnis: $G_1' = (V_1', E_1')$ mit $E_1' \subseteq E_\text{CLIQUE}^{\rightarrow}$, jeder Knoten in $V_1'$ ist mit jedem anderen Knoten in $V_1'$ verbunden
  * *CLIQUE* ist auch wieder ein ungerichteter Graph, alss muss $E_1'$ noch umgewandelt werden, um die Lösung von *CLIQUE* zu erhalten: $\{\{u, v\} | (u, v) \in  E_\text{CLIQUE}^{\rightarrow}\}$ ($O(n^2)$)
