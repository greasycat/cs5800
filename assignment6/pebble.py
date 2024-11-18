cases = [0, 0b1000, 0b1010, 0b1001, 0b0100, 0b0101, 0b0010, 0b0001]
def sum_selected_by_binary(column, binary_number):
    total_sum = 0
    for i in range(len(column)):
        if binary_number & (1 << i):
            total_sum += column[i]
    return total_sum

def pebble_game(table, n):
    placement = [0] * (n + 1)
    for i in range(1, n + 1):
        max_sum = 0
        for case in cases:
            temp_sum = sum_selected_by_binary(table[i-1], case)
            if placement[i-1] & case == 0 and temp_sum > max_sum:
                max_sum = temp_sum
                placement[i] = case
    return placement
            

def print_pebble_game(placement):
    for x in placement[1:]:
        print(bin(x)[2:].zfill(4))
    
print_pebble_game(pebble_game(, n))