def minimal_ops(target):
    arr = sorted(target.copy())
    if arr == 0:
        return 0

    l = len(target)
    p = 0
    ops = 0
    flag = True
    while flag:
        for i in range(p, l):
            arr[i] -= 1
            print(f"a[{i}]={arr[i]}, ops={ops}, p={p}")
            if arr[i] != 0:
                ops += 1
                p = i
                break
            if i == l-1:
                flag = False
                break
        if p == l - 1:
            ops += arr[i] + 1

        pass
    return ops

print(minimal_ops([3,1,1,1]))
