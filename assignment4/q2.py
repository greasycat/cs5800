def PARTITION(arr, p, r):
    pivot = arr[r]  # choosing the last element as pivot
    i = p - 1       # index of the smaller element
    print(f"+ Pivot arr[{r}]: {pivot}")
    for j in range(p, r):
        print("    -", arr[p:r+1])
        print(f"    - Compare arr[{i+1}] = {arr[i+1]} and arr[{j}] = {arr[j]}")
        if arr[j] <= pivot:
            i = i + 1
            arr[i], arr[j] = arr[j], arr[i]  # swap
            s = "with self" if i == j else ""
            print(f"    - Since arr[{i}] = {arr[i]} >= arr[{j}] = {arr[j]}, swap {s}")
        else:
            print(f"    - No swap")
    print(f"    - Last swap to put pivot in place: arr[{i + 1}] = {arr[i + 1]} and arr[{r}] = {arr[r]}")
    arr[i + 1], arr[r] = arr[r], arr[i + 1]  # swap the pivot element to the correct position
    return i + 1  # return the index of the pivot

def HUNGARIAN_QUICKSORT(arr, p, r):
    if p < r:
        q = PARTITION(arr, p, r)
        HUNGARIAN_QUICKSORT(arr, p, q - 1)
        HUNGARIAN_QUICKSORT(arr, q + 1, r)
    pass

arr = [3, 1, 5, 7, 6, 2, 4] 
HUNGARIAN_QUICKSORT(arr, 0, len(arr) - 1)
print(arr)
