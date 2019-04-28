"""
python 2
"""

class Solution(object):
    def levelOrder(self, root):
        if not root: return []

        result = []
        queue = collections.deque()
        queue.append(root)

        # visited = set(root)

        while queue:
            level_size = len(queue)
            current_level = []

            for _ in range(level_size):
                node = queue.popleft()
                current_level.append(node.val)
                if node.left: queue.append(node.left)
                if node.right: queue.append(node.right)

            result.append(current_level)
        return result