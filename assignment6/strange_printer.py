def sprint(s):
    d = {}
    for ch in s:
        if ch in d.keys():
            d[ch] += 1
        else:
            d[ch] = 0
    pass

sprint('abcaba')