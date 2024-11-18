def trap(height):
    l = len(height)
    h = max(height)
    dp = [[1]*l] + [[0] * l] * h

    for i in range(h): # loop over each height
        for j in range(l): # loop over each x value
            if h <= height[j]:
                pass
    return dp


print(trap([0,1,0,2,1,0,1,3,2,1,2,1]))