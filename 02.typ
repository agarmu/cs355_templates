#import "template.typ": *
#import "@preview/algo:0.3.4": algo, i, d, comment, code
#import "symbols.typ": *


#import "@preview/ctheorems:1.1.3": *
#import "theorems.typ": *

#let title = "Homework 2"
#let author = "Mukul Agarwal"
#let course_id = "CS 355"
#let semester = "Spring 2025"
#let collaborators = ()

#set enum(numbering: "1.")

#show: assignment_class.with(
  title,
  author,
  course_id,
  semester,
  collaborators,
  margin: 1in,
  draft: true,
)

#let zip = $ZZ_p^*$

#problem(
  [Some properties of $(zip, times)$],
  question: [
    Recall that #zip is the set ${1, ..., p - 1}$ and
    $times$ is integer multiplication $mod p$, where $p$ is
    a prime. For example, if $p = 5$, then $2 times 3$ is $1$.
    In this problem, we shall prove that $(zip, times)$ is a group
    when $p$ is a prime. The only part missing in the lecture was
    the proof that every $x in zip$ has an inverse. We will find the
    inverse of any element $x in zip$.
  ],
)[
  #part(5)[
    For $x in zip$, prove that the inverse of $x in zip$ is given by
    #h(1fr)
    $
      overbrace(
        x times x times x dots.c times x,
        p - 2 "times"
      )
    $
    That is, prove that $x^(p - 1) = 1 mod p$, for any prime $p$
    and $x in zip$.
  ][
    // TODO: Solution 1(a)
    //
    #lemma[]
  ]
  #brk()
  #part(5)[
    Let $p$ and $q$ be two distinct primes. Prove that $(p^q - p)
    + (q^p - q)$ is divisible by $p q$.
  ][
    // TODO: Solution 1(b)
  ]
]

#problem(
  [Understanding Groups: Part one],
  question: [
    Recall that when we defined a group $(G, oc)$, we stated that
    there exists an element $e$ such that for all $x in G$, we have that
    $x oc e = x$. Note that $e$ is "applied on $x$ from the right".
    Similarly, for every $x in G$, we are guaranteed that there exists
    $inv(x) in G$ such that $x oc inv(x) = e$.
    Note that $inv(x)$ is again "applied to $x$ from the right."

    In this problem, however, we shall explore the following questions:
    (a) Is there an "identity from the left?," and (b) Is there an
    "inverse from the left?"

    We shall formalize and prove these results in this question.
  ],
  coalesce: true,
)[
  #part(5)[
    Prove that it is impossible that there exist $a, b, c in G$
    such that $a != b$ bu $a oc c = b oc c$.
  ][
    // TODO: Solution 2(a)
  ]
  #brk()
  #part(6)[
    Prove that $e oc x = x$, for all $x in G$.
  ][

    // TODO: Solution 2(b)
  ]
  #brk()
  #part(6)[
    Prove that if there exists an element $alpha in G$ such that
    for some $x in G$, we have $alpha oc x = x$, then $alpha = e$.

    (Remark: Note that these two steps prove that the "left identity"
    is identical to the right identity $e$.)
  ][

    // TODO: Solution 2(c)
  ]
  #brk()
  #part(8)[
    Prove that $inv(x) oc x = e$.
  ][
    // TODO: Solution 2(d)
  ]
  #brk()
  #part(5)[
    Prove that if there exists an element $alpha in G$ and $x in G$
    such that $alpha oc x = e$, then $alpha = inv(x)$.

    (Remark: Note that these two steps prove that the "left inverse
    of $x$" is identical to the right inverse $inv(x)$.)
  ][

    // TODO: Solution 2(e)
  ]
]


#problem(
  [Understanding Groups: Part Two],
  question: [
    In this part, we will prove a crucial property of inverses in groups ---
    they are unique. And finally, using this property, we will prove a
    result that is crucial to the proof of security of one-time pad over
    the group $(G, oc)$.
  ],
  coalesce: true,
)[
  #part(9)[
    Suppose $a, b in G$. Let $inv(a)$ and $inv(b)$ be the inverses of $a$
    and $b$, respectively (i.e., $a oc inv(a) = e$ and $b oc inv(b) = e$).
    Prove that $inv(a) = inv(b)$ if and only if $a = b$.
  ][
    // TODO: Solution 3(a)
  ]
  #brk()
  #part(6)[
    Suppose $m in G$ is a message and $c in G$ is a cipher text.
    rove that there exists a unique $sk in G$ such that $m oc sk = c$.
  ][
    // TODO: Solution 3(b)
  ]
]

#problem(
  [Calculating Large Powers mod $p$],
  question: [
    Recall that we learned the repeated squaring algorithm in class.
    Calculate the following using this concept
    $
      10^(2025^2025 + 2025) quad (mod thin 101)
    $
    (Hint: Note that $101$ is a prime number and before applying
    repeated squaring algorithm try to simplify the problem using
    what you learned in part C of question 1).

    (Note: as can be seen from the latex file, the entirety of
    $2025^2025 + 2025$ is in the exponent of $10$. Also recall that
    $a^(b^c) = a^((b^c))$, not $(a^b)^c$, which is $a^(b dot c)$.)
  ],
  points: 15,
)[
  // TODO: Solution 4
]

#problem(
  [Order of an Element in $(zip, times)$.],

  coalesce: true,
)[
  The _order_ of an element $x$ in the multiplicative group
  $(zip, times)$ is the smallest positive integer $h$ such that
  $x^h = 1 mod p$.
  For example, the order of $2$ in $(ZZ_5 ^*, times)$ is $4$, and the order
  of $4$ in $(ZZ_5 ^*, times)$ is $2$.

  #part(5)[
    What is the order of $3$ in $(ZZ_7^*, times)$?
  ][
    // TODO: Solution 5(a)
  ]

  #part(10)[
    Let $x$ be an element in $(zip, times)$ such that $x^n = 1 med (mod p)$
    for some positive integer $n$ and let $h$ be the order of $x$ in
    $(zip, times)$.

    Prove that $h$ divides $n$.
  ][
    // TODO: Solution 5(b)
  ]
  #brk()
  #part(5)[
    Let $h$ be the order of $x$ in $(zip, times)$.
    Prove that $h$ divides $p - 1$.
  ][
    // TODO: Solution 5(c)
  ]
  #brk()
  #part(10)[
    Let $h$ be the order of $x$ in $(zip, times)$, and
    $k$ be a positive integer. Let $r$ denote the order of
    $x^k mod p in zip$.
    Show that $r = h/d in ZZ$ where $d$ denotes the greatest
    common divisor of $h$ and $k$.

    *Hint:* Use part (b) and prove that $r$ divides $h/d$
    and $h/d$ divides $r$.
  ][
    // TODO: Solution 5(d)
  ]
  #brk()
  #part(5)[
    Let $p > 2$ be a prime, and $a in (zip, times)$. Then,
    show that the element $b = a^((p - 1)\/2) in (zip, times)$ is
    equal to $1$ or has order $2$.
  ][
    // TODO: Solution 5(e)
  ]
]

#let zt = $ZZ_(27)^*$
#let a0 = $a_0$
#let a1 = $a_1$
#let a2 = $a_2$
#let b0 = $b_0$
#let b1 = $b_1$
#let b2 = $b_2$
#problem(
  [Defining multiplication over $zt$],
  coalesce: true,
)[
  In the class, we had considered the group $(ZZ_(26), +)$ to construct
  a one-time pad for one alphabel message. Can we define a group with $26$
  elements using a "multiplication"-like operation?
  This problem shall assist you to define the $(zt, times)$ group that
  has $26$ elements.

  *The first attempt from class.* Recall that in the class, we had seen that
  the following is also a group.
  $ (zt \\ {0,3,6,9,12,15,18,21,24}, times), $ where $times$ is integer
  multiplication $mod 27$. However, the set had only $18$ elements.

  In this problem, we shall define $(zt, times)$ in a different manner
  such that the set has $26$ elements.

  *A new approach.* Interpret #zt as the set of all triplets $(a0, a1, a2)$
  such that $a0, a1, a2 in ZZ_3$ and at least one of them is non-zero.
  Intuitively, you can think of the triples as the ternary representation of
  the elements in #zt.
  We interpret the triplet $(a0, a1, a2)$ as the polynomial $a0 + a1 X + a2 X^2$.
  So, every element in #zt has an associated non-zero polynomial of degree
  at most $2$, and every non-zero polynomial of degree at most $2$ has an
  element in #zt associated with it.

  The multiplication (#math.times operator) of the element $(a0, a1, a2)$ with
  the element $(b0, b1, b2)$ is defined as follows.

  #box(width: 100%, stroke: 1pt + black, inset: 5pt)[
    #set par(spacing: 1.5em)
    Input $(a0, a1, a2)$ and $(b0, b1, b2)$.

    #set enum(numbering: "(a)", spacing: 1.5em)

    + Define $A(X) := a0 + a1 X + a2 X^2$ and $B(X) := b0 + b_1 X + b_2 X^2$.

    + Computer $C(X) := A(X) times B(X)$ (interpret this step as "multiplication
      of polynomials with integer coefficients")

    + Computer $R(X) := C(X) med mod 2 + 2X + X^2$ (interpret this step as taking a
      remainder where one treats both polynomials as polynomials with integer
      coefficients). Let \ $R(X) = r_0 + r_1 X + r_x X^2$

    + Return $(c_0, c_1, c_2) = (r_0 med mod 3, r_1 med mod 3, r_2 med mod 3)$
  ]
  For example, the multiplication $(0, 1, 1) times (1,1,2)$ is computer in the
  following way.
  + $A(X) = X + X^2$ and $B(X) = 1 + X + 2X^2$
  + $C(X) = X + 2X^2 + 3X^3 + 2X^4$.
  + $R(X) = -6 - 9X -2X^2$.
  + $(c_0, c_1, c_2) = (0,0,1)$.
  #colbreak()
  According to #underline[this definition] of the $times$ operator, solve
  the following problems.
  #part(5)[Evaluate $(1,0,1) times (1,0,1)$.][
    // TODO: Solution 6(a)
  ]
  #colbreak()
  #part(10)[
    Note that $e = (1,0,0)$ is an identity element. Find the inverse of
    $(0,1,1)$.
  ][

  ]
  #colbreak()
  #part(10)[
    Assume that $(zt, times)$ is a group. Find the order of the element
    $(2,2,2)$.

    (Recall that, in a group $(G, oc)$, the order of an element $x in G$ is the
    smallest positive integer $h$ such that $x^h = e$)
  ][
    // TODO: Solution 6(c)
  ]
]

#problem(coalesce: true)[Elliptic curve][
  In class, we have briefly discussed elliptic curve. Here we will see some
  concrete examples of elliptic curve on finite prime fields.

  Let $Y^2 = X^3 + X$ be an elliptic curve over the field $(F_23, +, dot)$.
  A point $(X, Y)$ lies on the elliptic curve if it satisfies the equation
  $Y^2 = X^3 + X$.

  #part(2)[
    Verify that the two points $P = (9, 18)$ and
    $Q = (11, 10)$ are on the curve.
  ][
    // TODO: 7(a)
  ]
  #colbreak()
  #part(3)[
    Find the point $R$ where the line connecting $P$ and $Q$ intersects
    the elliptic curve $Y^2 = X^3 + X$. For $R = (x,y)$, define
    the "inverse of $R$" to be the point $S = (x, -y)$. Find the
    inverse of point $R$. Recall from the lecture that "$P + Q$"
    is defined to be the point $S :=$ "inverse of $R$".
  ][
    // TODO: 7(b)
  ]
]

#problem[Extra Credit/Challenge Problem][
  Let $p >= 3$ be a prime number and $h$ be a non-negative
  integer. Prove that the congruence $x^2 = h med mod p$ has a solution
  if and only if for every $k >= 1$ the congruence $x^2 = h med mod p^k$
  has a solution.

  *Hint:* Use induction on $k$. Modify a solution modulo $p^k$ to build a solution
  modulo $p^(k+1)$.
]
