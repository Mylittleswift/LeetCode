class Solution:
    def maxDepth(self, root):
        if not root: return 0
        return 1 + max(self.maxDepth(root.left), self.maxDepth(root.right))

    return root == null ? 0 : 1 + Math.max(self.maxDepth(root.left), self.maxDepth(root.right))
