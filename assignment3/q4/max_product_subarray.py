class Solution:
    def maxProduct(self, nums):
        return self.max_product_sub(nums, 0, len(nums) - 1)

    def max_product_sub(self, nums, left, right):
        if left == right:
            return nums[left]

        mid = (left + right) // 2
        left_max = self.max_product_sub(nums, left, mid)
        right_max = self.max_product_sub(nums, mid + 1, right)

        max_left_product = min_left_product = temp_product = nums[mid]
        for i in range(mid - 1, left - 1, -1):
            temp_product *= nums[i]
            max_left_product = max(max_left_product, temp_product)
            min_left_product = min(min_left_product, temp_product)

        max_right_product = min_right_product = temp_product = nums[mid + 1]
        for i in range(mid + 2, right + 1):
            temp_product *= nums[i]
            max_right_product = max(max_right_product, temp_product)
            min_right_product = min(min_right_product, temp_product)

        candidates = [
			left_max,
			right_max,
            max_left_product * max_right_product,
            max_left_product * min_right_product,
            min_left_product * max_right_product,
            min_left_product * min_right_product
        ]
        

        return max(candidates)
