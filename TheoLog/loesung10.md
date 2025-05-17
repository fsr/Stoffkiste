## [10. Übungsblatt](https://web.archive.org/web/20241212082357/https://iccl.inf.tu-dresden.de/w/images/0/0f/TheoLog24-Uebung-10.pdf)

### Aufgabe U

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **a)** Zwei prädikatenlogische Formeln $F$ und $G$ sind äquivalent, wenn die Formel $F \leftrightarrow G$ allgemeingültig ist.

wahr, **TODO**

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **b)** Jede erfüllbare Formel der Prädikatenlogik erster Stufe hat ein endliches Modell.

falsch, $\Delta^I$ kann unendlich sein.

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **c)** Jede erfüllbare Formel der Prädikatenlogik erster Stufe hat ein abzählbares Modell.

wahr, siehe [Satz von Löwenheim-Skolem](https://de.wikipedia.org/wiki/Satz_von_L%C3%B6wenheim-Skolem)

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **d)** Jede Skolemformel hat höchstens eine Herbrand-Interpretation.

**TODO**

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **e)** Jede Skolemformel hat mindestens ein Herbrand-Modell.

falsch, lediglich jede erfüllbare Skolemform hat ein Herbrand-Modell.

### Aufgabe V

> Zeigen Sie, dass man das Resolutionsverfahren der Prädikatenlogik erster Stufe auch zum Nachweis von semantischen Konsequenzen nutzen kann, indem Sie die Äquivalenz der folgenden Aussagen nachweisen: \
> **a)** $\Gamma \models F$.

**TODO**

> Zeigen Sie, dass man das Resolutionsverfahren der Prädikatenlogik erster Stufe auch zum Nachweis von semantischen Konsequenzen nutzen kann, indem Sie die Äquivalenz der folgenden Aussagen nachweisen: \
> **b)** $\Gamma \cup {\lnot F}$ ist unerfüllbar.

**TODO**

> Zeigen Sie, dass man das Resolutionsverfahren der Prädikatenlogik erster Stufe auch zum Nachweis von semantischen Konsequenzen nutzen kann, indem Sie die Äquivalenz der folgenden Aussagen nachweisen: \
> **c)** $\bigwedge \Gamma \rightarrow F$ ist allgemeingültig. \
> Hierbei sei $\bigwedge \Gamma = \gamma_1 \land \ldots \land \gamma_n$ für $\Gamma = \{\gamma_1, \ldots, \gamma_n\}$.

**TODO**

> Zeigen Sie, dass man das Resolutionsverfahren der Prädikatenlogik erster Stufe auch zum Nachweis von semantischen Konsequenzen nutzen kann, indem Sie die Äquivalenz der folgenden Aussagen nachweisen: \
> **d)** $\bigwedge \Gamma \land \lnot F$ ist unerfüllbar. \
> Hierbei sei $\bigwedge \Gamma = \gamma_1 \land \ldots \land \gamma_n$ für $\Gamma = \{\gamma_1, \ldots, \gamma_n\}$.

**TODO**

### Aufgabe 10.1

> Bestimmen Sie jeweils einen allgemeinsten Unifikator für die folgenden Unifikationsprobleme, oder begründen Sie, warum kein allgemeinster Unifikator existiert. Verwenden Sie hierfür den Algorithmus aus der Vorlesung. Dabei sind $x$, $y$ Variablen und $a$, $b$ Konstanten. \
> **a)** $\{ f(x) \dot= g(x, y), y \dot= f(a) \}$

 1. $\{ f(x) \dot= g(x, y), y \dot= f(a) \}$
 2. Eliminierung: $\{ f(x) \dot= g(x, f(a)), y \dot= f(a) \}$
 3. Löschen, Zerlegung, Orietierung oder Eliminierung nicht möglich

> Bestimmen Sie jeweils einen allgemeinsten Unifikator für die folgenden Unifikationsprobleme, oder begründen Sie, warum kein allgemeinster Unifikator existiert. Verwenden Sie hierfür den Algorithmus aus der Vorlesung. Dabei sind $x$, $y$ Variablen und $a$, $b$ Konstanten. \
> **b)** $\{ f(g(x, y)) \dot= f(g(a, h(b))) \}$

 1. $\{ f(g(x, y)) \dot= f(g(a, h(b))) \}$
 2. Zerlegung: $\{ g(x, y) \dot= g(a, h(b)) \}$
 3. Zerlegung: $\{ x \dot= a, y \dot= h(b) \}$
 4. $\{ x \mapsto a, y \mapsto h(b) \}$

> Bestimmen Sie jeweils einen allgemeinsten Unifikator für die folgenden Unifikationsprobleme, oder begründen Sie, warum kein allgemeinster Unifikator existiert. Verwenden Sie hierfür den Algorithmus aus der Vorlesung. Dabei sind $x$, $y$ Variablen und $a$, $b$ Konstanten. \
> **c)** $\{ f(x, y) \dot= x, y \dot= g(x) \}$

 1. $\{ f(x, y) \dot= x, y \dot= g(x) \}$
 2. Eliminierung: $\{ f(x, g(x)) \dot= x, y \dot= g(x) \}$
 3. Orientierung: $\{ x \dot= f(x, g(x)), y \dot= g(x) \}$
 4. Löschen, Zerlegung, Orietierung oder Eliminierung nicht möglich

> Bestimmen Sie jeweils einen allgemeinsten Unifikator für die folgenden Unifikationsprobleme, oder begründen Sie, warum kein allgemeinster Unifikator existiert. Verwenden Sie hierfür den Algorithmus aus der Vorlesung. Dabei sind $x$, $y$ Variablen und $a$, $b$ Konstanten. \
> **d)** $\{ f(g(x), y) \dot= f(g(x), a), g(x) \dot= g(h(a)) \}$

 1. $\{ f(g(x), y) \dot= f(g(x), a), g(x) \dot= g(h(a)) \}$
 2. Zerlegung: $\{ g(x) \dot= g(x), y \dot= a, g(x) \dot= g(h(a)) \}$
 3. Löschen: $\{ g(x) \dot= g(x), g(x) \dot= g(h(a)) \}$
 4. Zerlegung: $\{ y \dot= a, x \dot= h(a) \}$
 5. $\{ x \mapsto h(a), y \mapsto a \}$

### Aufgabe 10.2

> Sei $p$ ein $k$-stelliges Prädikatssymbol und seien $s_1, \ldots, s_k$, $t_1, \ldots, t_k$ Terme. Ferner sei $\theta$ eine Substitution. Hierbei bezeichne $\exists [F]$ und $\forall [F]$ jeweils den Existenz- bzw. Allabschluss über alle in $F$ syntaktisch vorkommenden Variablen. Welche der folgenden Aussagen sind richtig? Begründen Sie jeweils Ihre Antwort. \
> **a)** Falls $p(t_1, \ldots, t_k)$ und $p(s_1, \ldots, s_k)$ unifizierbar sind, so ist folgende Formel der Prädikatenlogik mit Gleichheit allgemeingültig:
> $$\exists [(s_1 \approx t_1) \land \ldots \land (s_k \approx t_k)]$$
> **b)** Falls $\exists [(s_1 \approx t_1) \land \ldots \land (s_k \approx t_k)]$ erfüllbar ist, so sind $p(t_1, \ldots, t_k)$ und $p(s_1, \ldots, s_k)$ unifizierbar.

beide wahr, $p(t_1, \ldots, t_k)$ und $p(s_1, \ldots, s_k)$ sind unifizierbar genau dann, wenn es eine Substitution gibt, sodass $p(t_1, \ldots, t_k) \equiv p(s_1, \ldots, s_k)$. Wenn $\exists [(s_1 \approx t_1) \land \ldots \land (s_k \approx t_k)]$ erfüllt ist, gibt es eine Substitution bei der $s_i \approx t_i$ und damit muss auch $p(t_1, \ldots, t_k) \equiv p(s_1, \ldots, s_k)$ gelten.

> Sei $p$ ein $k$-stelliges Prädikatssymbol und seien $s_1, \ldots, s_k$, $t_1, \ldots, t_k$ Terme. Ferner sei $\theta$ eine Substitution. Hierbei bezeichne $\exists [F]$ und $\forall [F]$ jeweils den Existenz- bzw. Allabschluss über alle in $F$ syntaktisch vorkommenden Variablen. Welche der folgenden Aussagen sind richtig? Begründen Sie jeweils Ihre Antwort. \
> **c)** Ist $\theta$ ein Unifikator für $p(t_1, \ldots, t_k)$ und $p(s_1, \ldots, s_k)$, so ist folgende Formel der Prädikatenlogik mit Gleichheit allgemeingültig:
> $$\forall [(s_1 \theta \approx t_1 \theta) \land \ldots \land (s_k \theta \approx t_k \theta)]$$
> **d)** Ist $\forall [(s_1 \theta \approx t_1 \theta) \land \ldots \land (s_k \theta \approx t_k \theta)]$ allgemeingültig, so ist $\theta$ ein Unifikator für $p(t_1, \ldots, t_k)$ und $p(s_1, \ldots, s_k)$.

**TODO**

beide falsch, wenn $\theta = \left\{ s_1 \mapsto c, t_1 \mapsto c, s_2 \mapsto a_2, t_2 \mapsto b_2, \ldots \right\}$ mit $a_i \neq b_i$ und $p = \left\{ (c, a_2, a_3, \ldots), (c, b_2, b_3, \ldots) \right\}$ dann wäre zwar $p(t_1 \theta, \ldots, t_k \theta) \equiv p(s_1 \theta, \ldots, s_k \theta)$ aber $s_i \theta \neq t_i \theta$ für $i \geq 2$.

> Sei $p$ ein $k$-stelliges Prädikatssymbol und seien $s_1, \ldots, s_k$, $t_1, \ldots, t_k$ Terme. Ferner sei $\theta$ eine Substitution. Hierbei bezeichne $\exists [F]$ und $\forall [F]$ jeweils den Existenz- bzw. Allabschluss über alle in $F$ syntaktisch vorkommenden Variablen. Welche der folgenden Aussagen sind richtig? Begründen Sie jeweils Ihre Antwort. \
> **e)** Ist $\theta = \{ x_1 \mapsto u_1, \ldots, x_n \mapsto u_n \}$ ein Unifikator für $p(t_1, \ldots, t_k)$ und $p(s_1, \ldots, s_k)$, so ist folgende Formel der Prädikatenlogik mit Gleichheit allgemeingültig:
> $$\forall [((x_1 \approx u_1) \land \ldots \land (x_k \approx u_k)) \rightarrow ((s_1 \approx t_1) \land \ldots \land (s_k \approx t_k))]$$

**TODO**

> Sei $p$ ein $k$-stelliges Prädikatssymbol und seien $s_1, \ldots, s_k$, $t_1, \ldots, t_k$ Terme. Ferner sei $\theta$ eine Substitution. Hierbei bezeichne $\exists [F]$ und $\forall [F]$ jeweils den Existenz- bzw. Allabschluss über alle in $F$ syntaktisch vorkommenden Variablen. Welche der folgenden Aussagen sind richtig? Begründen Sie jeweils Ihre Antwort. \
> **f)** Ist $\theta = \{ x_1 \mapsto u_1, \ldots, x_n \mapsto u_n \}$ ein Unifikator für $p(t_1, \ldots, t_k)$ und $p(s_1, \ldots, s_k)$, so ist folgende Formel der Prädikatenlogik mit Gleichheit allgemeingültig:
> $$\forall [((s_1 \approx t_1) \land \ldots \land (s_k \approx t_k)) \rightarrow ((x_1 \approx u_1) \land \ldots \land (x_k \approx u_k))]$$

**TODO**

### Aufgabe 10.3

> Zeigen Sie mittels prädikatenlogischer Resolution folgende Aussagen: \
> **a)** Die Aussage "Der Professor ist glücklich, wenn alle seine Studenten Logik mögen" hat als Folgerung "Der Professor ist glücklich, wenn er keine Studenten hat".

$P(x)$ ... $x$ ist ein Professor \
$S(x, y)$ ... $x$ ist Student von $y$ \
$L(x)$ ... $x$ mag Logik \
$G(x)$ ... $x$ ist glücklich

 1. "Der Professor ist glücklich, wenn alle seine Studenten Logik mögen"
     1. $\forall p. ((P(p) \land \forall s. (S(s, p) \rightarrow L(s))) \rightarrow G(p))$
     2. $\forall p. (\lnot (P(p) \land \forall s. (S(s, p) \rightarrow L(s))) \lor G(p))$
     3. $\forall p. ((\lnot P(p) \lor \lnot \forall s. (\lnot S(s, p) \lor L(s))) \lor G(p))$
     4. $\forall p. ((\lnot P(p) \lor \exists s. \lnot (\lnot S(s, p) \lor L(s))) \lor G(p))$
     5. $\forall p. ((\lnot P(p) \lor \exists s. (S(s, p) \land \lnot L(s))) \lor G(p))$
     6. $\forall p. \exists s. ((\lnot P(p) \lor (S(s, p) \land \lnot L(s))) \lor G(p))$
     7. $\forall p. \exists s. ((\lnot P(p) \lor S(s, p) \lor G(p)) \land (\lnot P(p) \lor \lnot L(s) \lor G(p)))$
     8. $\forall p. ((\lnot P(p) \lor S(f_s(p), p) \lor G(p)) \land ())$
     9. $\{ \{ \lnot P(p), S(f_s(p), p), G(p) \}, \{ \lnot P(p), \lnot L(f_s(p)), G(p) \} \}$
 2. "Der Professor ist glücklich, wenn er keine Studenten hat"
     1. $\forall p. ((P(p) \land \lnot \exists s. S(s, p)) \rightarrow G(p))$
     2. $\forall p. (\lnot (P(p) \land \lnot \exists s. S(s, p)) \lor G(p))$
     3. $\forall p. (\lnot P(p) \lor \exists s. S(s, p) \lor G(p))$
     4. $\forall p. \exists s. (\lnot P(p) \lor S(s, p) \lor G(p))$
     5. $\forall p. (\lnot P(p) \lor S(f_s(p), p) \lor G(p))$
     6. $\{ \{ \lnot P(p), S(f_s(p), p), G(p) \} \}$

Formel 2.6 ist in 1.7 enthalten, bzw. $\{ \{ \lnot P(p), S(f_s(p), p), G(p) \} \} \subseteq \{ \{ \lnot P(p), S(f_s(p), p), G(p) \}, \{ \lnot P(p), \lnot L(f_s(p)), G(p) \} \}$.

> Zeigen Sie mittels prädikatenlogischer Resolution folgende Aussagen: \
> **b)** In Aufgabe T von Übungsblatt 9 folgt die letzte Aussage 4 aus den ersten drei 1-3:
>
>  1. Jeder Drache ist glücklich, wenn alle seine Drachen-Kinder fliegen können.
>  2. Grüne Drachen können fliegen.
>  3. Ein Drache ist grün, wenn er Kind mindestens eines grünen Drachen ist.
>  4. Alle grünen Drachen sind glücklich.
>
> Zur Vereinfachung darf hier angenommen werden, dass alle Individuen Drachen sind.

$K(x, y)$ ... $x$ ist ein Kind von $y$ \
$F(x)$ ... $x$ kann fliegen \
$H(x)$ ... $x$ ist glücklich \
$G(x)$ ... $x$ ist grün

 1. $\forall d. (\forall k. (K(k, d) \rightarrow F(k)) \rightarrow H(d))$
     1. $\forall d. (\forall k. (K(k, d) \rightarrow F(k)) \rightarrow H(d))$
     2. $\forall d. \lnot (\forall k. (\lnot K(k, d) \lor F(k)) \lor H(d))$
     3. $\forall d. (\exists k. \lnot (\lnot K(k, d) \lor F(k)) \lor H(d))$
     4. $\forall d. (\exists k. (K(k, d) \land \lnot F(k)) \lor H(d))$
     5. $\forall d. ((K(f_k(d), d) \land \lnot F(f_k(d))) \lor H(d))$
     6. $\forall d. ((K(f_k(d), d) \lor H(d)) \land (\lnot F(f_k(d)) \lor H(d)))$
     7. $\left\{ \left\{ K(f_k(d), d), H(d) \right\}, \left\{ \lnot F(f_k(d)), H(d) \right\} \right\}$
 2. $\forall d. (G(d) \rightarrow F(d))$
     1. $\forall d. (\lnot G(d) \lor F(d))$
     2. $\left\{ \left\{ \lnot G(d), F(d) \right\} \right\}$
 3. $\forall d. (\exists e. (G(e) \land K(d, e)) \rightarrow G(d))$
     1. $\forall d. (\lnot \exists e. (G(e) \land K(d, e)) \lor G(d))$
     2. $\forall d. (\forall e. \lnot (G(e) \land K(d, e)) \lor G(d))$
     3. $\forall d. (\forall e. (\lnot G(e) \lor \lnot K(d, e)) \lor G(d))$
     4. $\forall d. \forall e. (\lnot G(e) \lor \lnot K(d, e) \lor G(d))$
     5. $\left\{ \left\{ \lnot G(e), \lnot K(d, e), G(d) \right\} \right\}$

Klauseln:

 1. $\left\{ K(f_k(d), d), H(d) \right\}$
 2. $\left\{ \lnot F(f_k(d)), H(d) \right\}$
 3. $\left\{ \lnot G(d), F(d) \right\}$
 4. $\left\{ \lnot G(e), \lnot K(d, e), G(d) \right\}$
 5. 2 + 3: $\left\{ \lnot G(f_k(d)), H(d) \right\}$
 6. 4 + 5: $\left\{ \lnot G(d), \lnot K(f_k(d), d), H(d) \right\}$
 7. 1 + 6: $\left\{ \lnot G(d), H(d) \right\}$

$\forall d. (G(d) \rightarrow H(d))$ Alle grünen Drachen sind glücklich.

### Aufgabe 10.4

> Gegeben sind die folgenden Formeln in Skolemform.
> $$F = \forall x, y, z. p(x, f(y), g(z, x))$$
> $$G = \forall x, y. (p(a, f(a, x, y)) \lor q(b))$$
> wobei $a$ und $b$ Konstanten sind. \
> **a)** Geben Sie die zugehörigen Herbrand-Universen $\Delta_F$ und $\Delta_G$ an.

$F$: keine Konstanten; Funktionen $f$, $g$:

 1. $\Delta_0 = \left\{ a \right\}$
 2. $\Delta_1 = \Delta_0 \cup \left\{ f(a), g(a, a) \right\}$
 3. $\Delta_2 = \Delta_1 \cup \{$
      * $f(f(a)), f(g(a, a)),$
      * $g(a, f(a)), g(a, g(a, a)),$
      * $g(f(a), a), g(f(a), f(a)), g(f(a), g(a, a)),$
      * $g(g(a, a), a), g(g(a, a), f(a)), g(g(a, a), g(a, a))$

    $\}$
 4. $\ldots$
 5. $\Delta_F = \left\{ f(x), f(f(x)), g(x, y), g(x, f(y)), g(f(x), y), g(f(x), f(y)), \ldots \right\}$

$G$ Konstanten $a$, $b$; Funktionen $f$:

 1. $\Delta_0 = \left\{ a, b \right\}$
 2. $\Delta_1 = \Delta_0 \cup \left\{ f(a, a, a), f(a, a, b), f(a, b, a), f(a, b, b), f(b, a, a), f(b, a, b), f(b, b, a), f(b, b, b) \right\}$
 3. $\Delta_2 = \Delta_1 \cup \{$
      * $f(a, a, f(a, a, a)), f(a, a, f(a, a, b)), f(a, a, f(a, b, a)), \ldots$
      * $f(a, f(a, a, a), a), f(a, f(a, a, b), a), f(a, f(a, b, a), a), \ldots$
      * $f(a, f(a, a, a), f(a, a, a)), \ldots$

    $\}$
 4. $\dots$
 5. $\Delta_G = \left\{ a, b, f(a, a, a), f(a, a, b), f(a, b, a), f(a, b, b), f(b, a, a), f(b, a, b), f(b, b, a), f(b, b, b), \ldots \right\}$

> Gegeben sind die folgenden Formeln in Skolemform.
> $$F = \forall x, y, z. p(x, f(y), g(z, x))$$
> $$G = \forall x, y. (p(a, f(a, x, y)) \lor q(b))$$
> wobei $a$ und $b$ Konstanten sind. \
> **b)** Geben Sie je ein Herbrand-Modell an oder begründen Sie, warum kein solches existiert.

  * $F = \forall x, y, z. p(x, f(y), g(z, x))$
      * $\Delta^I = \Delta_F$
      * $f^I(t) = t$ mit $t \in \Delta_F$
      * $g^I(t_1, t_2) = t_1$ mit $t_1, t_2 \in \Delta_F$
      * $p^I = \left\{ (t, f(t), g(t, t)) | t \in \Delta_F \right\}$
  * $G = \forall x, y. (p(a, f(a, x, y)) \lor q(b))$
      * $\Delta^I = \Delta_G$
      * $f(t_1, t_2, t_3) = t_1$ mit $t_1, t_2, t_3 \in \Delta_G$
      * $p^I = \Delta_G \times \Delta_G \times \Delta_G$
      * $q^I = \Delta_G$
