#set page(
  paper: "us-letter",
  margin: (x: 0.75in, top: 1.25in, bottom: 1in),
  header: [
    #rect(stroke: (bottom: 0.5pt))[
      *CS5800* \ Problem Set 5 Solution
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

= Problem 1
- (1) D
- (2) $2$
- (3) $k=5$
- (4) $f(n) = O(g(n))$
- (5) $S=1536$
- (6) Number of swap is $8$
- (7) $[1, 2, 7, 8, 9, 6, 3, 4, 5]$
(8) 
Height of the node is the longest path or number of edges from the node to the children.  Denote the height as h(N) where N is the node.
$ h(N) = cases(
  0 "if N is a leaf node",
  1 + max(h("N's left child node"), h("N's right child node")) \
)  $
Depth of the node is the longest path or number of edges from the root to the node. Denote the depth as d(N) where N is the node.
$
  d(N) = cases(
    0 "if N is the root node",
    1 + d("N's parent node") \
  )
$