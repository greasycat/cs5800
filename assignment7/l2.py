from heapq import heappush, heappop
import math

class Solution:
    def smallestRange(self, nums: List[List[int]]) -> List[int]:
        heap = []
        max_v = -math.inf

        for i in range(len(nums)):
            heappush(heap, (nums[i][0], i, 0))
            max_v = max(max_v, nums[i][0])

        r = [heap[0][0], math.inf]

        while heap:
            min_v, i, j = heappop(heap)

            if max_v - min_v < r[1] - r[0]:
                r[0], r[1] = min_v, max_v

            if j == len(nums[i]) - 1:
                break

            # Add the next element from the same list to the heap
            next_v = nums[i][j + 1]
            heappush(heap, (next_v, i, j + 1))
            max_v = max(max_v, next_v)

        return r
