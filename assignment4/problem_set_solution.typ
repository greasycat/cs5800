#set page(
  paper: "us-letter",
  margin: (x: 0.75in, top: 1.25in, bottom: 1in),
  header: [
    #rect(stroke: (bottom: 0.5pt))[
      *CS5800* \ Problem Set 4 Solution
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

= Question 1
== Solution to (a)
#figure(image("images/1-1.png"),
  caption: [Solution (a)]
)

#pagebreak()
== Solution to (b)

Denote Disk 1-4 (ascending in size) as D1, D2, D3, D4. and Tower 1-3 as
T1, T2, T3. And denote the set of disk on one tower as D12 (disk 1 and
2), D123 (disk 1, 2, 3), etc.

To win the game, we need move all disk from T1 to T3, and since the
placement of disks are strictly in desceding order, the largest disk D4
should be the first disk to move to t3. And the second largest follows,
then the third largest, and the smallest disk D1 should be the last disk
to move to T3.

Therefore, the total number of steps to move all 4 disks is:
$ T (4) = T (upright("D4 T1 to T3")) + T (upright("D3 T1 to T3")) + T (upright("D2 T1 to T3")) + T (upright("D1 T1 to T3")) $

However, it is hard to track the number of steps for each disk to move
to t3 Directly. Therefore, we can break down the problem into smaller
subproblems by considering the the movement of D123 from T1 to T3 as a
whole, this gives us the following equation:

$ T (4) = T (upright("D4 T1 to T3")) + T (upright("D123 T1 to T3")) $

And for D4 to move to T3, we also need to move D1-3 to T2 first, and
then move D4 to T3, and then move D1-3 to T3. Therefore, the total
number of steps for D4 to move to T3 is:

$ T (4) = 1 + T (upright("D123 T1 to T2")) + T (upright("D123 to T3")) $

Considering T123 from T1 to T2 and T1 to T3, because there’s no T4
restrict the movement, the number of steps for T123 to move to T2 and T3
are the same. Therefore, we have:

$ T (4) & = 1 + T (upright("D123 T1 to T3")) + T (upright("D123 to T3"))\
 & = 1 + 2 T (3)\
 & = 15 $

And because $T (3)$ is given as the minimum number of steps to move 3
disks from T1 to T3, we have $T (3) = 7$. Therefore, the minimum number
of steps to move 4 disks from T1 to T3 is 15.

#pagebreak()
== Solution to (c)
To find the recursive relation, we should first find the recursive
relation for $T (3)$. It is easy to see that to move D3 to T3, we need
to move D12 to T2 first, then move D3 to T3, and then move D12 to T3.
This gives us the following relation:

$ T (3) = 1 + 2 T (2) $

And the recursive relation for $T (2)$ is almost trivial, we simply move
D1 to T2, then move D2 to T3, and then move D1 to T3. Therefore, we
have:

$ T (2) = 1 + 2 T (1) $

Based on the solution to (b), we can derive the following relation:

$ T (4) & = 1 + 2 T (3)\
T (3) & = 1 + 2 T (2)\
T (2) & = 1 + 2 T (1)\
T (1) & = 1 $

Then consider we have k where $k > 4 thin k in bb(Z^(+))$ disk. In order
to move Dk to T3, we need to move D1 to Dk to T2 first, then move Dk to
T3, and then move D1 to Dk to T3. This is the minimal move for every
level of k, since you must have T3 cleared as well as every disk above
Dk removed before move Dk to T3, which results in a D1 to DK on T2. In
addition, move D1 to Dk to D2 and to D3 are 2 same sets of movements
since there’s no Dk to restrict the movement of D1 to Dk and one can
switch the role of T2 and T3.

Therefore we propose a recurrence relation for $T (n)$:
$ T (n) = 1 + 2 T (n - 1) $

Then we can solve this recurrence relation by substitution method:

$ T (n) & = 1 + 2 T (n - 1)\
 & = 1 + 2 (1 + 2 T (n - 2)) = 1 + 2 + 4 T (n - 2)\
 & = 1 + 2 + 4 (1 + 2 T (n - 3)) = 1 + 2 + 4 + 8 T (n - 3)\
 & = dots.h\
 & = (1 + 2 + 4 + 8 + dots.h + 2^(k - 1)) + 2^k T (n - k)\
 $

where $0 < k < n , k in bb(Z)$

The recursion stops when $n - k = 1 arrow.r.double k = n - 1$.
Therefore, the minimal total number of steps to move n disks from T1 to
T3 is:

$ T (n) & = sum_(i = 0)^(n - 2) 2^i + 2^(n - 1) dot.op 1\
 & = frac((2^(n - 1)) - 1, 2 - 1) + 2^(n - 1) &  & upright("geometric seris sum of ") n - 1 upright(" terms")\
 & = 2^(n - 1) - 1 + 2^(n - 1)\
 & = 2^n - 1 $

#pagebreak()
== Solution to (d)
Let $n = log (m)$. The relation becomes
$ T (log (m)) = 2 T (log (m) - 1) + 1 = 2 T (log (m / 2)) + 1 $

Define $S (m) = T (log (m))$, then we have $ S (m) = 2 S (m / 2) + 1 $

This has the form required by master theorem, where
$a = 2 , b = 2 , f (n) = 1 upright(" and is asymptotic positive")$.

Check case of 1 master theorem: If
$f (n) = O (n^(log_b a - epsilon.alt))$ for some $epsilon.alt > 0$, then
$S (m) = Theta (n^(log_b a))$. - This is true because
$f (n) = O (n^(log_b a - epsilon.alt))$ for $epsilon.alt = 1$, since
$1 = O (n^(1 - 1))$.

Therefore, the solution is: $ S (m) = Theta (m) $

since $n = l o g (m) arrow.r m = 2^n$, we have:

$ T (n) = S (2^m) = Theta (2^n) $

So from (c) we have $T (n) = 2^n - 1$, and by the definition of $Theta$,
we can find $c_1 > 0 , c_2 > 0 , n_0 gt.eq 0$ such that:

$ c_1 dot.op 2^n lt.eq 2^n - 1 lt.eq c_2 dot.op 2^n upright(" for all ") n gt.eq n_0 $

let’s choose $c_1 = 0.5 , c_2 = 1 , n_0 = 1$, then we have:

$ 2^(n - 1) lt.eq 2^n - 1 lt.eq 2^n upright(" for all ") n gt.eq 1 $

The upper bound is trivial to verify, and the lower bound is also true
since: $ c_0 dot.op 2^n & lt.eq 2^n - 1\
1 & lt.eq 2^n (1 - c_0)\
1 - c_0 & gt.eq 1 / 2^n\
c_0 & lt.eq 1 - 1 / 2^n $

sub in $n = 1$, we have $c_0 lt.eq 0.5$, therefore, the $c_0 = 0.5$
works

#pagebreak()
= Question 2
= Solution to (a)
+ Pivot arr[6]: 4
    - [3, 1, 5, 7, 6, 2, 4]
    - Compare arr[0] = 3 and arr[0] = 3
    - Since arr[0] = 3 >= arr[0] = 3, swap with self
    - [3, 1, 5, 7, 6, 2, 4]
    - Compare arr[1] = 1 and arr[1] = 1
    - Since arr[1] = 1 >= arr[1] = 1, swap with self
    - [3, 1, 5, 7, 6, 2, 4]
    - Compare arr[2] = 5 and arr[2] = 5
    - No swap
    - [3, 1, 5, 7, 6, 2, 4]
    - Compare arr[2] = 5 and arr[3] = 7
    - No swap
    - [3, 1, 5, 7, 6, 2, 4]
    - Compare arr[2] = 5 and arr[4] = 6
    - No swap
    - [3, 1, 5, 7, 6, 2, 4]
    - Compare arr[2] = 5 and arr[5] = 2
    - Since arr[2] = 2 >= arr[5] = 5, swap 
    - Last swap to put pivot in place: arr[3] = 7 and arr[6] = 4
+ Pivot arr[2]: 2
    - [3, 1, 2]
    - Compare arr[0] = 3 and arr[0] = 3
    - No swap
    - [3, 1, 2]
    - Compare arr[0] = 3 and arr[1] = 1
    - Since arr[0] = 1 >= arr[1] = 3, swap 
    - Last swap to put pivot in place: arr[1] = 3 and arr[2] = 2
+ Pivot arr[6]: 7
    - [6, 5, 7]
    - Compare arr[4] = 6 and arr[4] = 6
    - Since arr[4] = 6 >= arr[4] = 6, swap with self
    - [6, 5, 7]
    - Compare arr[5] = 5 and arr[5] = 5
    - Since arr[5] = 5 >= arr[5] = 5, swap with self
    - Last swap to put pivot in place: arr[6] = 7 and arr[6] = 7
+ Pivot arr[5]: 5
    - [6, 5]
    - Compare arr[4] = 6 and arr[4] = 6
    - No swap
    - Last swap to put pivot in place: arr[4] = 6 and arr[5] = 5
Since the sort is done in each partition, the final sorted array is: $A = [1 , 2 , 3 , 4 , 5 , 6 , 7]$

#pagebreak()
== Solution to (b)
This is a sorted array, so the partition will always be on the left side
of the pivot. Therefore, the number of comparisons is the sum of the
first n-1 integers

$ A_0 & = [1 , 2 , 3 , 4 , 5 , 6 , 7] &  & upright(" number of comparison is 6")\
A_1 & = [1 , 2 , 3 , 4 , 5 , 6] &  & upright(" number of comparison is 5")\
A_2 & = [1 , 2 , 3 , 4 , 5] &  & upright(" number of comparison is 4")\
A_3 & = [1 , 2 , 3 , 4] &  & upright(" number of comparison is 3")\
A_4 & = [1 , 2 , 3] &  & upright(" number of comparison is 2")\
A_5 & = [1 , 2] &  & upright(" number of comparison is 1")\
 $

$ n = 1 + 2 + 3 + 4 + 5 + 6 = 21 $

#pagebreak()
== Solution to (c)
Suppose the partition is based on a value p, where $0 < p < 1$, so
approximately each time parititon will have $n p$ and $n (1 - p)$
elements. We can then express the number of comparison as:
$ T (n) = T (p n) + T ((1 - p) n) + n - 1 $

And we know that quick sort has the best case $O (n log n)$. We then try
substituing $T (n) = n log n$, since we want to know the best case with
least comparison, which gives us:

$ T (n) & = (p n) log p n + (1 - p) n log (1 - p) n + n - 1\
 $

To find which p gives the minimum number of comparison, we can take the
derivative of T(n) with respect to p and set it to 0:
$ frac(partial, partial p) T (n) = 0 $

$ n^2 log p + n^2 log (1 - p) = 0 $

$ p = 0.5 $

Therefore, the best case is to have the partition as close to the middle
as possible, which is to have the pivot as the median of the array.

Therefore, given a sorted array,
$ [a_1 , a_2 , a_3 , a_4 , a_5 , a_6 , a_7] $ where $a_i < a_j$ for
$i < j$, the best case is to have the pivot as $a_4$, which is the
median of the array. We will put $a_4$ as the pivot, then we will have
two partitions which we don’t know the order,

$ A = [[a ' , a '' , a ''] , a_4 , [a '''' , a '''' ' , a '''' '']] $

Similarly, we will put the median of the two partitions as the pivot,

$ A_1 = [[a ' , a ''] , a_2] , A_2 = [[a ''' , a '''' '] , a_6] $

Since there’s only one way to partition a size of 2 array, the order can
be arbitrary

And then we can merge the two partitions to get the original array. Here
$a_6 , a_4$ are swapped to get the original array
$ A = [a ' , a '' , a_2 , a_6 , a ''' , a '''' , a_4] $

This will give us the minimum number of comparisons 10. A permutation
run verify that this is the best case.

#pagebreak()
== Solution to (d)
As showed in part (c), the best case is to have the pivot as the median of the array, which is
the middle element of the array. Therefore, the recurrence relation can be expressed and solved as follows:
$ T (n) &= n - 1 + 2 T (n / 2) \
&= n - 1 + 2 (n / 2 - 1 + 2 T (n / 4)) = (n-1) + (n-2) + 2T(n /4) & & upright("by substitution") \
&= n - 1 + n - 2 + n - 3 + 2T(n / 8) = (n-1) + (n-2) + (n-3) + 2T(n /8) \
&= (n-1) + (n-2) + (n-3) +  dots.h + (n-k) + 2T(n / 2^k) \
$

The recursion stops when $n / 2^k = 1 arrow.r.double k = log n = log (2^k - 1)$. 

Considering n = 1, we have $T (1) = 1$ as one comparison is needed to check the size of the array.
Thus
$
T(n) &= sum_(i=1)^(log n) (n - i) + 2 \
&= sum_(i=1)^(log n) n - sum_(i=1)^(log n) i + 2 \
&= n log n - log n (log n + 1)/2 + 2 \
&= (2^k - 1) log (2^k - 1) - log (2^k-1) (log (2^k-1) + 1)/2 + 2 \
$

It's easy to see that T(n) = $Theta (n log n)$

In the worst case, the pivot is the smallest or largest element of the
array, which is the first or last element of the array. Therefore, the
recurrence relation is:
$ T (n) = n - 1 + T (n - 1) = n + (n - 1) + dots.h + 1 = sum_(i = 1)^(n - 1) i $

This is a arithmetic series, and the sum of the series is
$T(n) = n(n-1)/2 = ((2^k-1)(2^k - 2))/2$. Therefore, the worst case is $T (n) = O (n^2)$

#pagebreak()
= Question 3
== Solution to (a)

+  [3, 1, 5, 7, 6, 2, 4]
  - Compare arr[0] = 3 and arr[6] = 4
  - No swap
+  [3, 1, 5, 7, 6, 2, 4]
  - Compare arr[0] = 3 and arr[5] = 2
  - Since arr[0] = 3 > arr[5] = 2, swap
+  [2, 1, 5, 7, 6, 3, 4]
  - Compare arr[5] = 3 and arr[1] = 1
  - No swap
+  [2, 1, 5, 7, 6, 3, 4]
  - Compare arr[5] = 3 and arr[2] = 5
  - Since arr[5] = 3 > arr[2] = 5, swap
+  [2, 1, 3, 7, 6, 5, 4]
  - Compare arr[2] = 3 and arr[4] = 6
  - No swap
+  [2, 1, 3, 7, 6, 5, 4]
  - Compare arr[2] = 3 and arr[3] = 7
  - No swap

#pagebreak()
== Solution to (b)
+ PARTITION(1,7) =  [3, 1, 5, 7, 6, 2, 4]  Compare 6 times 
+ PARTITION(1,2) =  [2, 1] Compare 1 times
+ PARTITION(4,7) =  [7, 6, 5, 4] Compare 3 times
+ PARTITION(4,6) =  [4, 6, 5] Compare 2 times
+ PARTITION(5,6) =  [6, 5] Compare 1 times

Therefore, the total number of comparisons is 6 + 1 + 3 + 2 + 1 = 13


#pagebreak()
== Solution to (c)
```python
def PARTITION(arr, p, r):
    direction = -1
    print(f"+ PARTITION({p}:{r+1}) = ",arr[p:r+1])
    count = 0
    while p != r:
        count += 1
        if (arr[p] > arr[r] and p < r) or (arr[p] < arr[r] and p > r):
            print(f"  - swap {arr[p]} and {arr[r]}")
            arr[p], arr[r] = arr[r], arr[p]
            p, r = r, p
            direction *= -1
        r += direction
    print(f"+ After compare {count} times, A = ",arr)
    return p

def HUNGARIAN_QUICKSORT(arr, p, r):
    if p < r:
        q = PARTITION(arr, p, r)
        HUNGARIAN_QUICKSORT(arr, p, q - 1)
        HUNGARIAN_QUICKSORT(arr, q + 1, r)
    pass

arr = [3, 1, 5, 7, 6, 2, 4] 
HUNGARIAN_QUICKSORT(arr, 0, len(arr) - 1)
```
Output:
```
+ PARTITION(0:7) =  [3, 1, 5, 7, 6, 2, 4]
  - swap 3 and 2
  - swap 3 and 5
+ After compare 6 times, A =  [2, 1, 3, 7, 6, 5, 4]
+ PARTITION(0:2) =  [2, 1]
  - swap 2 and 1
+ After compare 1 times, A =  [1, 2, 3, 7, 6, 5, 4]
+ PARTITION(3:7) =  [7, 6, 5, 4]
  - swap 7 and 4
+ After compare 3 times, A =  [1, 2, 3, 4, 6, 5, 7]
+ PARTITION(3:6) =  [4, 6, 5]
+ After compare 2 times, A =  [1, 2, 3, 4, 6, 5, 7]
+ PARTITION(4:6) =  [6, 5]
  - swap 6 and 5
+ After compare 1 times, A =  [1, 2, 3, 4, 5, 6, 7]
```

#pagebreak()
= Question 4

Let $k in bb(Z^+)$

$
T(n) &= x T(n/y) + n^z \
&= x (x T(n/y^2) + (n/y)^z) + n^z \
&= x^2 T(n/y^2) + x (n/y)^z + n^z \
&= x^3 T(n/y^3) + x^2 (n/y^2)^z + x (n/y)^z + n^z \ \
&= dots.h \
&= x^k T(n/y^k) + x^(k-1) (n/y^(k-1))^z + dots.h + x (n/y)^z + n^z \
&= x^k T(n/y^k) + sum_(i=0)^(k-1) x^i (n/y^i)^z \
$

The recursion stops when $n/y^k = 1 arrow.r.double k = log_y n$

#v(3em)
Side proof of $ Theta (f(n) + g(n)) subset.eq Theta (max(f(n), g(n))) $
Notice that $ f(n) + g(n) <= 2 dot max(f(n), g(n)) $ and $ max(f(n), g(n)) <= f(n) + g(n) $

therefore $ Theta (f(n) + g(n)) subset.eq Theta (max(f(n), g(n))) $


#pagebreak()
== Solution to (a)

When $z < log_y x$
The geometric sum is 
$
sum_(i=0)^(k-1) x^i (n/y^i)^z = sum_(i=0)^(k-1) (x/y^z)^i n^z = frac((x/y^z)^k - 1, x/y^z - 1) n^z
$

Therefore, the total number of operations is:
$
T(n) &= x^k T(n/y^k) + frac((x/y^z)^k - 1, x/y^z - 1) n^z \
&= x^k T(1) + frac((x/y^z)^k - 1, x/y^z - 1) n^z \
&= x^(log_y n) + frac((x/y^z)^(log_y n) - 1, x/y^z - 1) n^z \
&= n^(log_y x) + frac((n^(log_y x)/n^z) - 1, x/y^z - 1) n^z \
&= n^(log_y x) + frac(n^(log_y x-z) - 1, x/y^z - 1) n^z \
&= n^(log_y x) + frac(n^(log_y x) - n^z, x/y^z - 1) \
$

denote $r = x/y^z$, since $z < log_y x arrow.r.double y^z < x arrow.r.double r > 1$,
we then have:

$
T(n) &= n^(log_y x) + frac(n^(log_y x) - n^z, r - 1) \
&= n^(log_y x) + frac(n^(log_y x), r - 1) - frac(n^z, r - 1) \
&=  (frac(1, r - 1) + 1) n^(log_y x) - (frac(1, r - 1)) n^z \
&=  Theta((frac(1, r - 1) + 1) n^(log_y x) - (frac(1, r - 1)) n^z )\
&= Theta (frac(1, r - 1) n^(log_y x)) & "Since" z<log_y x \
&= Theta (n^(log_y x)) \
$

#pagebreak()
= Solution to (b)

When $z = log_y x$, $x/y^z = x/y^(log_y x) = x/x = 1$
The geometric sum is
$
(k)n^z = (log_y n)n^z = n^(log_y x) log_y n
$

Therefore, the total number of operations is:
$
T(n) &= x^k T(n/y^k) + (k)n^z \
&= x^(log_y n) +  n^(log_y x) log_y n\
&= n^(log_y x) + n^(log_y x) log_y n\
&= Theta (n^(log_y x) + n^(log_y x) log_y n)\
&= Theta (n^(log_y x) log_y n)\
$

#pagebreak()
= Solution to (c)

When $z > log_y x$

$
sum_(i=0)^(k-1) x^i (n/y^i)^z = sum_(i=0)^(k-1) (x/y^z)^i n^z = frac((x/y^z)^k - 1, x/y^z - 1) n^z
$

Therefore, the total number of operations is:
$
T(n) &= x^k T(n/y^k) + frac((x/y^z)^k - 1, x/y^z - 1) n^z \
&= n^(log_y x) + frac(n^(log_y x) - n^z, x/y^z - 1) \
$

denote $r = x/y^z$, since $z > log_y x arrow.r.double y^z > x arrow.r.double r < 1$,

$
T(n) &= n^(log_y x) + frac(n^(log_y x) - n^z, r - 1) \
&= n^(log_y x) + frac(n^z - n^(log_y x), 1 - r) \
&= n^(log_y x) +frac(n^z, 1 - r) - frac(n^(log_y x), 1 - r)  \
&=  (1 - frac(1, 1 - r)) n^(log_y x) + (frac(1, r - 1)) n^z \
&=  Theta((1 - frac(1, 1 - r)) n^(log_y x) + (frac(1, 1-r)) n^z )\
&= Theta (frac(1, 1-r)n^z) & "Since" z>log_y x \
&= Theta (n^(z)) \
$


#pagebreak()
= Solution to (d)

Given $ T(n)=7T(n/2)+n^2 $ we have $x = 7, y=2, z=2$

Since $z = 2 < log_y x = log_2 7 = 2.807$, we have $T(n) = Theta(n^(log_y x)) approx Theta(n^2.807)$