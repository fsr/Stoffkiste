## [3. Übungsblatt](https://web.archive.org/web/20241212082357/https://iccl.inf.tu-dresden.de/w/images/9/96/TheoLog24-Uebung03.pdf)

### Aufgabe E

> Geben Sie eine Turing-Maschine $A_{\mod 2}$ an, die die Funktion $f : N \rightarrow N$ mit $f(x) = (x \mod 2)$ berechnet. Stellen Sie dabei die Zahlen in unärer Kodierung dar.

[turingmachine.io](https://turingmachine.io/)

```yaml
input: "11111"
blank: _
start state: even
table:
  even:
    1: {write: _, R: odd}
    _: {R: undo_move_right}
  odd:
    1: {write: _, R: even}
    _: {write: 1, R: undo_move_right}
  undo_move_right:
    _: {L: done}
  done:
```

### Aufgabe G

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **a)** Die Menge der Instanzen des Postschen Korrespondenzproblems, welche eine Lösung haben, ist semi-entscheidbar.

wahr, das *PCP* ist semi-enscheidbar. Wenn ein *PCP* mit $n$ "Dominosteinen" eine Lösung der Länge $m$ hat, dann kann diese Lösung mittels Brute-Force in $O(n^m)$ gefunden werden und die Turing-Maschine hält.

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **b)** Das Postsche Korrespondenzproblem ist bereits über dem Alphabet $\Sigma = \left\{ a, b \right\}$ nicht entscheidbar.

wahr, **TODO**

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **c)** Es ist entscheidbar, ob eine Turingmaschine nur Wörter akzeptiert, die Palindrome sind. (Ein Palindrom ist ein Wort $w = (a_1, \ldots, a_n)$ mit $(a_1, \ldots, a_n) = (a_n, \ldots, a_1)$.)

falsch, **TODO** $P_\text{halt} \leq_m P_\text{Palindrom}$

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **d)** $P_\text{halt}$ ist semi-entscheidbar.

wahr

$P_\text{halt} := \left\{ \text{enc}(M, w) | \text{$M$ hält auf $w$} \right\}$

Konstruktion einer Turing-Maschine $M_\text{halt}$ mit der Eingabe $\text{enc}(M, w)$ als Semi-Entscheider für $P_\text{halt}$:

  * lösche das Band $w$
  * schreibe $w$ auf das Band
  * simuliere $M$ auf $w$
  * akzeptiert $M$, dann war $\text{enc}(M, w) \in P_\text{halt}$
  * hält $M$ nicht, hält auch $M_\text{halt}$ nicht
  * $\Rightarrow$ **semi-entscheidbar**

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **e)** Es ist nicht entscheidbar, ob die von einer deterministischen Turing-Maschine berechnete Funktion total ist.

wahr: Ist $f$ total? $\Leftrightarrow$ Hält $M_f$ für $w$? $\Leftrightarrow \text{enc}(M_f, w) \in P_\text{halt}$

> Welche der folgenden Aussagen sind wahr? Begründen Sie Ihre Antwort. \
> **f)** Es gibt reguläre Sprachen, die nicht semi-entscheidbar sind.

### Aufgabe 3.1

> Besitzen folgende Instanzen $P_i$ des Postschen Korrespondenzproblems Lösungen? Begründen Sie Ihre Antwort.
>
> +-----------------------+
> | a\) $P1$              |
> +=======+========+======+
> | $a$   | $abaa$ | $ab$ |
> +-------+--------+------+
> | $aaa$ | $ab$   | $b$  |
> +-------+--------+------+

Lösung für $s_a = (1, 0), \left| s_a \right| = 2$

> Besitzen folgende Instanzen $P_i$ des Postschen Korrespondenzproblems Lösungen? Begründen Sie Ihre Antwort.
>
> +-----------------------+
> | b\) $P2$              |
> +=======+=======+=======+
> | $ab$  | $baa$ | $aba$ |
> +-------+-------+-------+
> | $aba$ | $aa$  | $baa$ |
> +-------+-------+-------+

womöglich, aber keine Lösung für $\left| s_b \right| < 16$

> Besitzen folgende Instanzen $P_i$ des Postschen Korrespondenzproblems Lösungen? Begründen Sie Ihre Antwort.
>
> +-------------------------------+
> | c\) $P3$                      |
> +=======+=======+=======+=======+
> | $bba$ | $ba$  | $ba$  | $ab$  |
> +-------+-------+-------+-------+
> | $b$   | $baa$ | $aba$ | $bba$ |
> +-------+-------+-------+-------+

womöglich, aber keine Lösung für $\left| s_c \right| < 12$

```python
import multiprocessing
from functools import cache

post = [
    # ("a", "aaa"),
    # ("abaa", "ab"),
    # ("ab", "b"),
    ("ab", "aba"),
    ("baa", "aa"),
    ("aba", "baa"),
    # ("bba", "a"),
    # ("ba", "baa"),
    # ("ba", "aba"),
    # ("ab", "bba"),
]


@cache
def path_to_strings(path):
    if not path:
        return ([], [])
    a, b = path_to_strings(path[:-1])
    i = path[-1]
    return (a + [post[i][0]], b + [post[i][1]])


def find_solution(worker_num, q, finished):
    depth = 0
    while True:
        path = q.get()
        if len(path) > depth:
            depth = len(path)
            print("worker", worker_num, "depth:", depth)
        assert depth < 20
        # generate both strings
        top, bottom = path_to_strings(path)
        if "".join(top) == "".join(bottom):
            finished.put(path)
            break
        # create new paths from the curent path plus each tuple
        for i in range(len(post)):
            q.put(path + (i,))


# intial paths of length 1 each starting with another PCP tuple
q = multiprocessing.Queue()
for i in range(len(post)):
    q.put((i,))

# start 8 processes that will write their results to finished
finished = multiprocessing.Queue()
workers = [
    multiprocessing.Process(target=find_solution, args=(i, q, finished))
    for i in range(8)
]
for worker in workers:
    worker.start()
try:
    # wait for the first result
    result = finished.get()
finally:
    # kill all workers
    for worker in workers:
        worker.kill()
        worker.join()
# print result
print(result)
top, bottom = path_to_strings(result)
print(top, "==", bottom)
```

### Aufgabe 3.2

> Zeigen Sie, dass das Postsche Korrespondenzproblem über einem einelementigen Alphabet entscheidbar ist.

Jede Instanz des Postschen Korrespondenzproblem über einem einelementigen Alphabet $\Sigma = \{a\}$ ist durch eine Menge $\{p_{(i_1,j_1)}, p_{(i_2,j_2)}, \ldots, p_{(i_n,j_n)}\}$, wobei $p_{(i,j)} = (a^i, a^j)$, gegeben. Die Lösung ist berechenbar, genau dann wenn eine Lösung $s = (s_1, s_2, \ldots, s_n)$ existiert:

  * $(a^{i_1})^{s_1} \cdot (a^{i_2})^{s_2} \cdot \ldots \cdot (a^{i_n})^{s_n} = (a^{j_1})^{s_1} \cdot (a^{j_2})^{s_2} \cdot \ldots \cdot (a^{j_n})^{s_n}$ \
    (Die Reihenfolge der Elemente in der Lösung $p_{i_k,j_k}$ ist beliebig vertauschbar, da $\Sigma = \{a\}$.)
  * Die erzeugten Worte sind gleich, wenn sie die gleiche Länge haben. \
    $\Rightarrow i_1 s_1 + i_2 s_2 + \ldots + i_n s_n = j_1 s_1 + j_2 s_2 + \ldots + j_n s_n$
  * $\Rightarrow (i_1 - j_1) s_1 + (i_2 - j_2) s_2 + \ldots + (i_n - j_n) s_n = 0$
  * Lösbarkeit:
      * **$i_{k} = j_{k}$** (triviale Lösung):
          * **$s_k = 1$**
          * $s_{k' | k' \neq k} = 0$
      * **$i_{k_1} > j_{k_1}$ und $i_{k_2} < j_{k_2}$**:
          * **$s_{k_1} = j_{k_2} - i_{k_2}$**
          * **$s_{k_2} = i_{k_1} - j_{k_1}$**
          * $s_{k' | k' \neq k_1, k' \neq k_2} = 0$

        $\Rightarrow \bm{+} (i_{k_1} - j_{k_1}) \bm{(j_{k_2} - i_{k_2})} + (i_{k_2} - j_{k_2}) (i_{k_1} - j_{k_1}) = 0$ \
        $\Leftrightarrow \bm{-} (i_{k_1} - j_{k_1}) \bm{(i_{k_2} - j_{k_2})} + (i_{k_2} - j_{k_2}) (i_{k_1} - j_{k_1}) = 0$
      * sonst alle $i_k > j_k$ oder alle $i_k < j_k$: $\nexists s_k > 0$

**Es ist also lediglich zu prüfen, ob die Instanz**

  * **ein Element $p_{(i_k,i_k)}$ beinhaltet oder**
  * **zwei Elemente**
     * **$p_{(i_{k_1}, j_{k_1})}$ mit $i_{k_1} > j_{k_1}$ und**
     * **$p_{(i_{k_2},j_{k_2})}$ mit $i_{k_2} < j_{k_2}$**

    **beinhaltet.**

Beispiele:

 1. $P_1 = \{p_{(5,2)}, p_{(1,3)}\}$ \
    $\Rightarrow 5 s_1 + 1 s_2 = 2 s_1 + 3 s2$ \
    $\Rightarrow 3 s_1 - 2 s_2 = 0$ \
    $\Rightarrow s_1 = 2, s_2 = 3$

 2. $P_2 = \{p_{(1,2)}, p_{(2,3)}\}$ \
    $\Rightarrow 1 s_1 + 2 s_2 = 2 s_1 + 3 s2$ \
    $\Rightarrow 1 s_1 + 1 s_2 = 0$ \
    $\Rightarrow \nexists s_1 > 0, s_2 > 0$

### Aufgabe 3.3

> Es sei $T := \{\text{enc}(M) | M$ ist eine Turing-Maschine, welche $w^R$ akzeptiert, falls sie $w$ akzeptiert$\}$, wobei $w^R$ das zu $w$ umgekehrte Wort ist. Zeigen Sie, dass $T$ nicht entscheidbar ist.

Beweis: $P_\text{halt} \leq_m T$

Redunktionsfunktion $f : P_\text{halt} \rightarrow T$

  * $f(\text{enc}(M, w))$ für $\text{enc}(M, w) \in P_\text{halt}$ konstruiert eine Turing-Maschine $M_T$
  * $M_T$ simuliert $M$ auf $w$
  * Da $w \in L(M)$, akzeptiert $M$ $w$.
  * $M_T$ wird erweitert, dass $M_T$ auch $w_R$ akzeptiert.
  * $\Rightarrow L(M_T) = \{w, w^R\}$ \
    $\Rightarrow \text{enc}(M_T) \in T$

Da $P_\text{halt}$ nicht entscheidbar ist und $P_\text{halt} \leq_m T$ existiert, ist $T$ nicht entscheidbar.

### Aufgabe 3.4

> Zeigen Sie, dass weder das Äquivalenzproblem $P_\text{äquiv}$ für Turing-Maschinen noch dessen Komplement $\neg P_\text{äquiv}$ semi-entscheidbar ist, wobei
>
>   * $P_\text{äquiv} := \{\text{enc}(M_1)\#\#\text{enc}(M_2) | L(M_1) = L(M_2)\}$,
>   * $\neg P_\text{äquiv} := \{\text{enc}(M_1)\#\#\text{enc}(M_2) | L(M_1) \neq L(M_2)\}$.
>
> Zeigen Sie dazu, dass $P_\text{halt} \leq_m P_\text{äquiv}$ und $P_\text{halt} \leq_m \neg P_\text{äquiv}$ gilt. Weshalb zeigt dies die Aussage?

$P_\text{halt} \leq_m P_\text{äquiv}$

  * $f(\text{enc}(M, w)) := \text{enc}(M)\#\#\text{enc}(M)$ für $\text{enc}(M, w) \in P_\text{halt}$
  * $\text{enc}(M)\#\#\text{enc}(M) \in P_\text{äquiv}$, da $L(M) = L(M)$

$P_\text{halt} \leq_m \neg P_\text{äquiv}$

  * $f(\text{enc}(M, w)) := \text{enc}(M)\#\#\text{enc}(M')$ für $\text{enc}(M, w) \in P_\text{halt}$
  * $M'$ ist eine Turing-Maschine, die ein $w' \notin L(M)$ akzeptiert, z.B.:
      * $\Sigma_{M'} := \Sigma_M \cup \{\land\}$ mit $\land \notin \Sigma_M$
      * $M'$ erwartet als erstes Zeichen $\land$, löscht dieses, geht nach rechts
      * $M'$ simuliert $M$
      * $\Rightarrow L(M') \neq L(M)$, weil jedes Wort $w \in L(M')$ mit $\land$ beginnt und damit $w \notin L(M)$
  * $\text{enc}(M)\#\#\text{enc}(M') \in \neg P_\text{äquiv}$, da $L(M) \neq L(M')$

$P_\text{halt}$ ist nicht co-semi-entscheidbar \
$\Rightarrow P_\text{äquiv}$ ist nicht co-semi-entscheidbar \
$\Rightarrow \neg P_\text{äquiv}$ ist nicht semi-entscheidbar

$\neg P_\text{halt}$ ist nicht co-semi-entscheidbar \
$\Rightarrow \neg P_\text{äquiv}$ ist nicht co-semi-entscheidbar \
$\Rightarrow P_\text{äquiv}$ ist nicht semi-entscheidbar
