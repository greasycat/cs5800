#set page(
  paper: "us-letter",
  margin: (x: 0.75in, top: 1.25in, bottom: 1in),
  header: [
    #rect(stroke: (bottom: 0.5pt))[
      *CS5800* \ Problem Set 6 Solution
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
//   caption: [Solution (a)]
// )

= Question 1
== Solution to (a)

Consider price table below:

#let arr = (1, 5, 8, 9)

#table(
  columns: (auto,) * (arr.len()+1),
  inset: 10pt,
  align: horizon,
  table.header("Length", ..arr.enumerate().map(x => [#(x.at(0)+1)])),  
  "Price",
  ..arr.map(x => [#x]),
  "Density",
  ..arr.enumerate().map(x => [#calc.round((x.at(1)/(x.at(0)+1)), digits: 3)])
)

The greedy approach will cut rope into 3 and 1 with $r=9$, where the optimal solution is to cut into 2 and 2 with $r=10$. So the optimal solution is larger in value than the greedy solution.

== Solution to (b)

```
define CUT-ROD(p, n, c)

  initialize an array r[0..n] to 0

  for i = 1 to n (inclusive)
    q = p[i]
    for j = 1 to i-1 (inclusive)
      q = max(q, p[j-1] + r[i-j]-c)
    r[i] = q
  return r[n]
```
#pagebreak()
= Question 2
== Solution to (a)

#let num_cases = 8
Denote pebble in row $i$ as $P_(i)$, 
$
P_(i) = 1 "if there is a pebble" \
P_(i) = 0 "if there is no pebble"
$
#table(
  columns: (auto,) * (num_cases+1),
  table.header(" ", ..range(num_cases).map(x => [Case #x])),
  "R1","0", "1", "1", "1", "0", "0", "0", "0",
  "R2","0", "0", "0", "0", "1", "1", "0", "0",
  "R3","0", "0", "1", "0", "0", "0", "1", "0",
  "R4","0", "0", "0", "1", "0", "1", "0", "1",
  "S ","0", "1", "2", "2", "1", "2", "1", "1"
)


Since there's no vertically adjacent pebble, based on the table above, the maximum number of pebbles that can be placed is 2.

== Solution to (b)
```python
def print_pebble_game(placement):
    for x in placement[1:]:
        print(bin(x)[2:].zfill(4))

cases = [0, 0b1000, 0b1010, 0b1001, 0b0100, 0b0101, 0b0010, 0b0001]
def sum_selected_by_binary(column, binary_number):
    total_sum = 0
    for i in range(len(column)):
        if binary_number & (1 << i):
            total_sum += column[i]
    return total_sum

def pebble_game(table, n):
    placement = [0] * (n + 1)
    for i in range(1, n + 1):
        max_sum = 0
        for case in cases:
            temp_sum = sum_selected_by_binary(table[i-1], case)
            if placement[i-1] & case == 0 and temp_sum > max_sum:
                max_sum = temp_sum
                placement[i] = case
    return placement
```

We uses bit operation here to save the inconvenience of compatibility check. The AND operation is used to check if the current case is compatible with the previous column. Since the number of cases is 8 and the maximum bits is 4, the inner loops can be considered as having constant time, the time complexity of this algorithm is $O(n)$.

#pagebreak()
= Question 3

42. Trapping Rain Water (Hard)

#figure(image("q31.png", height: 80%),)

The algorithm iterate through the height 3 times with each time have a cost of $O(n)$, so the total is still $O(n)$



#pagebreak()

1526. Minimum Number of Increments on Subarrays to Form a Target Array (Hard)
#figure(image("q32.png", height: 80%),)

The algorithm iterate over the size of the target so the time complexity is $O(n)$

