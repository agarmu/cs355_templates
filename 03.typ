#import "template.typ": *
#import "@preview/algo:0.3.4": algo, i, d, comment, code
#import "symbols.typ": *


#import "@preview/ctheorems:1.1.3": *
#import "theorems.typ": *

#let title = "Homework 3"
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
  collaborator_top: false,
  margin: 1in,
  draft: false,
)

#let problem = problem.with(solution_spacing: 0.25em)
#let part = part.with(solution_spacing: 0.25em, show_points: false)

#problem[Security of encryption schemes][
  For each encryption scheme below, state whether the scheme
  is secure or not. Justify your answer in each case.

  #part(8)[
    The message space is $cM = {0, 1, ..., 10}$.
    Algorithm $gen$ chooses a uniform key from the
    key space $cK = {1, 3, 5, ..., 21}$. The encryption
    algorithm $enc_sk (m)$ returns $(s k + m) mod 11$, and
    the decryption algorithm $dec_sk (m)$ returns
    $(c - s k) mod 11$.
  ][

  ]
  #brk()
  #part(8)[
    The message space is $cM = {0, 1, ..., 11}$.
    Algorithm #gen chooses a uniform key from the
    key space $cK = {0, 1, ..., 34}$. The encryption
    algorithm $enc_sk(m)$ returns $(s k + m) mod 12$,
    and the decryption algorithm $dec_sk (m)$ returns
    $(c - sk) mod 12$.
  ][

  ]
  #brk()
  #part(10)[
    The message space $cM$ is the set of all $n$ bit
    strings $(zo^n)$ containing $t$ 1s. The key space
    $cK$ is the set of all permutations of the $n$ positions.
    Algorithm #gen chooses a key uniformly from the key space
    #cK. The encryption algorithm $enc_sk (m)$ returns $pi(m)$
    and the decryption algorithm $dec_sk (m)$ returns
    $pi^(-1) (m)$, where $pi^(-1) oc pi = bb(1)$, $bb(1)$
    is the identity permutation.

    For example, when $n = 3$, $t = 2$, let
    $cM = {110, 101, 011}$ be the set of all $3$ bit strings
    with two $1$s. Let $m = 101 in cM$ be a message.
    Let $pi: cM -> cM, pi in cK$ be a permutation of
    the $3$ positions such that
    $pi(b_1 b_2 b_3) = b_2 b_3 b_1$; i.e., $pi(101) = 011$. \
    #text(size: 9pt)[
      Note: This encryption scheme shows that the witness for an encryption does not have to be unique.
    ]
  ][

  ]
]

#problem(
  points: 15,
  [
    Equivalent definition of Perfect Secrecy
  ],
  question: [
    In the lecture, we defined the perfect security for any private-key encryption
    scheme $(gen, enc, dec)$ as follows. For any message $m$, cipher-text $c$ ,and
    a priori probability distribution $MM$ over the set of messages, we have:
    $
      prob[MM = m given CC = c] = prob[MM = m]
    $
    Show that the above definition is #underline[equivalent] to the following
    alternative definition. For all messages $m, m'$, cipher-text $c$, and apriori
    probability distribution $MM$ over the set of messages, we have:
    $
      prob[CC = c given MM = m] = prob[CC = c given MM = m'].
    $
    #text(size: 9pt)[
      Remarks:
      1. Proving equivalence means that you have to show that the
        first definition implies the second definition.
        And the second definition also implies the first definition.

      2. Additionally, in this problem, for simplicity, assume that in
        the probability expressions, no ``division by error'' occurs.

      3. The distribution of the message is not necessarily uniform.
    ]
  ],
)[

]

#problem(
  points: 15,
  [
    Defining Perfect Security from Ciphertexts
  ],
  question: [
    An upstart in the field of cryptography has proposed a new definition
    for perfect security of private-key encryption schemes. According to
    this new definition, a private-key encryption scheme $(gen, enc, dec)$
    is perfectly secure if, for all apriori distribution $MM$ over the
    message space, and any two ciphertexts $c$ and $c'$, we have the
    following identity.
    $
      prob[CC = c] = prob[CC = c']
    $
    Show that the definition in the class does #underline[not] imply
    this new definition.

    #text(size: 9pt)[
      Remark. You need to construct a private-key encryption scheme that is secure according to the definition we
      learned in class. However, this scheme does not satisfy the new definition
    ]
  ],
)[

]

#problem[
  Lagrange Interpolation
][
  We want to derive a part of the Chinese Remainder Theorem using
  principles of Lagrange Interpolation. Our goal is the following:

  #block(
    stroke: .5pt + black,
    inset: 10pt,
    width: 100%,
  )[
    Suppose $p$ and $q$ are two distinct primes. Suppose
    $a in {0, ..., p - 1}$ and $b in {0, ..., q - 1}$.
    We want to find a natural number $x$ such that
    #align(center)[
      $x med med (mod p) = a$ and $x med med (mod q) = b$.
    ]
  ]

  We shall proceed towards this objective incrementally
  (similar to the approach of Lagrange interpolation).

  #part(7)[
    Find a natural number $x_p$ satisfying $x_p med med (mod p) = 1$,
    and $x_p med med (mod q) = 0$.
  ][

  ]
  #brk()
  #part(7)[
    Find a natural number $x_q$ satisfying $x_q med med (mod p) = 0$ and
    $x_q med med (mod q) = 1$.
  ][

  ]
  #brk()
  #part(6)[
    Find a natural number $x$ satisfying $x med med (mod p) = a$ and
    $x med med (mod q) = b$.
  ][

  ]
]


#problem[
  An Illustrative Execution of Shamir’s Secret Sharing Scheme][
  We shall work over the field $(ZZ_7, +, times)$. We are interested
  in sharing a secret among $6$ parties so that any $3$ parties can
  reconstruct the secret, but no subset of $2$ parties gain additional
  information about the secret.

  Suppose the secret is $s = 1$. The random polynomial of degree $< 3$
  chosen during the secret sharing steps is $p(X) = 5 X^2 + 3 X + 1$.
  #part(6)[
    What are the respective shares of parties
    $1$, $2$, $3$, $4$, $5$, and $6$?
  ][

  ]
  #brk()
  #part(10)[
    Suppose parties 2, 3, and 5 are interested in reconstructing
    the secret. Run the Lagrange Interpolation algorithm as explained
    in the class.

    #text(size: 9pt)[
      _(Remark: It is essential to show the step-wise reconstruction
      procedure to score full points. In particular,
      you need to write down the polynomials $p_2 (X)$, $p_3 (X)$ and $p_5
      (X)$.)_
    ]
  ][

  ]
  #brk()
  #part(9)[
    Suppose parties $2$, and $3$ get together. Let $q_(tilde(s))(X)$
    be the polynomial that is consistent with their shares and the point
    $(0, tilde(s))$ for each $tilde(s) in ZZ_p$. Write down the polynomials
    $q_0 (X), q_1 (X), ..., q_6 (X)$.
  ][

  ]
]

#problem[A bit of Counting][
  In this problem, we will do some counting related
  to polynomials that pass through a given set of points
  in the plane. We already did this
  counting (slightly informally) in the class.
  Writing the solution for this problem shall make
  the solution’s intuition more concrete.

  We are working over the field $(ZZ_p, +, times)$, where $p$ is a
  prime number. Let $cP_t$ be the set of all
  polynomials in the indeterminate $X$ with degree $< t$
  and coefficients in $ZZ_p$.

  #part(8)[
    Let $(x_1, y_1), (x_2, y_2), ..., "and" (x_t, y_t)$ be $t$ coordinates
    in the plane $ZZ_p^2$. We have that $x_i != x_j$ for all $i != j$; that is,
    the first coordinates of the points are all distinct.

    Prove that there exists a _unique polynomial_ in $cP_t$ that passes
    through these $t$ points.
    #text(size: 9pt)[
      (Hint: Use Lagrange Interpolation and Schwartz–Zippel Lemma.)
    ]
  ][
    First, we admit an external result.
    #imp_theorem[Schwartz-Zippel Lemma][
      Given a field $KK$, $t in NN$, some polynomial
      $p in KK[X]$ such that $deg p <= t$ and letting
      $x_1, x_2, x_3, ..., x_t in KK$ be
      a distinct elements of the field, if $p(x_i) = 0$ for every
      $i in {1, ..., t}$ then $p$ is the zero polynomial in $KK[X]$.
    ]
  ]
  #brk()
  #part(8)[
    Let $(x_1, y_1), (x_2, y_2), ..., "and" (x_(t-1), y_(t-1))$ be $(t - 1)$
    points in the plane $ZZ_p^2$. We have that $x_i != x_j$ for all $i != j$;
    that is, the first coordinates of the points are all distinct. Prove that
    $p$ polynomials in $cal(P)_t$ pass through these $(t - 1)$ points.
  ][

  ]
  #brk()
  #part(9)[
    Let $(x_1, y_1), (x_2, y_2), ..., "and" (x_k, y_k)$ be $k$
    points in the plane $ZZ_p^2$ where $k <= t$.
    We have that $x_i != x_j$ for all $i != j$;
    that is, the first coordinates of the points are all
    distinct. Prove that
    $p^(t - k)$ polynomials in $cal(P)_t$ pass through these
    $k$ points.
  ][]

]
