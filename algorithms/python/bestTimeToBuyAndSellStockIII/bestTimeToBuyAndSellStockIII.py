import sys
class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        if not prices: return 0

        profit = [[[0 for _ in xrange(2)] for _ in range(3)] for _ in xrange(len(prices))]
        profit[0][0][0], profit[0][0][1] = 0, -prices[0]
        profit[0][1][0], profit[0][1][1] = -sys.maxint, -sys.maxint
        profit[0][2][0], profit[0][2][1] = -sys.maxint, -sys.maxint

        for i in range(1, len(prices)):
            profit[i][0][0] = profit[i-1][0][0]
            profit[i][0][1] = max(profit[i-1][0][1], profit[i-1][0][0] - prices[i])

            profit[i][1][0] = max(profit[i-1][1][0], profit[i-1][0][1] + prices[i])
            profit[i][1][1] = max(profit[i-1][1][1], profit[i-1][1][0] - prices[i])

            profit[i][2][0] = max(profit[i-1][2][0], profit[i-1][1][1] + prices[i])
        end = len(prices) - 1
        return max(profit[end][0][0], profit[end][1][0], profit[end][2][0])
