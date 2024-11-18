def frog(n):
    if n == 0:
        return 0
    if n == 1:
        return 0
    if n == 2:
        return 1
    if n == 3:
        return 1
    return frog(n-2) + frog(n-3)

def pascal_triangle_entry(n, k):
    dp = [0] * (k + 1)
    dp[0] = 1  
    for i in range(1, n + 1):
        print("new row")
        for j in range(min(i, k), 0, -1):
            dp[j] += dp[j - 1]
            print(dp)
    return dp

# Example usage:
n = 5
k = 3
print(f"Pascal's Triangle entry at row {n}, position {k} is {pascal_triangle_entry(n, k)}")
