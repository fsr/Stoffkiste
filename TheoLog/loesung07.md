## [7. Übungsblatt](https://web.archive.org/web/20241212082357/https://iccl.inf.tu-dresden.de/w/images/0/0b/TheoLog24-Uebung-07.pdf)

### Aufgabe M

> Wir betrachten folgende Position im Tic-Tac-Toe:
>
> +:---:+:---:+:---:+
> | $X$ |     |     |
> +-----+-----+-----+
> |     | $O$ |     |
> +-----+-----+-----+
> | $O$ |     | $X$ |
> +-----+-----+-----+
>
> Angenommen, Spieler $X$ ist am Zug. Beschreiben Sie eine Gewinnstrategie für $X$.

+:---:+:---:+:-----:+
| $X$ |     | **X** |
+-----+-----+-------+
|     | $O$ |       |
+-----+-----+-------+
| $O$ |     | $X$   |
+-----+-----+-------+

### Aufgabe N

> Zeigen Sie, dass für jedes *PSpace*-vollständige Problem $L$ auch das Komplement $L$ ein *PSpace*-vollständiges Problem ist.

Die Entscheider $M_L$ für $L \in \text{PSpace-complete} \subseteq \text{PSpace}$ darf zum Entscheiden eines Wortes $w$ höchstens $p(|w|)$ Speicher nutzen. Der Entscheider $M_{\neg L}$ simuliert $M_L$ auf und kehrt anschließend dessen Ergebnis um. Damit braucht $M_{\neg L}$ genauso viel Speicher wie $M_L$.

### Aufgabe O

> Zeigen Sie: ist $\text{P} = \text{NP}$, dann sind alle Sprachen $L \in P \setminus \{\emptyset, \Sigma^{*}\}$ *NP*-vollständig.

**TODO**

### Aufgabe 7.1

> Zeigen Sie, dass das Wortproblem für linear beschränkte Turingmaschinen (*LBA*)
> $$P_\text{LBA} := \{\text{enc}(M)\#\#\text{enc}(w) |\text{ $M$ ist ein LBA, der $w$ akzeptiert}\}$$
> ein *PSpace*-vollständiges Problem ist. \
> *Zur Erinnerung (aus Formale Systeme):* Ein linear beschränkte Turingmaschine (linear bounded automaton, *LBA*) ist eine nichtdeterministische Turingmaschine, die den Lese-/Schreibkopf nicht über das letzte Eingabezeichen hinaus bewegen kann. Versucht sie das, so bleibt der Kopf stattdessen an der letzten Bandstelle stehen.

> #### [Musterlösung](https://github.com/knowsys/TheoLog/blob/master/Uebungen/uebung-07-04-musterloesung.tex)
>
> Wir zeigen zuerst $P_\text{LBA} \in \text{PSpace}$. Dafür muss zuerst geprüft werden, ob eine gegeben Eingabe von der Form $\text{enc}(M)\#\#\text{enc}(w)$ ist, wobei $M$ ein *LBA* ist. Dabei ist leicht zu sehen, dass in polynomieller Zeit geprüft werden kann, ob $\text{enc}(M)$ die Kodierung einer Turing-Maschine ist. Um zu sehen, dass $M$ ein *LBA* ist, genügt es dann zu prüfen, ob $M$ niemals ein ␣ überschreibt, und bei Lesen des ␣ dieses nicht überschreibt und den Lesekopf nach links bewegt. Auch dies kann in polynomieller Zeit geprüft werden.                                                                                                                   
>
> Als nächstes muss ein Entscheider für $P_\text{LBA}$ prüfen, ob $M = (Q, \Sigma, \Gamma, \delta, q_0, F)$ die Eingabe $w$ akzeptiert. Dazu beobachten wir, dass die Maschine $M$ höchstens $\left| Q \right| \cdot n \cdot \left| \Gamma \right|^n$ Konfigurationen durchläuft, bevor sie in eine Schleife gerät. Es genügt also, die Maschine $M$ für höchstens $\left| Q \right| \cdot n \cdot \left| \Gamma \right|^n$ Schritte zu simulieren um zu entscheiden, ob $M$ das Wort $w$ erkennt. Die Simulation von $M$ selbst benötigt nur linear Platz (da $M$ ein *LBA* ist), und hinzu kommt noch Platz für einen Zähler, dessen Wert höchstens  $\left| Q \right| \cdot n \cdot \left| \Gamma \right|^n$ ist und der deswegen höchstens Platz $\log{\left| Q \right|} + \log{n} + n \cdot \log{\left| \Gamma \right|}$ benötigt. Dies gesamte Simulation kann also in polynomiellen Platz ausgeführt werden.
>
> Wir zeigen nun, dass $P_\text{LBA}$ *PSpace*-hart ist. Sei dazu $L \in \text{PSpace}$ und sei $M$ eine polynomiell platzbeschränkte Turing-Maschine, die $L$ entscheidet. Sei $p$ ein Polynom, welches den Platzverbrauch von $M$ beschränkt. Ohne Einschränkung sei dabei $p(n) \geq n$ für alle $n \in \mathbb{N}$. Definiere dann $\text{pad}(w)$ durch
> $$\text{pad}(w) = w\bot^{k},$$
> wobei $\bot$ ein neues Symbol ist, so dass $\left| \text{pad}(w) \right| = p(\left| w \right|)$ gilt.
>
> Sei nun $M'$ die Turing-Maschine, welche $M$ auf der Eingabe simuliert und dabei das $\bot$-Zeichen wie behandelt. Dies kann erreicht werden, indem in der Übergangsfunktion von $M$ jedes Vorkommen von durch $\bot$ ersetzt wird, und zusätzlich noch die Transition hinzugefügt wird, dass $M'$ bei Lesen von den Lesekopf nach links bewegt und wieder schreibt. Dann ist $M'$ ein *LBA* und es gilt
> $$M' \text{ akzeptiert } w \iff M \text{ akzeptiert } w.$$
> Also ist
> $$f(\text{enc}(w)) = \text{enc}(M')\#\#\text{enc}(\text{pad}(w))$$
> eine polynomiell zeitbeschränkte Reduktion von $L$ auf $P_\text{LBA}$. Da $L$ beliebig gewählt war folgt, dass $P_\text{LBA}$ *PSpace*-hart ist.

**TODO**

### Aufgabe 7.2

> Begründen Sie folgende Aussagen: \
> **a)** Ist $\text{P} = \text{NP}$, dann ist $\text{NP} = \text{coNP}$.

  * $L \in \text{NP} \Leftrightarrow \neg L \in \text{coNP}$
  * $L \in \text{P} \Leftrightarrow \neg L \in \text{P}$
  * $\text{P} = \text{NP}$ \
    $\Rightarrow L \in \text{NP} \Leftrightarrow L \in \text{P}$ \
    $\Leftrightarrow \neg L \in \text{P} \Leftrightarrow \neg L \in \text{NP}$ und $\neg L \in \text{coNP}$

> Begründen Sie folgende Aussagen: \
> **b)** Ist $\text{P} \neq \text{NP}$, dann gilt $\text{P} \neq \text{coNP}$, $\text{L} \neq \text{NP}$ und $\text{P} \neq \text{PSpace}$.

  * Für jedes Problem $L \in \text{NP}$ liegt sein Komplement $\neg L \in \text{coNP}$. \
    Wäre $\text{P} = \text{coNP}$, dann wäre $\neg L \in \text{P}$, aber $L \in \text{P} \Leftrightarrow \neg L \in \text{P}$. \
    Das würde bedeutet $L \in \text{NP} \Rightarrow L \in \text{P}$, da $\neg L \in \text{P}$. \
    $\Rightarrow \text{NP} \subseteq \text{P}$ \
    Mit $\text{P} \subseteq \text{NP}$ folgt $\text{P} = \text{NP}$ \
    **Widerspruch:** $\text{P} = \text{coNP}$ kann also nicht gelten.
  * $\text{L} \subseteq \text{P}\text{ und }\text{P} \neq \text{NP} \Rightarrow \text{L} \neq \text{NP}$
  * $\text{P} \subset \text{NP} \subseteq \text{PSpace} \Rightarrow \text{P} \subset \text{PSpace} \Rightarrow \text{P} \neq \text{PSpace}$

### Aufgabe 7.3

> Wir betrachten folgendes Scheduling-Problem: Gegeben sind Prüfungen $P_1, \ldots, P_k$ und Studierende $S_1, \ldots, S_\ell$, so dass jede Prüfung von einer bestimmten Menge von Studierenden abgelegt wird. Die Aufgabe ist, die Prüfungen so in Zeitslots zu legen, dass niemand zwei Prüfungen im selben Zeitslot ablegen muss. Formalisieren Sie die Frage, ob solch ein Prüfungsplan mit höchstens $h$ Zeitslots möglich ist, als eine formale Sprache und zeigen Sie, dass diese *NP*-vollständig ist. Nutzen Sie dazu die Tatsache, dass Färbbarkeit von Graphen *NP*-vollständig ist.

$P := \{P_1, \ldots, P_k\}$ \
$S := \{S_1, \ldots, P_\ell\}$ \
$L := \{\text{enc}(P, S, h) |$ Es gibt eine Zuordnung von $\ell$ Studenten auf $k$ Prüfungen in $h$ Zeitslots ohne Überschneidungen$\}$

$L$ ist *NP*-complete, wenn $P_\text{Graph-Coloring} \leq_p L$:

  * ungerichteter Graph $G = (V, E)$ und die Anzahl der Farben $k$ von $P_\text{Graph-Coloring}$
  * $P := V$
  * für jede Kante $\{v_{i_1}, v_{i_2}\} \in V$:
      * ein Schüler $S_i$ hat die Prüfungen $P_{i_1}$ und $P_{i_2}$
  * $h := k$
  * Löse das Scheduling-Problem.

Polynomielle Reduktion mit $O(\left| E \right|)$ existiert, damit ist $L \in \text{NP-complete}$.

### Aufgabe 7.4

> Zeigen Sie, dass folgendes Problem unentscheidbar ist: Gegeben eine Turing-Maschine $M$ und eine Zahl $k \in \mathbb{N}$, ist $M$ eine $O(n^k)$-zeitbeschränkte Turing-Maschine?

**TODO**
