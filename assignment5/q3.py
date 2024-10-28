import math

def merge(p, q):

    n1 = len(p)
    n2 = len(q)

    if n1 == 0:
        return q
    
    if n2 == 0:
        return p


    r = []

    if p[0] > q[0]:
        p, q = q, p
        n1, n2 = n2, n1

    h1 = math.floor(math.log2(n1))
    h2 = math.floor(math.log2(n2))

    max_h = max(h1, h2)

    o1 = 0
    o2 = 0
    for i in range(0, max_h+2):
        sz1 = math.comb(max_h, i) if i <= max_h else 0
        sz2 = math.comb(max_h, i-1) if i >= 1 else 0


        for j in range(0, sz2):
            if o2 + j >= n2:
                r.append(math.inf)
            else:
                r.append(q[o2 + j])

        for j in range(0, sz1):
            if o1 + j >= n1:
                r.append(math.inf)
            else:
                r.append(p[o1 + j])
        
        o1 += sz1
        o2 += sz2


    return r

def get_number_ranges(array):
    if not array:
        return []
    
    ranges = []
    start = 0
    current = array[0]
    
    for i, num in enumerate(array[1:], 1):
        if num != current or num == 0:
            ranges.append((current,start, i - 1))
            current = num
            start = i
    # Append the last group
    ranges.append((current, start, len(array) - 1))
    
    return ranges

def get_children_indices(p, index):
    # determine the level of the node i
    max_h = math.floor(math.log2(len(p)))
    start = 0
    end = 0
    last_level = [max_h]*max_h
    cumsum = 0
    for i in range(0, max_h+1):
        level_n = math.comb(max_h, i)
        cumsum += level_n
        end = start + level_n
        new_level = []
        j = 0
        for edge in last_level:
            new_edge = edge - j - 1
            if new_edge <= 0:
                j = 0
                new_level.append(0)
                continue
            new_level.extend([new_edge]*new_edge)
            j += 1

        if start <= index and index < end:
            remain = end - index - 1
            ranges = get_number_ranges(last_level)
            r = ranges[index - start]
            if r[0] == 0:
                return []
            else :
                if r[1] == r[2]:
                    return [r[1]+cumsum]
                return [r[1]+cumsum, r[2]+cumsum]
        
        last_level = new_level
        start = end
    pass

    return None  # Parent not found


def heapify(p, index):
    children = get_children_indices(p, index)

    # get the minimum child and its index and swap with the parent
    min_child = math.inf
    min_child_index = -1
    for i in children:
        if p[i] < min_child:
            min_child = p[i]
            min_child_index = i

    if min_child < p[index]:
        p[index], p[min_child_index] = p[min_child_index], p[index]
        heapify(p, min_child_index)


def delete_min(p):

    p[0], p[-1] = p[-1], p[0]   
    p[-1] = math.inf

    heapify(p, 0)

    pass

def sift_up(p):
    max_h = math.floor(math.log2(len(p)))
    arr = []
    cumsum = 0 
    for i in range(0, max_h+1):
        arr.append(cumsum)
        cumsum += math.comb(max_h, i)

    arr = arr[::-1]
    for i in range(1, len(arr)):
        last = arr[i-1]
        parent = arr[i]

        if p[last] < p[parent]:
            p[last], p[parent] = p[parent], p[last]
            heapify(p, parent)
    pass

def insert(p, x):
    p[-1] = x
    sift_up(p)

arr1 =[7,12,8,13]
arr2 =[3,5,4,9]
merged = merge(arr1, arr2)
print("Merged:", merged)

delete_min(arr1)
print("Deleted min:", arr1)


insert(arr1, 6)
print("Insert", arr1)
