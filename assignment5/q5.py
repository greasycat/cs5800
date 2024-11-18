class TreeNode:
    def __init__(self, value=0, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right
def bfs_traversal(root):
    if not root:
        return
    q = queue.Queue()
    q.put(root)
    while not q.empty():
        node = q.get()
        print(node.value, end=" ")
        # Collect children and sort them alphabetically
        children = []
        if node.left:
            children.append(node.left)
        if node.right:
            children.append(node.right)
        children.sort(key=lambda x: x.value)
        for child in children:
            q.put(child)

root = TreeNode("a")
root.left = TreeNode("b")
root.left.left = TreeNode("d")
root.left.right = TreeNode("e")

root.right = TreeNode("c")

f = TreeNode("f")
f.left = TreeNode("h")
f.left.left = TreeNode("l")
f.left.right = TreeNode("m")
f.left.right.left = TreeNode("q")
f.right = TreeNode("i")

root.right.left = f

g = TreeNode("g")
g.left = TreeNode("j")
g.left.left = TreeNode("n")
g.left.right = TreeNode("o")
g.right = TreeNode("k")
g.right.right = TreeNode("p")

root.right.right = g

# bfs_traversal(root)

def compute_diameter(root):
    max_diameter = [0]  # Use a list to make it mutable in nested function

    def height(node):
        if not node:
            return 0
        # Recursively get the height of left and right subtrees
        left_height = height(node.left)
        right_height = height(node.right)
        # Update the diameter at this node
        max_diameter[0] = max(max_diameter[0], left_height + right_height)
        # Return the height of the subtree rooted at this node
        return max(left_height, right_height) + 1

    height(root)
    return max_diameter[0]

print(compute_diameter(root))

