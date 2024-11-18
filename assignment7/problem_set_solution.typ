#set page(
  paper: "us-letter",
  margin: (x: 0.75in, top: 1.25in, bottom: 1in),
  header: [
    #rect(stroke: (bottom: 0.5pt))[
      *CS5800* \ Problem Set 7 Solution
      #h(1fr) 
      Rongfei Jin
    ]
  ]
)


#set par(leading: 0.55em, justify: true)
#set text(font: "New Computer Modern")
#set heading(numbering: none)
#show raw: set text(font: "New Computer Modern Mono")
#show par: set block(spacing: 0.55em)
#show heading: set block(above: 1.4em, below: 1em)

#let tree(label, ..children) = style(styles => block(align(center, {
  let label = rect(align(center + horizon)[#label])
  let label_dim = measure(label, styles)

  let children_widths = children.pos().map(x => measure(x, styles).width)
  let all_children = stack(dir: ltr, spacing: 1em, ..children.pos())
  let all_children_dim = measure(all_children, styles)

  // If there are no children, stacking will result in excess space

  if children.pos().len() == 0 {
    label
  } else {
    stack(spacing: 1em, label, all_children)
  }

  // Draw lines

  let label_bottom = (all_children_dim.width / 2, label_dim.height)
  let x = 0em
  let y = label_dim.height + 1em

  for (i, child) in children.pos().enumerate() {
    let child_dim = measure(child, styles)
    let child_top = (x + child_dim.width / 2, y)
    place(top + left, line(start: label_bottom, end: child_top))
    x += child_dim.width + 1em
  }
})))


// #figure(image("images/1-1.png"),
// )

= Question 1
== Solution to (a)


```
define MinimimalHall(S) 
  m <- 0 // Maximum number of halls ever used
  H <- empty queue // Available halls released 
  P <- Construct a priority queue P and insert all the intervals time points from S and assign a type (start or end) and its associated end point to each time point, and priority queue should compare the time points in ascending order, if there are two end time points with the same value, then one with larger start time point should be in the front; if the start time points has the same value, then the one with smaller end time point should be in the front.

  while P is not empty
    T <- extract-min(P)
    if T is a start time point
      if H is empty
        m <- m+1
        h <- m // Assign a new hall
      else
        h <- dequeue(H)

      T.h <- h
      T.end.h <- h // Assign the hall to the event and its associated end point
    else
      enqueue(H, T.h) 
  return m
```

Running time is O(nlog n) since the priority queue has n elements and each operation takes O(log n) time.

== Solution to (b)
```
define MinimalUnitSets(P)
  Sort P in ascending order
  S <- empty set
  i <- 1
  while i <= n
    Add (P[i], P[i]+1) to S
    Move i to the next element that is not covered by the interval (P[i], P[i]+1)
  
  return S
```

Prove correctness by induction
- Base case: When $n = 1$, the algorithm will add $(P[1], P[1]+1)$ to S and return 1, which is correct.
- induction step: Assume the algorithm is correct for n = k, we need to prove it is correct for n = k+1. When n = k+1, the algorithm will add (P[k+1], P[k+1]+1) to S and move i to the next element that is not covered by the interval (P[k+1], P[k+1]+1). Since the algorithm is correct for n = k, the new interval (P[k+1], P[k+1]+1) will not overlap with any existing intervals in S. Therefore, the algorithm is correct for n = k+1.

== Solution to (c)
Assume the greedy algorithm has the following steps
1. sort the coins in descending order
2. for each coin, if the coin is less than or equal to the remaining amount, add the coin to the change and subtract the coin from the remaining amount
3. repeat step 2 until the remaining amount is 0

Given the optimal solution $S = a_0c^0 + a_1c^1 + dots.h + a_n c^n$ where $a_i > 0$

First we will prove $a_0 < c$ by contradiction, assume $a_0 >= c$, then we can always reduce $a_0$ by $c$ and increase $a_1$ by 1, which will result in a smaller number of coins which contradicts with the optimality. Therefore, $a_0 < c$

Then we will proof any natural number that can be represetated in base b is unique, that is for $N = a_0 + a_1 b + a_2 b^2 + dots + a_n b^n$ where $0 <= a_i < b$ and $a_n > 0$ is unique. We will prove this by induction

- Base case: when $n = 0$, the representation is $0 = 0k^0$ is trivially unique
- Induction Step: assume the representation is unique for $n = k$, note for $n = k+1$, we can write $N = a_0 + q b = a_0 + a_1 b + q b^2 = a_0 + a_1 b + a_2 b^2 + q b^3 = dots = a_0 + a_1 b + a_2 b^2 + dots + a_k b^k + q b^(k+1)$. Since the representation is unique for $n = k$, the coefficient $q$ is unique, therefore the representation is unique for $n = k+1$

Notice that the coin change can be written as the based q represetation $a_0c^0 + a_1c^1 + dots.h + a_n c^n$ where $a_i > 0$ and and this representation is unique. Observe that the greedy algorithm will pick the largest coin that is less than or equal to the remaining amount, that is it will generate the power of c in descending order. Therefore, the greedy algorithm will generate the representation of the coin change in the base c representation, which is unique. Therefore, the greedy algorithm is optimal.

#pagebreak()
= Question 2

#figure(image("1.png"),
)

#figure(image("2.png"),
)