public class DepthFirstOrder {
    
    private boolean[] marked;

    private Queue<Integer> pre;  //vertices in preorder
    private Queue<Integer> post; //vertices in postorder
    private Stack<Integer> reversePost; //vertices in reverse postorder

    public DepthFirstOrder(Digraph G) {
        pre = new Queue<Integer>();
        post = new Queue<Integer>();
        reversePost = new Stack<Integer>();
        marked = new boolean[G.V()];

        for (int v = 0; v < G.V(); v++) {
            if (!marked[v]) {
                dfs(G, v);
            }
        }
    }

    private void dfs(Digraph G, int v) {
        
        pre.enqueue(v);
        marked[v] = true;
        for (int w: G.adj(v)) {
            if (!marked[v]) {
                dfs(G, w);
            }
        }
        post.enqueue(v);
        reversePost.push(v);
    }

    public Iterable<Integer> pre() { return pre; }
    public Iterable<Integer> post() { return post; }
    public Iterable<Integer> reversePost() { return reversePost; }
}

public class Topological {
    //Reverse DFS postorder of a DAG is a topological order.
    private Iterable<Integer> order; // topological order

    public Topological(Digraph G) {
        DirectedCycle cycleFinder = DirectedCycle(G);
        if(!cycleFinder.hasCycle()) {
            DepthFirstOrder dfs = DepthFirstOrder(G);
            order = dfs.reversePost();
        }
    }

    public Iterable<Integer> order() { return order; }

    public boolean isDAG() { return order == null; }

    public static void main(String[] args) {
        String filename = args[0];
        String separator = args[1];
        SymbolDigraph sg = SymbolDigraph(filename, separator);

        Topological top = new Topological(sg.G());

        for (int v: top.order()) {
            StdOut.println(sg.name(v));
        }
    }
}