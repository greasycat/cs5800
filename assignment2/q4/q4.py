def get_critical_events(A, t):
    n_events = 0
    n = len(A)
    for i in range(n):
        for j in range(i + 1, n):
            if A[i] > t * A[j]:
                n_events += 1

    return n_events

if __name__ == "__main__":
    arr1 = [1, 2, 3, 4, 5]
    t1 = 1

    arr2 = [3,4,2,1,5]
    t2 = 2

    print(f"Number of critical events in {arr1} with t={t1}", get_critical_events(arr1, t1))
    print(f"Number of critical events in {arr2} with t={t2}", get_critical_events(arr2, t2))
