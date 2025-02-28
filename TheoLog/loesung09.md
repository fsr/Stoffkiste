## [9. Übungsblatt](https://web.archive.org/web/20241212082357/https://iccl.inf.tu-dresden.de/w/images/2/26/TheoLog24-Uebung-09.pdf)

### Aufgabe S

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **a)** Jede Formel in Pränexform ist in Skolemform.

falsch, Formeln in Pränexform können einen $\exists$-Quantor enthalten.

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **b)** Jede Formel in Skolemform ist in Pränexform.

wahr, alle $\forall$-Quantoren stehen am Anfang der Formel.

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **c)** Jede Formel ist äquivalent zu einer bereinigten Formel.

wahr, gebundene Variablen können umbenannt werden.

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **d)** Jede Formel ist äquivalent zu einer bereinigten Formel in Pränexform.

wahr, bei Umwandlung in Pränexform finden nur äquivalenzerhaltende Operation statt.

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **e)** Jede Formel ist äquivalent zu einer bereinigten Formel in Skolemform.

falsch, eine Formel in Skolemform ist nur erfüllbarkeits-äquivalent.

### Aufgabe T

> Formalisieren Sie die folgenden Aussagen in Prädikatenlogik: \
> **a)** Jeder Drache ist glücklich, wenn alle seine Drachen-Kinder fliegen können.

$\forall d. ((\text{drache}(d) \land \forall k. (\text{kind}(k, d) \rightarrow \text{fliegen}(k))) \rightarrow \text{glücklich}(d))$

> Formalisieren Sie die folgenden Aussagen in Prädikatenlogik: \
> **b)** Grüne Drachen können fliegen.

$\forall d. ((\text{drache}(d) \land \text{grün}(d)) \rightarrow \text{fliegen}(d))$

> Formalisieren Sie die folgenden Aussagen in Prädikatenlogik: \
> **c)** Ein Drache ist grün, wenn er Kind mindestens eines grünen Drachen ist.

$\forall d. ((\text{drache}(d) \land (\exists e. (\text{drache}(e) \land (\text{grün}(e) \land \text{kind}(d, e))))) \rightarrow \text{grün}(d))$

> Formalisieren Sie die folgenden Aussagen in Prädikatenlogik: \
> **d)** Alle grünen Drachen sind glücklich. \
> Zeigen Sie, dass die letzte Aussage aus den ersten drei folgt.

$\forall d. ((\text{drache}(d) \land \text{grün}(d)) \rightarrow \text{glücklich}(d)$

### Aufgabe 9.1

> Formalisieren Sie Bertrand Russells Barbier-Paradoxon
>
> > Der Barbier rasiert genau diejenigen Personen, die sich nicht selbst rasieren.
>
> als eine prädikatenlogische Formel und zeigen Sie, dass diese unerfüllbar ist.
>
> Nehmen Sie dafür an, dass der Barbier durch eine Konstante $b$ repräsentiert wird und dass für die Relation *\* rasiert y* durch ein zweistelliges Prädikatensybol $r$ ausgedrückt wird.

  * $\forall x. \lnot r(x, x) \leftrightarrow r(b, x)$
  * Für $x := b$:
      * $\lnot r(b, b) \leftrightarrow r(b, b)$
      * $r$ kann also nicht definiert werden, um die Formel zu erfüllen.

### Aufgabe 9.2

> Bestimmen Sie zu jeder der folgenden Formeln eine äquivalente bereinigte Formel in Pränexform. \
> **a)** $\forall x. (p(x, x) \leftrightarrow \lnot \exists y. q(x, y))$

 1. $\forall x. (p(x, x) \leftrightarrow \lnot \exists y. q(x, y))$
 3. Äquivalenz auflösen: $\forall x. ((p(x, x) \rightarrow \lnot \exists y. q(x, y)) \land (\lnot \exists y. q(x, y) \rightarrow p(x, x)))$
 2. Bereinigung: $\forall x. ((p(x, x) \rightarrow \lnot \exists y_1. q(x, y_1)) \land (\lnot \exists y_2. q(x, y_2) \rightarrow p(x, x)))$
 4. Implikationen auflösen: $\forall x. ((\lnot p(x, x) \lor \lnot \exists y_1. q(x, y_1)) \land (\exists y_2. q(x, y_2) \lor p(x, x)))$
 5. $\lnot \exists x. A \Leftrightarrow \forall x. \lnot A$: \
    $\forall x. ((\lnot p(x, x) \lor \forall y_1. \lnot q(x, y_1)) \land (\exists y_2. q(x, y_2) \lor p(x, x)))$
 6. Quantoren nach vorne ziehen: $\forall x. \forall y_1. \exists y_2. ((\lnot p(x, x) \lor \lnot q(x, y_1)) \land (q(x, y_2) \lor p(x, x)))$

> Bestimmen Sie zu jeder der folgenden Formeln eine äquivalente bereinigte Formel in Pränexform. \
> **b)** $\forall x. p(f(x, x)) \lor (q(x, z) \rightarrow \exists x.p(g(x, y, z)))$

 1. $\forall x. p(f(x, x)) \lor (q(x, z) \rightarrow \exists x. p(g(x, y, z)))$
 2. Bereinigung: $\forall x_1. p(f(x_1, x_1)) \lor (q(x_1, z) \rightarrow \exists x_2. p(g(x_2, y, z)))$
 3. Implikation auflösen: $\forall x_1. p(f(x_1, x_1)) \lor (\lnot q(x_1, z) \lor \exists x_2. p(g(x_2, y, z)))$
 4. Quantoren nach vorne ziehen: $\forall x_1. \exists x_2. p(f(x_1, x_1)) \lor (\lnot q(x_1, z) \lor p(g(x_2, y, z)))$

> Bestimmen Sie zu jeder der folgenden Formeln eine äquivalente bereinigte Formel in Pränexform. \
> **c)** $\forall x. p(x) \land (\forall y. \exists x. q(x, g(y)) \rightarrow \exists y. (r(f(y)) \lor \lnot q(y, x)))$

 1. $\forall x. p(x) \land (\forall y. \exists x. q(x, g(y)) \rightarrow \exists y. (r(f(y)) \lor \lnot q(y, x)))$
 2. Bereinigung: $\forall x_1. p(x_1) \land (\forall y_1. \exists x_2. q(x_2, g(y_1)) \rightarrow \exists y_2. (r(f(y_2)) \lor \lnot q(y_2, x_1)))$
 3. Implikationen auflösen: $\forall x_1. p(x_1) \land (\lnot \forall y_1. \exists x_2. q(x_2, g(y_1)) \lor \exists y_2. (r(f(y_2)) \lor \lnot q(y_2, x_1)))$
 4. $\lnot \forall y_1. \exists x_2. A \Leftrightarrow \exists y_1. \forall x_2. \lnot A$: \
    $\forall x_1. p(x_1) \land (\exists y_1. \forall x_2. \lnot q(x_2, g(y_1)) \lor \exists y_2. (r(f(y_2)) \lor \lnot q(y_2, x_1)))$
 5. Quantoren nach vorne ziehen: $\forall x_1. \exists y_1. \forall x_2. \exists y_2. (p(x_1) \land (\lnot q(x_2, g(y_1)) \lor (r(f(y_2)) \lor \lnot q(y_2, x_1))))$

### Aufgabe 9.3

> Bestimmen Sie zu jeder der folgenden Formeln eine erfüllbarkeitsäquivalente bereinigte Formel in Skolemform. \
> **a)** $p(x) \lor \exists x. q(x, x) \lor \forall x. p(f(x))$

 1. $p(x) \lor \exists x. q(x, x) \lor \forall x. p(f(x))$
 2. $p(x) \lor \exists x_1. q(x_1, x_1) \lor \forall x_2. p(f(x_2))$
 3. $\exists x_1. \forall x_2. (p(x) \lor q(x_1, x_1) \lor p(f(x_2)))$
 4. $x_1 \Rightarrow a_1$: \
    $\forall x_2. (p(x) \lor q(a_1, a_1) \lor p(f(x_2)))$

> Bestimmen Sie zu jeder der folgenden Formeln eine erfüllbarkeitsäquivalente bereinigte Formel in Skolemform. \
> **b)** $\forall x. \exists y. q(f(x), g(y)) \land \forall x. (p(x, y, y) \lor q(h(y), x))$

 1. $\forall x. \exists y. q(f(x), g(y)) \land \forall x. (p(x, y, y) \lor q(h(y), x))$
 2. $\forall x_1. \exists y_1. q(f(x_1), g(y_1)) \land \forall x_2. (p(x_2, y, y) \lor q(h(y), x_2))$
 3. $\forall x_1. \exists y_1. \forall x_2. (q(f(x_1), g(y_1)) \land (p(x_2, y, y) \lor q(h(y), x_2)))$
 4. $y_1 \Rightarrow f_1(x_1)$: \
    $\forall x_1. \forall x_2. (q(f(x_1), g(f_1(x_1))) \land (p(x_2, y, y) \lor q(h(y), x_2)))$

> Bestimmen Sie zu jeder der folgenden Formeln eine erfüllbarkeitsäquivalente bereinigte Formel in Skolemform. \
> **c)** $\forall x. \forall x. (p(x) \leftrightarrow q(x, x)) \lor \exists x. \forall y. (q(x, g(y, z)) \land \exists z. q(z, z))$

 1. $\forall x. \forall x. (p(x) \leftrightarrow q(x, x)) \lor \exists x. \forall y. (q(x, g(y, z)) \land \exists z. q(z, z))$
 2. $\forall x. \forall x. ((p(x) \rightarrow q(x, x)) \land (q(x, x) \rightarrow p(x))) \lor \exists x. \forall y. (q(x, g(y, z)) \land \exists z. q(z, z))$
 3. $\forall x_1. \forall x_2. ((p(x_2) \rightarrow q(x_2, x_2)) \land (q(x_2, x_2) \rightarrow p(x_2))) \lor \exists x_3. \forall y_1. (q(x_3, g(y_1, z)) \land \exists z_1. q(z_1, z_1))$ ($y \Rightarrow y_1$ ist nicht notwendig, schadet aber auch nicht.)
 4. $\forall x_1. \forall x_2. ((\lnot p(x_2) \lor q(x_2, x_2)) \land (\lnot q(x_2, x_2) \lor p(x_2))) \lor \exists x_3. \forall y_1. (q(x_3, g(y_1, z)) \land \exists z_1. q(z_1, z_1))$
 5. $\forall x_1. \forall x_2. \exists x_3. \forall y_1. \exists z_1. (((\lnot p(x_2) \lor q(x_2, x_2)) \land (\lnot q(x_2, x_2) \lor p(x_2))) \lor (q(x_3, g(y_1, z)) \land q(z_1, z_1)))$
 6. $x_3 \Rightarrow f_{x_3}(x_1, x_2)$: \
    $\forall x_1. \forall x_2. \forall y_1. \exists z_1. (((\lnot p(x_2) \lor q(x_2, x_2)) \land (\lnot q(x_2, x_2) \lor p(x_2))) \lor (q(f_{x_3}(x_1, x_2), g(y_1, z)) \land q(z_1, z_1)))$
 7. $z_1 \Rightarrow f_{z_1}(x_1, x_2, y_1)$: \
    $\forall x_1. \forall x_2. \forall y_1. (((\lnot p(x_2) \lor q(x_2, x_2)) \land (\lnot q(x_2, x_2) \lor p(x_2))) \lor (q(f_{x_3}(x_1, x_2), g(y_1, z)) \land q(f_{z_1}(x_1, x_2, y_1), f_{z_1}(x_1, x_2, y_1))))$

### Aufgabe 9.4

> Zeigen Sie, dass Allgemeingültigkeit von Formeln der Prädikatenlogik erster Stufe in Skolemform entscheidbar ist.

> #### [Musterlösung](https://github.com/knowsys/TheoLog/blob/master/Uebungen/uebung-10-04-musterloesung.tex)
>
> Es sei $F$ eine quantorenfreie Formel mit Variablen $x_1, \dots, x_n$. Dann gilt $\forall x_1, \ldots, x_n. F$ ist allgemeingültig $\Leftrightarrow \exists x_1, \ldots, x_n. \lnot F$ ist unerfüllbar $\Leftrightarrow \lnot F [x_1/a_1, \ldots, x_n/a_n]$ ist unerfüllbar (Skolemisierung mit Konstanten $a_1, \ldots, a_n$).
>
> Es ist also $\forall x_1, \ldots, x_n. F$ allgemiengültig genau dann, wenn $\lnot F[x_1/a_1, ... , x_n/a_n]$ unerfüllbar ist. Letzteres ist aber essentiell eine aussagenlogische Formel, und deren Erfüllbarkeit ist entscheidbar.
