## [8. Übungsblatt](https://web.archive.org/web/20241212082357/https://iccl.inf.tu-dresden.de/w/images/e/ec/TheoLog24-Uebung-08.pdf)

### Aufgabe P

> Geben Sie für die Formel
> $$F = \forall x.\exists y.(p(c_1, z) \land (q(x, c_2, z) \lor p(c_2, y)))$$
> wobei $c_1$, $c_2$ Konstanten sind, folgendes an: \
> **a)** die Menge aller Teilformeln;

 1. $p(c_1, z)$
 2. $q(x, c_2, z)$
 3. $p(c_2, y)$
 4. $q(x, c_2, z) \lor p(c_2, y)$
 5. $p(c_1, z) \land (q(x, c_2, z) \lor p(c_2, y))$
 6. $\exists y.(p(c_1, z) \land (q(x, c_2, z) \lor p(c_2, y)))$
 7. $\forall x.\exists y.(p(c_1, z) \land (q(x, c_2, z) \lor p(c_2, y)))$

> Geben Sie für die Formel
> $$F = \forall x.\exists y.(p(c_1, z) \land (q(x, c_2, z) \lor p(c_2, y)))$$
> wobei $c_1$, $c_2$ Konstanten sind, folgendes an: \
> **b)** die Menge aller Terme;

  * Variablen: $x$, $y$, $z$
  * Konstanten: $c_1$, $c_2$
  * Funktionen: $\emptyset$

> Geben Sie für die Formel
> $$F = \forall x.\exists y.(p(c_1, z) \land (q(x, c_2, z) \lor p(c_2, y)))$$
> wobei $c_1$, $c_2$ Konstanten sind, folgendes an: \
> **c)** die Menge aller Variablen, mit Unterscheidung freier und gebundener Variablen;

  * gebundene Variablen: $x$, $y$
  * freie Variablen: $z$

> Geben Sie für die Formel
> $$F = \forall x.\exists y.(p(c_1, z) \land (q(x, c_2, z) \lor p(c_2, y)))$$
> wobei $c_1$, $c_2$ Konstanten sind, folgendes an: \
> **d)** ein Interpretation $I$ und eine Zuweisung $Z$ für $I$, so dass $I, Z \models F$.

  * $I = (\Delta^I, \cdot^I)$
      * $\Delta^I = \{ a, b, \ldots \}$
      * $c_1^I = a$
      * $c_2^I = b$
      * $p^I = \left\{ (a, z) | z\text{ belieblig} \right\} \cup \left\{ (b, y) | y\text{ beliebig} \right\}$
      * $q^I = \emptyset$
  * $Z = \left\{ z \mapsto \ldots \right\}$ Die Belegung von $z$ ist beliebig.

| $\forall x.\exists y. ($ | $p(c_1, z)$ | $\land ($ | $q(x, c_2, z)$ | $\lor$ | $p(c_2, y)$ | $))$ |
|:------------------------:|:-----------:|:---------:|:--------------:|:------:|:-----------:|:----:|
| $\forall x.\exists y. ($ |  $p(a, z)$  | $\land ($ |  $q(x, b, z)$  | $\lor$ |  $p(b, y)$  | $))$ |
| $\forall x.\exists y. ($ |    $\top$   | $\land ($ |     $\bot$     | $\lor$ |    $\top$   | $))$ |

### Aufgabe Q

> Zeigen Sie die folgenden Aussagen: \
> **a)** Es gilt $\left\{ F \right\} \models G$ genau dann, wenn $F \rightarrow G$ allgemeingültig ist.

$\left\{ F \right\} \models G$: [jedes Modell von $F$ ist auch ein Modell von $G$](https://web.archive.org/web/20250222123656/https://iccl.inf.tu-dresden.de/w/images/c/c8/TheoLog2024-Vorlesung-14-print.pdf#page=17)

+:-----------------:+:-----------------:+:--------------+
| $I \not\models F$ | $I \not\models G$ | erfüllt       |
+-------------------+-------------------+---------------+
| $I \not\models F$ | $I \models G$     | erfüllt       |
+-------------------+-------------------+---------------+
| $I \models F$     | $I \not\models G$ | nicht erfüllt |
+-------------------+-------------------+---------------+
| $I \models F$     | $I \models G$     | erfüllt       |
+-------------------+-------------------+---------------+

**TODO**

siehe [14. Vorlesung, Seite 9: Formeln interpretieren](https://web.archive.org/web/20250222123656/https://iccl.inf.tu-dresden.de/w/images/c/c8/TheoLog2024-Vorlesung-14-print.pdf#page=9)

> Zeigen Sie die folgenden Aussagen: \
> **b)** Es gilt $\{F_1, \ldots, F_k\} \models G$ genau dann, wenn $\displaystyle \bigwedge_{i=1}^k F_i \rightarrow G$ allgemeingültig ist.

siehe [Deduktionstheorem auf Wikipedia](https://de.wikipedia.org/wiki/Deduktionstheorem?useskin=vector#Das_Deduktionstheorem_f%C3%BCr_semantische_Folgerungen_%28%E2%8A%A8%29)

**TODO**

### Aufgabe R

> Seien $F$, $G$ Formeln und $x$ eine Variable. Zeigen Sie, dass dann gilt $\exists x.(F \rightarrow G) \equiv \forall x.F \rightarrow \exists x.G$.

  * $\forall x. F \rightarrow \exists x. G$
  * $\lnot \forall x. F \lor \exists x. G$
  * $\exists x. \lnot F \lor \exists x. G$
  * Es handelt sich um zwei verschiedene $x$, für $\lor$ ist aber egal, ob eine der Bedingungen vom eigenen $x$ erfüllt werden oder ein allgemeines $x$ eine der Bedingungen erfüllt, deshalb können die Existenzquantoren hier zusammengefasst werden.
  * $\exists x. (\lnot F \lor G)$ 
  * $\exists x. (F \rightarrow G)$

### Aufgabe 8.1

> Gegeben sei ein Universum aus verschiedenen Personen und Speisen und ein Prädikat $\text{mag}$, so dass $\text{mag}(x, y)$ ausdrückt "x mag y". \
> **a)** "Übersetzen" Sie folgende prädikatenlogische Formeln in natürlichsprachlich formulierte Aussagen:
>
>  1. $\forall x.\text{mag}(x, \text{Eiscreme})$.
>  2. $\forall x.\exists y.\text{mag}(x, y)$.
>  3. $\forall x.\forall y.\text{mag}(x, y) \lor \lnot \text{mag}(x, y)$.

 1. Jeder mag Eiscreme.
 2. Jeder mag irgendwas.
 3. **TODO**

> Gegeben sei ein Universum aus verschiedenen Personen und Speisen und ein Prädikat $\text{mag}$, so dass $\text{mag}(x, y)$ ausdrückt "x mag y". \
> **a)** "Übersetzen" Sie folgende natürlichsprachlich formulierte Aussagen in prädikatenlogische
Formeln:
>
>  1. Tom mag keinen Fisch.
>  2. Jeder, der Pizza mag, mag auch Spaghetti.
>  3. Es gibt niemanden, der alles mag.

 1. $\lnot \text{mag}(\text{Tom}, \text{Fisch})$
 2. $\forall x.\text{mag}(x, \text{Pizza}) \rightarrow \text{mag}(x, \text{Spaghetti})$
 3. $\forall x.\exists y.\lnot \text{mag}(x, y)$

### Aufgabe 8.2

> Welche der angegebenen Strukturen sind Modelle der folgenden Formel?
> $$\forall x. p(x, x) \land \forall x, y. ((p(x, y) \land p(y, x)) \rightarrow x \approx y) \land \forall x, y, z. ((p(x, y) \land p(y, z)) \rightarrow p(x, z))$$
> **a)** $I_1$ mit Grundmenge $\mathbb{N}$ und $p^{I_1} = \{(m, n) | m < n\}$;

$I_1$ ist kein Modell, da $\forall x.p(x, x)$ ($p(a, b) := (a < b)$) nicht erfüllt ist.

> Welche der angegebenen Strukturen sind Modelle der folgenden Formel?
> $$\forall x. p(x, x) \land \forall x, y. ((p(x, y) \land p(y, x)) \rightarrow x \approx y) \land \forall x, y, z. ((p(x, y) \land p(y, z)) \rightarrow p(x, z))$$
> **b)** $I_2$ mit Grundmenge $\mathbb{N}$ und $p^{I_2} = \{(n, n + 1) | n \in \mathbb{N}\}$;

$I_2$ ist kein Modell, da $\forall x.p(x, x)$ ($p(a, b) := (a + 1 = b)$) nicht erfüllt ist.

> Welche der angegebenen Strukturen sind Modelle der folgenden Formel?
> $$\forall x. p(x, x) \land \forall x, y. ((p(x, y) \land p(y, x)) \rightarrow x \approx y) \land \forall x, y, z. ((p(x, y) \land p(y, z)) \rightarrow p(x, z))$$
> **c)** $I_3$ mit Grundmenge $\mathbb{N}$ und $p^{I_3} = \{(m, n) | \text{$m$ teilt $n$}\}$;

$I_3$ ist ein Modell.

> Welche der angegebenen Strukturen sind Modelle der folgenden Formel?
> $$\forall x. p(x, x) \land \forall x, y. ((p(x, y) \land p(y, x)) \rightarrow x \approx y) \land \forall x, y, z. ((p(x, y) \land p(y, z)) \rightarrow p(x, z))$$
> **d)** $I_4$ mit Grundmenge $\Sigma^{*}$ für ein Alphabet $\Sigma$ und $p^{I_4} = \{(x, y) | \text{$x$ ist Präfix von $y$}\}$;

$I_4$ ist ein Modell.

> Welche der angegebenen Strukturen sind Modelle der folgenden Formel?
> $$\forall x. p(x, x) \land \forall x, y. ((p(x, y) \land p(y, x)) \rightarrow x \approx y) \land \forall x, y, z. ((p(x, y) \land p(y, z)) \rightarrow p(x, z))$$
> **e)** $I_5$ mit Grundmenge $\mathcal{P}(M)$ für eine Menge $M$ und $p^{I_5} = \{(X, Y) | X \subseteq Y\}$;

$I_5$ ist ein Modell.

### Aufgabe 8.3

> **a)** Geben Sie je eine erfüllbare Formel in Prädikatenlogik mit Gleichheit an, so dass alle Modelle
>
>  1. höchstens drei,
>  2. mindestens drei,
>  3. genau drei
>
> Elemente in der Grundmenge besitzen.

 1. **TODO**
 2. **TODO**
 3. **TODO**

> **b)** Geben Sie je eine erfüllbare Formel in Prädikatenlogik mit Gleichheit an, so dass das zweistellige Prädikatensymbol $p$ in jedem Modell als der Graph einer
>
>  1. injektiven Funktion,
>  2. surjektiven Funktion,
>  3. bijektiven Funktion
>
> interpretiert wird. (Der Graph einer Funktion $f : A \rightarrow B$ ist die Relation $\{(x, y) \in A \times B | f(x) = y\}$.)

 1. $\forall x_1 \in A, x_2 \in A, y \in B. ((p(x_1, y) \land p(x_2, y)) \rightarrow x_1 \approx x_2$
 2. $\forall y \in B. \exists x \in A. p(x, y)$
 3. $(\forall x_1 \in A, x_2 \in A, y \in B. ((p(x_1, y) \land p(x_2, y)) \rightarrow x_1 \approx x_2) \land (\forall y \in B. \exists x \in A. p(x, y))$

### Aufgabe 8.4

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **a)** Sind $\Gamma$ und $\Gamma'$ Mengen von prädikatenlogischen Formeln, dann folgt aus $\Gamma \subseteq \Gamma'$ und $\Gamma \models F$ auch $\Gamma' \models F$.

wahr **TODO**

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **b)** Jede aussagenlogische Formel ist eine prädikatenlogische Formel.

wahr, Aussagenlogik ist Prädikatenlogik ohne Prädikate, Variablen oder Quantoren

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **c)** Eine prädikatenlogische Formel $F$ ist genau dann allgemeingültig, wenn $\lnot F$ unerfüllbar
ist.

wahr **TODO**

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **d)** Es gilt $\{\forall x, y. (p(x, y) \rightarrow p(y, x)), \forall x, y, z. ((p(x, y) \land p(y, z)) \rightarrow p(x, z))\} \models \forall x. p(x, x)$

  * $\forall x, y. (p(x, y) \rightarrow p(y, x))$ bedeutet, dass $p$ kommuntativ ist \
    $(x, y) \in p^I \Leftrightarrow (y, x) \in p^I$
  * $\forall x, y, z. ((p(x, y) \land p(y, z)) \rightarrow p(x, z))$ bedeutet, dass $p$ transitiv ist \
    $(x, y) \in p^I\text{ und }(y, z) \in p^I \Rightarrow (x, z) \in p^I$
  * $\forall x. p(x, x)$ bedeutet, dass $p$ reflexiv ist \
    $(x, x) \in p^I$
  * Für alle $(x, y) \in p^I$ muss gelten, dass auch $(y, x) \in p^I$ und durch die Transitivität von $(x, y) \in p^I$ und $(y, x) \in p^I$ folgt $(x, x) \in p^I$.

wahr
