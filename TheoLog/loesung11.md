## [11. Übungsblatt](https://web.archive.org/web/20241212082357/https://iccl.inf.tu-dresden.de/w/images/f/f6/TheoLog24-Uebung-11.pdf)

### Aufgabe 11.1

> Gegeben sei die folgende Kino-Datenbank bestehend aus den drei Tabellen Filme, Spielstätten und Kinoprogramm. Geben Sie die nachfolgenden Anfragen jeweils in Form einer prädikatenlogische Formel an: \
> **a)** Wer ist der Regisseur von Der Hobbit 1?

$Q = \exists r. (\exists s. \text{Filme}(H_1, r, s))$ \
$Z = \left\{ H_1 \mapsto \text{"Der Hobbit 1"} \right\}$

> Gegeben sei die folgende Kino-Datenbank bestehend aus den drei Tabellen Filme, Spielstätten und Kinoprogramm. Geben Sie die nachfolgenden Anfragen jeweils in Form einer prädikatenlogische Formel an: \
> **b)** Welche Kinos spielen Der Hobbit 1?

$Q = \exists k. (\exists z. \text{Kinoprogramm}(k, H_1, z))$ \
$Z = \left\{ H_1 \mapsto \text{"Der Hobbit 1"} \right\}$

> Gegeben sei die folgende Kino-Datenbank bestehend aus den drei Tabellen Filme, Spielstätten und Kinoprogramm. Geben Sie die nachfolgenden Anfragen jeweils in Form einer prädikatenlogische Formel an: \
> **c)** Gibt es ein Kino welches einen Film von Christopher Nolan zeigt?

$Q = \exists k. (\exists f. (\exists s. \text{Filme}(f, C_\text{Nolan}, s) \land \exists z. \text{Kinoprogramm}(k, f, z)))$ \
$Z = \left\{ C_\text{Nolan} \mapsto \text{"Christopher Nolan"} \right\}$

> Gegeben sei die folgende Kino-Datenbank bestehend aus den drei Tabellen Filme, Spielstätten und Kinoprogramm. Geben Sie die nachfolgenden Anfragen jeweils in Form einer prädikatenlogische Formel an: \
> **d)** Welche Paare von Schauspielern spielen gemeinsam in mindestens einem Film?

$Q = \exists a, b. (\exists f, r. (\text{Filme}(f, r, a) \land \text{Filme}(f, r, b)) \land (a \not\approx b))$

> Gegeben sei die folgende Kino-Datenbank bestehend aus den drei Tabellen Filme, Spielstätten und Kinoprogramm. Geben Sie die nachfolgenden Anfragen jeweils in Form einer prädikatenlogische Formel an: \
> **e)** Welche Paare von Schauspielern spielen gemeinsam in genau einem Film?

 1. $Q = \exists a, b. ((a \not\approx b) \land \exists f_1, r_1. (\text{Filme}(f_1, r_1, a) \land \text{Filme}(f_1, r_1, b) \land \lnot \exists f_2, r_2. ((f_2 \not\approx f_1) \land \text{Filme}(f_2, r_2, a) \land \text{Filme}(f_2, r_2, b))))$
 2. $Q = \exists a, b. ((a \not\approx b) \land \exists f_1, r_1. (\text{Filme}(f_1, r_1, a) \land \text{Filme}(f_1, r_1, b) \land \forall f_2, r_2. \lnot ((f_2 \not\approx f_1) \land \text{Filme}(f_2, r_2, a) \land \text{Filme}(f_2, r_2, b))))$
 3. $Q = \exists a, b. ((a \not\approx b) \land \exists f_1, r_1. (\text{Filme}(f_1, r_1, a) \land \text{Filme}(f_1, r_1, b) \land \forall f_2, r_2. ((f_2 \approx f_1) \lor \lnot \text{Filme}(f_2, r_2, a) \lor \lnot \text{Filme}(f_2, r_2, b))))$

### Aufgabe 11.2

> Gegeben sind die folgenden Formeln in Skolemform.
> $$F = \forall x, y, z. p(x, f(y), g(z, x))$$
> $$G = \forall x, y. (p(a, f(a, x, y)) \lor q(b))$$
> wobei $a$ und $b$ Konstanten sind. \
> Geben Sie die Herbrand-Expansion $\text{HE}(F)$ und $\text{HE}(G)$ an.

  * $\text{HE}(F)$
      * $\Delta_F = \left\{ a, f(a), g(a, a), f(f(a)), \ldots \right\}$
          * $\Delta_0 = \left\{ a \right\}$
          * $\Delta_1 = \Delta_0 \cup \left\{ f(a), g(a, a) \right\}$
          * $\ldots$
      * $\text{HE}(F) = \{$
          * $p(a, a, g(a, a)),$
          * $p(f(a), a, g(a, a)),$
          * $p(a, f(a), g(a, a)),$
          * $p(f(a), f(a), g(a, a)),$
          * $p(a, a, g(f(a), a)),$
          * $\ldots$

        $\}$
  * $\text{HE}(G)$
      * $\Delta_G = \left\{ a, b, f(a, a, a), f(b, a, a), f(a, b, a), f(b, b, a), f(a, a, b), f(f(a, a, a), a, a), f(a, f(a, a, a), a), f(b, f(a, a, a), a), \ldots \right\}$
          * $\Delta_0 = \left\{ a, b \right\}$
          * $\Delta_1 = \Delta_0 \cup \left\{ f(a, a, a), f(b, a, a), f(a, b, a), f(b, b, a), f(a, a, b), \ldots \right\}$
          * $\Delta_2 = \Delta_1 \cup \left\{ f(f(a, a, a), a, a), f(a, f(a, a, a), a), f(b, f(a, a, a), a), \ldots \right\}$
          * $\ldots$
      * $\text{HE}(G) = \{$
          * $p(a, f(a, a, a)) \lor q(b),$
          * $p(a, f(a, b, a)) \lor q(b),$
          * $p(a, f(a, f(a, a, a), a)) \lor q(b),$
          * $p(a, f(a, a, b)) \lor q(b),$
          * $p(a, f(a, b, b)) \lor q(b),$
          * $p(a, f(a, f(a, a, a), b)) \lor q(b),$
          * $p(a, f(a, a, f(a, a, a))) \lor q(b),$
          * $\ldots$

        $\}$

### Aufgabe 11.3

> Führen Sie für die folgenden Formeln eine Resolution durch, um zu zeigen: \
> **a)** Für $F_1 = \forall x. (\text{weg}(x) \rightarrow \text{führtNachRom}(x)) \land \forall x. (\text{autobahn}(x) \rightarrow \text{weg}(x)) \land \text{autobahn}(\text{a4})$ und $G_1 = \text{führtNachRom}(\text{a4})$ gilt $F_1 \models G_1$.

 1. $\{ \lnot \text{weg}(x_1), \text{führtNachRom}(x_1) \}$
 2. $\{ \lnot \text{autobahn}(x_2), \text{weg}(x_2) \}$
 3. $\{ \text{autobahn}(\text{a4}) \}$
 4. 3 + 2: $\{ \text{weg}(\text{a4}) \}$
 5. 1 + 4: $\{ \text{führtNachRom}(\text{a4}) \}$

> Führen Sie für die folgenden Formeln eine Resolution durch, um zu zeigen: \
> **b)** Für $F_2 = \forall x. (\text{känguru}(x) \rightarrow \exists y. \text{hatMutter}(x, y)) \land \forall z. \forall w. (\text{hatMutter}(z, w) \rightarrow \text{liebt}(w, z))$ und $G_2 = \forall x. (\text{känguru}(x) \rightarrow (\exists y. \text{liebt}(y, x)))$ gilt $F_2 \models G_2$.

$F_2 =$

 1. $\forall x. (\text{känguru}(x) \rightarrow \exists y. \text{hatMutter}(x, y)) \land \forall z. \forall w. (\text{hatMutter}(z, w) \rightarrow \text{liebt}(w, z))$
 2. $\forall x. (\lnot \text{känguru}(x) \lor \exists y. \text{hatMutter}(x, y)) \land \forall z. \forall w. (\lnot \text{hatMutter}(z, w) \lor \text{liebt}(w, z))$
 3. $\forall x. \exists y. \forall z. \forall w. ((\lnot \text{känguru}(x) \lor \text{hatMutter}(x, y)) \land (\lnot \text{hatMutter}(z, w) \lor \text{liebt}(w, z)))$
 4. $\forall x. \forall z. \forall w. ((\lnot \text{känguru}(x) \lor \text{hatMutter}(x, f_{y_F}(x))) \land (\lnot \text{hatMutter}(z, w) \lor \text{liebt}(w, z)))$

$G_2 =$

 1. $\forall x. (\text{känguru}(x) \rightarrow (\exists y. \text{liebt}(y, x)))$
 2. $\forall x. (\lnot \text{känguru}(x) \lor (\exists y. \text{liebt}(y, x)))$
 3. $\forall x. \exists y. (\lnot \text{känguru}(x) \lor (\text{liebt}(y, x)))$
 4. $\forall x. (\lnot \text{känguru}(x) \lor \text{liebt}(f_{y_G}(x), x))$

Resolution:

 1. $\left\{ \lnot \text{känguru}(x), \text{hatMutter}(x, f_{y_F}(x)) \right\}$
 2. $\left\{ \lnot \text{hatMutter}(z, w), \text{liebt}(w, z) \right\}$
 3. 1 + 2: $\left\{ \lnot \text{känguru}(x), \text{liebt}(f_{y_F}(x), x) \right\}$
 4. Mit $f_{y_F}(x) = f_{y_G}(x)$ gilt $F_2 \models G_2$.
