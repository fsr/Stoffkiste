## [6. Übungsblatt](https://web.archive.org/web/20241212082357/https://iccl.inf.tu-dresden.de/w/images/e/e4/TheoLog24-Uebung06.pdf)

  * [$\text{P} \subsetneq \text{Exp}, \text{LogSpace} \subsetneq \text{PSpace}$](https://web.archive.org/web/20250222123606/https://iccl.inf.tu-dresden.de/w/images/8/86/TheoLog2024-Vorlesung-07-print.pdf#page=28)
  * [$\text{LogSpace} \subseteq \text{P} \subseteq \text{PSpace} \subsetneq \text{Exp}$](https://web.archive.org/web/20250222123606/https://iccl.inf.tu-dresden.de/w/images/8/86/TheoLog2024-Vorlesung-07-print.pdf#page=28)
  * [$\text{DTIME}(f) \subseteq \text{DSPACE}(f)$](https://iccl.inf.tu-dresden.de/w/images/c/c2/TheoLog2024-Vorlesung-08-print.pdf#page=5)
  * [$\text{DSPACE}(f) \subseteq \text{DTIME}(2^{O(f)})$](https://iccl.inf.tu-dresden.de/w/images/c/c2/TheoLog2024-Vorlesung-08-print.pdf#page=6)
  * [$\text{NTIME}(f) \subseteq \text{NSPACE}(f)$](https://iccl.inf.tu-dresden.de/w/images/c/c2/TheoLog2024-Vorlesung-08-print.pdf#page=11)
  * [$\text{NSPACE}(f) \subseteq \text{DTIME}(2^{O(f)})$](https://iccl.inf.tu-dresden.de/w/images/c/c2/TheoLog2024-Vorlesung-08-print.pdf#page=11)
  * [$\text{LogSpace} \subseteq \text{NLogSpace}, \text{P} \subseteq \text{NP}, \text{PSpace} \subseteq \text{NPSpace}, \text{Exp} \subseteq \text{NExp}$](https://iccl.inf.tu-dresden.de/w/images/c/c2/TheoLog2024-Vorlesung-08-print.pdf#page=11)
  * [$\text{P} \subseteq \text{PSpace}, \text{NP} \subseteq \text{NPSpace}$](https://iccl.inf.tu-dresden.de/w/images/c/c2/TheoLog2024-Vorlesung-08-print.pdf#page=11)
  * [$\text{NLogSpace} \subseteq \text{P}, \text{NPSpace} \subseteq \text{Exp}$](https://iccl.inf.tu-dresden.de/w/images/c/c2/TheoLog2024-Vorlesung-08-print.pdf#page=11)
  * [$\text{PSpace} = \text{NPSpace}$](https://iccl.inf.tu-dresden.de/w/images/c/c2/TheoLog2024-Vorlesung-08-print.pdf#page=13)
  * [$\text{NLogSpace} \subsetneq \text{NPSpace}, \text{NP} \subsetneq \text{NExp}$](https://iccl.inf.tu-dresden.de/w/images/c/c2/TheoLog2024-Vorlesung-08-print.pdf#page=14)
  * [$\text{P} \subseteq \text{NP} \cap \text{coNP}$](https://web.archive.org/web/20250222123606/https://iccl.inf.tu-dresden.de/w/images/5/5d/TheoLog2024-Vorlesung-09-print.pdf#page=14)
  * ["Eine Sprache ist *NP*-schwer, wenn jede Sprache in *NP* polynomiell darauf reduzierbar ist."](https://web.archive.org/web/20250222123606/https://iccl.inf.tu-dresden.de/w/images/5/5d/TheoLog2024-Vorlesung-09-print.pdf#page=19)
  * [$\text{NP-complete} = \text{NP} \cap \text{NP-hard}$](https://web.archive.org/web/20250222123606/https://iccl.inf.tu-dresden.de/w/images/5/5d/TheoLog2024-Vorlesung-09-print.pdf#page=19)
  * [$P_\text{halt} \in \text{NP-hard}, P_\text{halt} \notin \text{NP}$](https://web.archive.org/web/20250222123606/https://iccl.inf.tu-dresden.de/w/images/5/5d/TheoLog2024-Vorlesung-09-print.pdf#page=19)
  * [$\text{NL} = \text{coNL}$](https://web.archive.org/web/20250222123606/https://iccl.inf.tu-dresden.de/w/images/1/1b/TheoLog2024-Vorlesung-11-print.pdf#page=10)
  * [*PSpace*-hard](https://web.archive.org/web/20250222123633/https://iccl.inf.tu-dresden.de/w/images/1/1b/TheoLog2024-Vorlesung-11-print.pdf#page=20)

### Aufgabe 6.1

> Zeigen Sie folgende Aussagen: \
> **a)** Ist $L_2 \in \text{PSpace}$ und gilt $L_1 \leq_p L_2$, so ist auch $L_1 \in \text{PSpace}$.

  * $L_1 \in L_2$ bedeutet, dass die Reduktion in polynomieller **Zeit** stattfindet.
  * Die (polynomielle) Reduktion $f_p$ mit $O_t(n^p)$ kann also höchstens $O_s(n^p)$ (polynomiellen) Speicher benutzen.
  * $L_1 \in \text{LogSpace}$:
      * Entscheider mit Reduktion: $M_2(f_p(w_1))$ mit $O(p \cdot \log{n})$
      * **Widerspruch:** Wenn $L_1 \in \text{LogSpace}$ und $L_1 \leq_p L_2$, dann wäre $L_2 \in \text{LogSpace}$. ($O(p \cdot \log{n}) \not\approx O(n^{d_2})$)
  * $L_1 \in \text{PSpace}$:
      * Entscheider mit Reduktion: $M_2(f_p(w_1))$ mit $O(n^{p \cdot d_2})$
      * $O(n^{d_1}) := O(n^{p \cdot d_2})$
  * Mit einer polynomiellen Reduktion kann nur von *PSpace* nach *PSpace* transformiert werden und nicht von *LogSpace* in *PSpace*.

> Zeigen Sie folgende Aussagen: \
> **b)** Ist $L_1$ ein *PSpace*-schweres Problem, und gilt $L_1 \leq_p L_2$, dann ist auch $L_2$ ein *PSpace*-schweres Problem.

  * $L_1$ ist *PSpace*-hard: $\forall K \in \text{PSpace}: K \leq_p L_1$ mit $f_K: K \rightarrow L_1$
  * $L_1 \leq_p L_2$ mit $f_2: L_1 \rightarrow L_2$
  * $\Rightarrow$ mit $f_2(f_K(w))$ lässt sich jedes $w \in K$ zu $L_2$ reduzieren
  * $\forall K \in \text{PSpace}: K \leq_p L_2$ mit $f_K \circ f_2: K \rightarrow L_2$
  * Die Verkettung polynomieller Funktionen ist polynomiell.

### Aufgabe 6.2

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **a)** Jedes PSpace-schwere Problem ist *NP*-schwer.

falsch, es existieren Probleme $K \in \text{PSpace}, K \notin \text{NP}$ für die keine Reduktion $K \leq_p K_\text{NP} \in \text{NP-hard}$ existiert. ($K \leq_p K_\text{PSpace} \in \text{PSpace-hard}$ muss existieren.)

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **b)** Es gibt kein *NP*-schweres Problem, welches in *PSpace* liegt.

falsch, Gegenbeispiel: $\text{QBF} \in \text{NP-hard}, \text{QBF} \in \text{PSpace}$

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **c)** Jedes *NP*-vollständige Problem liegt in *PSpace*.

wahr, $\text{NP-complete} \subseteq \text{NP} \subseteq \text{PSpace}$

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **d)** Es gilt $\text{NP} = \text{PSpace}$, wenn es ein *PSpace*-schweres Problem in *NP* gibt.

wahr, wäre ein *PSpace*-schweres Problem $P_\text{NP} \in \text{NP}$, dann würde die Reduktion $P_\text{PSpace} \leq_p P_\text{NP}$ für $P_\text{PSpace} \in \text{PSpace}$ alle Probleme $P_\text{PSpace}$ von *PSpace* in *NP* reduzieren.

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **e)** Wenn $\text{P} \neq \text{NP}$ gilt, dann gibt es kein *NP*-schweres Problem in *P*.

wahr, wäre ein *NP*-schweres Problem $P_\text{NP-hard} \in \text{P}$, dann würde die Reduktion $P_\text{NP} \leq_p P_\text{NP-hard}$ für $P_\text{NP} \in \text{NP}$ alle Probleme $P_\text{NP}$ von *NP* in *P* reduzieren.

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **f)** Sei $L$ ein *PSpace*-vollständiges Problem. Dann gilt $L \in \text{P} \Leftrightarrow \text{P} = \text{PSpace}$.

wahr

  * $L \in \text{PSpace-complete}$ und wenn $L \in \text{P}$, dann würde die Reduktion $P_\text{PSpace} \leq_p L$ für $P_\text{PSpace} \in \text{PSpace}$ alle Probleme $P_\text{PSpace}$ von *PSpace* in *P* reduzieren.
  * Wenn $\text{P} = \text{PSpace}$, dann wäre $L \in \text{PSpace-complete} \subseteq \text{PSpace} = \text{P}$.

### Aufgabe 6.3

> Zeigen Sie, dass PSpace unter Komplement, Durchschnitt, Vereinigung, Konkatenation und Kleene-Stern abgeschlossen ist.

$\forall L_1, L_2 \in \text{PSpace}:$

  * $\neg L_1 \in \text{PSpace}$
      * **TODO**
  * $L_1 \cap L_2 \in \text{PSpace}$
      * akzeptiere genau dann, wenn $M_1$ akzeptiert *und* $M_2$ akzeptiert
  * $L_1 \cup L_2 \in \text{PSpace}$
      * akzeptiere genau dann, wenn $M_1$ akzeptiert *oder* $M_2$ akzeptiert
  * $\left\{ w_1 w_2 | w_1 \in L_1, w_2 \in L_2 \right\} \in \text{PSpace}$
      * $\text{PSpace} = \text{NPSpace}$
      * rate $w_1 \in L_1$ und $w_2 \in L_2$
      * akzeptiere, wenn $M_1$ $w_1$ akzeptiert und $M_2$ $w_2$ akzeptiert
  * $L_1^{*} \in \text{PSpace}$
      * $\text{PSpace} = \text{NPSpace}$
      * siehe [Aufgabe J](#aufgabe-j)

### Aufgabe 6.4

> Wir betrachten das japanische Spiel Gomoku, welches von zwei Spielern $X$ und $O$ auf einem $19 \times 19$-Brett gespielt wird. Die Spieler setzen abwechselnd ihre Steine auf das Brett, und derjenige Spieler, der zuerst fünf Steine in einer Reihe (horizontal, vertikal, oder diagonal) gelegt hat, gewinnt. Spieler $X$ beginnt. \
>
> *Verallgemeinertes Gomoku* wird statt auf einem Brett fester Größe auf einem beliebigen $n \times n$-Brett gespielt. Eine Position in diesem Spiel ist eine Belegung der Felder des Spielbretts mit Steinen der Spieler $X$ und $O$, wie sie in einem wirklichen Spiel auftreten könnte. Sei
>
> $$\text{GM} := \{\text{enc}(B) | \text{$B$ ist eine Position im verallgemeinerten Gomoku,
in der $X$ eine Gewinnstrategie hat}\}$$
>
> wobei $\text{enc}(B)$ die zeilenweise Kodierung der Position $B$ über einem festen Alphabet ist. Argumentieren Sie, warum $\text{GM} \in \text{PSpace}$ gilt.

**TODO**

### Aufgabe 6.5

> Welche der folgenden Quantifizierten Booleschen Formeln (QBFs) sind wahr? Begründen Sie Ihre Antwort. \
> **a)** $\exists p_1.p_1$

wahr, $\exists$ verlangt, dass eine mögliche Belegung für $p_1$ existiert für die Formel $p_1$ wahr ist. Eine Möglichkeit ist $p_1 = \top$.

> Welche der folgenden Quantifizierten Booleschen Formeln (QBFs) sind wahr? Begründen Sie Ihre Antwort. \
> **b)** $\forall p_1.p_1$

falsch, $\forall$ verlangt, dass für alle möglichen Belegungen für $p_1$ die Formel $p_1$ wahr ist. Gegenbeispiel: $p_1 = \bot$

> Welche der folgenden Quantifizierten Booleschen Formeln (QBFs) sind wahr? Begründen Sie Ihre Antwort. \
> **c)** $\exists p_1.\bot$

falsch, es existiert kein $p_1$ für das $\bot$ wahr ist.

> Welche der folgenden Quantifizierten Booleschen Formeln (QBFs) sind wahr? Begründen Sie Ihre Antwort. \
> **d)** $\forall p_1.\exists p_2.p_2 \rightarrow p_1$

wahr, für jedes $p_1$ ist die Formel $\exists p_2.p_2 \rightarrow p_1$ mit $p_2 = \bot$ erfüllt.

> Welche der folgenden Quantifizierten Booleschen Formeln (QBFs) sind wahr? Begründen Sie Ihre Antwort. \
> **e)** $\forall p_1.\exists p_2.\forall p_3.(p_1 \lor p_2) \land p_3$

falsch, für alle $p_1$ existiert zwar $p_2 = \top$, damit $p_1 \lor p_2$ wahr ist, aber für $p_3 = \bot$ ist $(p_1 \lor p_2) \land p_3$ nicht wahr.

> Welche der folgenden Quantifizierten Booleschen Formeln (QBFs) sind wahr? Begründen Sie Ihre Antwort. \
> **f)** $\forall p_1.\forall p_2.\exists p_3.\forall p_4.(\bm{(}p_1 \land p_2\bm{)} \rightarrow p_4) \lor \lnot p_3$

wahr, mit $p_3 = \bot$ ist $(\bm{(}p_1 \land p_2\bm{)} \rightarrow p_4) \lor \lnot p_3$ immer erfüllt.
