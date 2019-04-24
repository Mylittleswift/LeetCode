class TraverseOrder:
    def preorder(self, root):
        if root:
            self.traverse_path.append(root.val)
            self.preorder(root.left)
            self.preorder(root.right)


    def inorder(self, root):
        if root:
            self.inorder(root.left)
            self.traverse_path.append(root.val)
            self.inorder(root.right)


    def postOrder(self, root):
        if root:
            self.postOrder(root.left)
            self.postOrder(root.right)
            self.traverse_path.append(root.val)
