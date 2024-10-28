def q1():
    def max_subarray_sum(arr):
        max_current = max_global = arr[0]

        for i in range(1, len(arr)):
            max_current = max(arr[i], max_current + arr[i])
            if max_current > max_global:
                max_global = max_current

        return max_global

    A = [-2, -3, 4, -1, -2, 1, 5, -3]
    print(max_subarray_sum(A))
    A = [1, 2, -4, 8, 16, -32, 64, 128, -256, 512, 1024, -2048]
    print(max_subarray_sum(A))

def q2():
    swaps = []
    def build_max_heap(arr):
        n = len(arr)

        # Start from the last non-leaf node and heapify each node up to the root
        for i in range(n // 2 - 1, -1, -1):
            heapify(arr, n, i, swaps)

    def heapify(arr, n, i, swaps):
        # Set initial values for the largest element as root
        largest = i
        left = 2 * i + 1    # left child
        right = 2 * i + 2   # right child

        # Compare left child with root
        if left < n:
            # print(f"Comparing arr[{i}] = {arr[i]} with arr[{left}] = {arr[left]}")
            if arr[left] > arr[largest]:
                largest = left

        # Compare right child with the largest so far
        if right < n:
            # print(f"Comparing arr[{largest}] = {arr[largest]} with arr[{right}] = {arr[right]}")
            if arr[right] > arr[largest]:
                largest = right

        # If the largest element is not the root, swap and continue heapifying
        if largest != i:
            print(f"Swapping arr[{i}] = {arr[i]} and arr[{largest}] = {arr[largest]}")
            swaps.append((arr[i], arr[largest]))
            arr[i], arr[largest] = arr[largest], arr[i]
            heapify(arr, n, largest, swaps)

    # Example usage
    # arr = [4, 1, 3, 2, 16, 9, 10, 14, 8, 7]
    arr = [2, 4, 6, 8, 10, 12, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    build_max_heap(arr)
    print("Heapified array:", arr)
    print("Number of swaps:", len(swaps))

def q3():
    def partition(arr, low, high):
        pivot = arr[low]  # Select the first element as the pivot
        left = low + 1
        right = high
        
        while True:
            # Move right towards the left until we find an element less than the pivot
            while left <= right and arr[right] >= pivot:
                right -= 1
            
            # Move left towards the right until we find an element greater than the pivot
            while left <= right and arr[left] <= pivot:
                left += 1
            
            # If left and right have crossed, break
            if left > right:
                break
            else:
                # Swap elements at left and right
                arr[left], arr[right] = arr[right], arr[left]
        
        # Swap the pivot with the element at the right index
        arr[low], arr[right] = arr[right], arr[low]
        
        # Return the final position of the pivot
        return right

    A = [1,2,7,8,9,6,3,4,5]
    partition(A, 0, len(A)-1)
    print(A)

def q4():
    class TreeNode:
        def __init__(self, value=0, left=None, right=None):
            self.value = value
            self.left = left
            self.right = right
    def preorder_traversal(node):
        if node:
            print(node.value, end=" ")  # Visit the root
            preorder_traversal(node.left)  # Traverse left subtree
            preorder_traversal(node.right)  # Traverse right subtree
    def inorder_traversal(node):
        if node:
            inorder_traversal(node.left)  # Traverse left subtree
            print(node.value, end=" ")  # Visit the root
            inorder_traversal(node.right)  # Traverse right subtree
    def postorder_traversal(node):
        if node:
            postorder_traversal(node.left)  # Traverse left subtree
            postorder_traversal(node.right)  # Traverse right subtree
            print(node.value, end=" ")  # Visit the root
    
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

    print("Preorder traversal:")
    preorder_traversal(root)
    print("\nInorder traversal:")
    inorder_traversal(root)
    print("\nPostorder traversal:")
    postorder_traversal(root)

def q5():
    class TreeNode:
        def __init__(self, value=0, left=None, right=None):
            self.value = value
            self.left = left
            self.right = right
    def preorder_traversal(node):
        if node:
            print(node.value, end=" ")  # Visit the root
            preorder_traversal(node.left)  # Traverse left subtree
            preorder_traversal(node.right)  # Traverse right subtree
    def inorder_traversal(node):
        if node:
            inorder_traversal(node.left)  # Traverse left subtree
            print(node.value, end=" ")  # Visit the root
            inorder_traversal(node.right)  # Traverse right subtree
    def postorder_traversal(node):
        if node:
            postorder_traversal(node.left)  # Traverse left subtree
            postorder_traversal(node.right)  # Traverse right subtree
            print(node.value, end=" ")  # Visit the root
    
    root = TreeNode("e")
    root.left = TreeNode("c")
    root.left.left = TreeNode("a")
    root.left.left.right = TreeNode("b")

    root.left.right = TreeNode("d")
    root.right = TreeNode("h")
    root.right.left = TreeNode("f")
    root.right.left.right = TreeNode("g")
    root.right.right = TreeNode("j")
    root.right.right.left = TreeNode("i")

    print("Preorder traversal:")
    preorder_traversal(root)
    print("\nInorder traversal:")
    inorder_traversal(root)
    print("\nPostorder traversal:")
    postorder_traversal(root)

# q5()

print(sorted([4,3]))