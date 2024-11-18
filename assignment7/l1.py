class Child:
    def __init__(self, rating, left, right):
        self.rating = rating
        self.left = left
        self.right = right
        self.candy = 1
class Solution:

    def candy(self, ratings: List[int]) -> int:
        children = []
        n = len(ratings)
        for i, rating in enumerate(ratings):
            children.append(Child(rating, i-1, i+1))

        sorted_children = sorted(children, key=lambda child: child.rating)

        for child in sorted_children:
            if 0 <= child.left < n:
                left = children[child.left]
                if left.rating < child.rating and child.candy <= left.candy:
                    child.candy = left.candy + 1
            if 0 <= child.right < n:
                right = children[child.right]
                if right.rating < child.rating and child.candy <= right.candy:
                    child.candy =  right.candy + 1
        
        s = 0
        for child in children:
            print(child.candy)
            s += child.candy 
        return s