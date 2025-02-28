## [5. Übungsblatt](https://web.archive.org/web/20241212082357/https://iccl.inf.tu-dresden.de/w/images/b/b2/TheoLog24-Uebung-05.pdf)

### Aufgabe J

> Zeigen Sie, dass *NP* unter Kleene-Stern abgeschlossen ist.

Es ist zu zeigen $\forall L \in \text{NP}: L^{*} \in \text{NP}$

gegeben: $M$ entscheidet in $O(p(\left| w \right|))$, ob $w \in L$ oder $w \notin L$

gesucht: nicht-deterministische Turing Maschine $M^{*}$, die in $O(p^{*}(\left| w \right|))$ entscheidet, ob $w \in L^{*}$ oder $w \notin L^{*}$

Beweis:

  * nicht-deterministische Turing-Maschine $M^{*}$ rät Aufteilung von $w \in L^{*}$ in $w = w_1 w_2 \ldots w_n$ mit $w_k \in L$ \
    in $O(p_w(\left| w \right|))$ überprüfbar
  * $M^{*}$ akzeptiert das leere Wort $\varepsilon$
  * $M^{*}$ simuliert $M$ für jedes $w_k$ in $O(p(\left| w_1 \right|) + \ldots + p(\left| w_n \right|))$
      * akzeptiert $M$ jedes $w_k$ $\Rightarrow M^{*}$ akzeptiert
      * sonst $M^{*}$ lehnt ab

### Aufgabe 5.1

> Wir betrachten das folgende Problem $K$: Gegeben eine aussagenlogische Formel $\varphi$ mit $n$  Variablen, gibt es eine erfüllende Belegung von $\varphi$, bei der mindestens die Hälfte aller in $\varphi$ vorkommenden Variablen mit *"true"* belegt sind? \
> **a)** Formalisieren Sie dieses Problem als Sprache und zeigen Sie, dass $K \in \text{NP}$ gilt.

$L_K := \left\{ (\varphi, b) | \text{$b$ ist eine Belegung der aussagenlogische Formel bei der mindestens die Hälfte aller in $\varphi$ vorkommenden Variablen mit *"true"* belegt sind} \right\}$

nicht-deterministische Turing-Maschine:

  * rät $(\varphi, b)$
  * prüft in polynomieller Zeit, ob $\varphi$ erfüllt ist
  * prüft in polynomieller Zeit, ob mindestens die Hälfte aller in $\varphi$ vorkommenden Variablen mit *"true"* belegt sind

> Wir betrachten das folgende Problem $K$: Gegeben eine aussagenlogische Formel $\varphi$ mit $n$  Variablen, gibt es eine erfüllende Belegung von $\varphi$, bei der mindestens die Hälfte aller in $\varphi$ vorkommenden Variablen mit *"true"* belegt sind? \
> **b)** Zeigen Sie, dass K ein NP-schweres Problem ist.

$P_\text{SAT} \leq_m K$ ($P_\text{SAT} \in \text{NP-complete} \subseteq \text{NP-hard}$), Reduktionsfunktion:

  * Eingabe $\text{enc}(\varphi, b) \in P_\text{SAT}$ mit $b = (b_1, b_2, \ldots, b_{\left| b \right|})$
  * erweitere $\varphi$ um $\left| b \right|$ weitere Variablen, die alle mit *"true"* belegt sein müssen:
      * $\varphi_K := \varphi \land \displaystyle \bigwedge_{i = 1}^{\left| b \right|} a_i = \varphi \land a_1 \land \ldots \land a_{\left| b \right|}$
      * $b_K := (b_1, b_2, \ldots, b_{\left| b \right|}, a_1 \mapsto \top, a_2 \mapsto \top, \ldots, a_{\left| b \right|} = \top)$ \
        $\Rightarrow$ die Hälfte aller Variablen in $b_K$ ist mit $\top$ belegt
  * $\Rightarrow \text{enc}(\varphi_k, b_K) \in K$
  * Da $K \in \text{NP-hard}$ und nicht $K \in \text{NP-complete}$ gefragt war, ist die Laufzeit der Reduktion egal, wird wohl aber doch polynomiell sein.

### Aufgabe 5.2

> Im folgenden *Solitaire*-Spiel haben wir ein Spielbrett der Größe $m \times m$ gegeben. Als Ausgangsposition liegt auf jeder der $m^2$ Positionen entweder ein blauer Stein, ein roter Stein, oder gar nichts. Das Spiel wird nun so gespielt, dass Steine vom Brett genommen werden bis in jeder Spalte nur noch Steine einer Farbe liegen, und in jeder Zeile mindestens ein Stein liegen bleibt. In diesem Fall ist das Spiel gewonnen. Es ist möglich, dass man ausgehend von einer Ausgangsposition das Spiel nicht gewinnen kann. \
> **a)** Formalisieren Sie das Problem, für eine gegebene Ausgangsposition im Solitaire-Spiel zu entscheiden, ob es möglich ist, das Spiel zu gewinnen, als ein Entscheidungsproblem *SOLITAIRE*.

$P_\text{SOLITAIRE} = \left\{ \text{enc}(B) | \text{$B$ ist eine Ausgangsposition, die gewonnen werden kann} \right\}$

> Im folgenden *Solitaire*-Spiel haben wir ein Spielbrett der Größe $m \times m$ gegeben. Als Ausgangsposition liegt auf jeder der $m^2$ Positionen entweder ein blauer Stein, ein roter Stein, oder gar nichts. Das Spiel wird nun so gespielt, dass Steine vom Brett genommen werden bis in jeder Spalte nur noch Steine einer Farbe liegen, und in jeder Zeile mindestens ein Stein liegen bleibt. In diesem Fall ist das Spiel gewonnen. Es ist möglich, dass man ausgehend von einer Ausgangsposition das Spiel nicht gewinnen kann. \
> **b)** Zeigen Sie, dass $\text{SOLITAIRE} \in \text{NP}$ gilt.

nicht-deterministische Turing-Maschine:

  * Rät ausgehend vom Ausgangsbrett eine erfüllende End-Position.
  * Falls keine Endposition existiert, dann akzeptiere *nicht*.
  * Prüfe für jede der $m$ Spalten, ob alle Steine die gleiche Farbe haben. $O(m^2)$
  * Prüfe für jede der $m$ Zeilen, ob diese mindestens einen Stein enthält. $O(m^2)$
  * In $O(m^2)$ Schritten lässt sich aus der Endposition das Ausgangsbrett wiederherstellen, indem die Steine, so wie sie auf dem Ausgangsbrett lagen, wieder zur Endposition hinzugefügt werden ohne bereits liegende Steine zu ersetzen.

Für eine gegebene Endposition lässt sich also in $O(m^2)$ überprüfen, ob diese zu der Ausgangsposition passt $\Rightarrow P_\text{SOLITAIR} \in \text{NP}$

> Im folgenden *Solitaire*-Spiel haben wir ein Spielbrett der Größe $m \times m$ gegeben. Als Ausgangsposition liegt auf jeder der $m^2$ Positionen entweder ein blauer Stein, ein roter Stein, oder gar nichts. Das Spiel wird nun so gespielt, dass Steine vom Brett genommen werden bis in jeder Spalte nur noch Steine einer Farbe liegen, und in jeder Zeile mindestens ein Stein liegen bleibt. In diesem Fall ist das Spiel gewonnen. Es ist möglich, dass man ausgehend von einer Ausgangsposition das Spiel nicht gewinnen kann. \
> **c)** Zeigen Sie, dass *SOLITAIRE* ein *NP*-schweres Problem ist, indem Sie zeigen, dass *3-SAT* in polynomieller Zeit auf *SOLITAIRE* reduzierbar ist.

$P_\text{3-SAT} \leq_p P_\text{SOLITAIRE}$ **TODO**

### Aufgabe 5.3

> Sei $\Sigma$ ein Alphabet und $A, B \subseteq \Sigma^{*}$. Wir sagen, dass $A$ auf $B$ in logarithmischen Platz reduzierbar ist, und schreiben $A \leq_\ell B$, falls es eine Many-One-Reduktion von $A$ nach $B$ gibt, die in logarithmischen Platz berechenbar ist. Begründen Sie: Gilt $A \leq_\ell B$ und $B \leq_\ell C$, dann gilt auch $A \leq_\ell C$. \
> Anmerkung: Bei dieser Aufgabe ist nicht nach einem vollständigen Beweis, sondern eher nach einer Beweisidee gefragt.

Problem: lediglich das Arbeitsband der Reduktion $g$ bzw. $M_g$ ist mit $O(\log{n})$ beschränkt, die Ausgabe von $g$ bzw. $M_g$ kann aber $O(p(n))$ sein.

> #### [Musterlösung](https://github.com/knowsys/TheoLog/blob/master/Uebungen/uebung-06-03-musterloesung.tex)
>
> Wir zeigen, dass für zwei logspace-berechenbare Funktion $f, g\colon \Sigma^{*} \to \Sigma^{*}$ auch $f \circ g$ logspace-berechenbar ist. Seien dazu $M_{f}$ und $M_{g}$ Turing-Maschinen, die mit logarithmischer Platzbeschränkung die Funktionen $f$ und $g$ berechnen.
>
> Eine erste Idee, eine Turing-Maschine $M$ zu erhalten, die $f \circ g$ berechnet, ist, zuerst $M_{g}$ auf der Eingabe aufzurufen, das Zwischenergebnis zu speichern, und dann $M_{f}$ auf diesem Zwischenergebnis laufen zu lassen. **Diese Idee funktioniert jedoch nicht:** zwar benutzt $M_{g}$ bei Eingabe $w \in \Sigma^{*}$ nur zusätzlich logarithmischen Platz zur Berechnung von $g(w)$. Dieses Ergebnis kann jedoch polynomiell groß sein in der Länge von $w$ -- und damit exponentiell in der Größe des zur Verfügung stehenden Platzes, der ja logarithmisch in der Größe von $w$ beschränkt ist. Damit kann das Zwischenergebnis $g(w)$ nicht vollständig gespeichert werden und dieser Ansatz funktioniert nicht.
>
> Wir können aber diese Idee so modifizieren, dass sie funktioniert! Dazu berechnen wir die Zeichen von $g(w)$ "on demand": wir verändern $M_{g}$ so, dass sie nur das $k$-te Symbol von $g(w)$ berechnet. Dies kann erreicht werden, indem $M_{g}$ mit einem weiteren Zähler $p$ versehen wird, der um eins hochgezählt wird, wann immer $M_{g}$ ein Symbol ausgeben möchte. Ist der Wert von $p$ gleich $k$, gibt $M_{g}$ das entsprechende Zeichen aus und hält an.
>
> Um $f(g(w))$ in *LogSpace* zu berechnen, gehen wir nun wie folgt vor: wir simulieren die Berechnung von $M_{f}$. Wann immer diese Berechnung ein Symbol von $g(w)$ lesen möchte, simulieren wir $M_{g}$ wie oben beschrieben. Beide Simulationen können in logspace durchgeführt werden, und damit kann auch $f(g(w))$ in logspace berechnet werden.
>
> Diese Berechnung von $f(g(w))$ ist recht ineffizient, da Symbole von $g(w)$ möglicherweise mehrfach berechnet werden. Wir haben aber potentiell nicht genug Platz, um das gesamte Wort $g(w)$ zu speichern. Wir tauschen also "Platz gegen Zeit".

### Aufgabe 5.4

> *PCP-k* ist das folgende Entscheidungsproblem: \
> *Gegeben:* eine Zahl $k \in \mathbb{N}$ in unärer Kodierung und eine Instanz $P$ des Postschen
Korrespondenzproblems, d.h. eine endliche Folge von Wortpaaren
> $$P = (x_1, x_2), \ldots, (x_n, y_n)$$
> über einem Alphabet $\Sigma$, also $x_i, y_i \in \Sigma^{+}$ für $1 \leq i \leq n$. \
> *Gefragt:* Gibt es eine Lösung für $P$ mit maximaler Länge $k$? Oder genauer: Gibt es eine Folge von Zahlen $i_1, \ldots, i_\ell$, so dass gilt:
> $$x_{i_1} \ldots x_{i_\ell} = y_{i_1} \ldots y_{i_\ell}$$
> wobei $0 < \ell \leq k$ ist und $i_j \in \{1, \ldots, n\}$ für alle $j = 1, \ldots, \ell$? \
> **a)** Zeigen Sie, dass *PCP-k* entscheidbar ist.

*PCP* ist semi-entscheidbar. Da zusätzlich mit $k$ noch ein Abbruchkriterium gegeben ist, lassen sich in $O(n^k)$ alle möglichen Kombinationen durchprobieren. (Für jedes $(x_{i_j}, y_{i_j})$ mit $j \in \{1, \ldots, k\}$ kann aus $n$ *Dominosteinen* des *PCP*-Problems gewählt werden.) Wenn also in den $n^k$ möglichen Kombinationen keine Lösung gefunden wurde, kann eine Lösung des *PCP-k* ausgeschlossen werden. $\Rightarrow$ *PCP-k* ist entscheidbar.

> *PCP-k* ist das folgende Entscheidungsproblem: \
> *Gegeben:* eine Zahl $k \in \mathbb{N}$ in unärer Kodierung und eine Instanz $P$ des Postschen
Korrespondenzproblems, d.h. eine endliche Folge von Wortpaaren
> $$P = (x_1, x_2), \ldots, (x_n, y_n)$$
> über einem Alphabet $\Sigma$, also $x_i, y_i \in \Sigma^{+}$ für $1 \leq i \leq n$. \
> *Gefragt:* Gibt es eine Lösung für $P$ mit maximaler Länge $k$? Oder genauer: Gibt es eine Folge von Zahlen $i_1, \ldots, i_\ell$, so dass gilt:
> $$x_{i_1} \ldots x_{i_\ell} = y_{i_1} \ldots y_{i_\ell}$$
> wobei $0 < \ell \leq k$ ist und $i_j \in \{1, \ldots, n\}$ für alle $j = 1, \ldots, \ell$? \
> **b)** Zeigen Sie, dass *PCP-k* in *NP* liegt.

Eine Lösung $(i_1, \ldots, i_\ell)$ des allgemeinen *PCP* lässt sich in polynomieller Zeit verifizieren. Damit lässt sich auch *PCP-k* mit $\ell \leq k$ in polynomieller Zeit verifizieren. $\Rightarrow \text{PCP-k} \in \text{NP}$
