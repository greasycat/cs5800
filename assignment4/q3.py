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

