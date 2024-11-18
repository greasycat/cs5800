def find_max(arr):
    n = len(arr)
    selection = []
    for i in range(1, n-1):
        selection.append((arr[i]-(arr[i-1]+arr[i+1]),i))
    
    # sort selection by the first element of the tuple
    selection.sort(reverse=True)

    options = set(range(n))

    result = []

    for diff, i in selection:
        if i in options:
            options.discard(i)
            options.discard(i-1)
            options.discard(i+1)
            result.append(arr[i])

    

    return result


print(find_max([6,5,6,5,1,7,7,5,1,5,7,3]))
