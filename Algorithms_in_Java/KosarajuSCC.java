public class KosarajuSCC {
    private boolean[] marked; //reached vertices
    private int[] id; //component identifiers
    private int count; //number of strong components

    public KosarajuSCC(Digraph G) {
        marked = new boolean[G.V()];
        id = new int[G.V()];
        
        /* 1.Given a digraph G, use DepthFirstOrder to compute the reverse
         * postorder of its reverse
         */
        DepthFirstOrder order = new DepthFirstOrder(G.reverse());
        /* 2.Run standard DFS on G, but consider the unmarked vertices
         * in the order just computed instead of the standard numerical order.
         */
        for (int s: order.reversePost()) {
            if (!marked[s]) {
                dfs(G, s);
                count++;
            }
        }
    }

    private void dfs(Graph G, int v) {
        marked[v] = true;
        id[v] = count;
        for (int w: G.adj(v)) {
            if (!marked[w]) {
                dfs(G, w);
            }
        }
    }

    /* 3.All vertices reached on a call to the recursive dfs() from the 
     * constructor are in a strong component
     */
    public boolean stronglyConnected(int v, int w) { return id[v] == id[w]; }
    public int id(int v) { return id[v]; }
    public int count() { return count; }
}