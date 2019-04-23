public class LazyPrimMST {
    private boolean[] marked; // MST vertices
    private Queue<Edge> mst; //MST edges;
    private MinPQ<Edge> pq; //crossing (and ineligible) edges

    public LazyPrimMST(EdgeWeightedGraph G) {
        pq = new MinPQ<Edge>();
        marked = new boolean[G.V()];
        mst = new Queue<Edge>();

        visit(G, 0); // assume G is connected
        while (!pq.isEmpty()) {
            Edge e = pq.delMin(); // get lowest-weight
            int v = e.either(), w = e.other(v); // edge from pq.
            if (marked[v] && marked[w]) continue; //Skip if ineligible.
            mst.enqueue(e);
            if (!marked[v]) visit(G, v); // add edge to tree.
            if (!marked[w]) visit(G, w); // (either v or w).
        }
    }

    private void visit(EdgeWeightedGraph G, int v) {
        //Mark v and add to pq all edges from v to unmarked vertices.
        marked[v] = true;
        for (Edge e: G.adj(v)) {
            if (!marked[e.other(v)]) pq.insert(e);
        }
    }

    public Iterable<Edge> edges() { return mst; }
}

public class PrimMST {
    private Edge[] edgeTo; //shortest edge from tree vertex
    private double[] distTo; //distTo[w] = edgeTo[w].weight()
    private boolean[] marked; //true if v on tree
    private IndexMinPQ<Double> pq; //eligible crossing edges

    public PrimMST(EdgeWeightedGraph G) {
        edgeTo = new Edge[G.V()];
        distTo = new double[G.V()];
        marked = new boolean[G.V()];
        for (int v = 0; v < G.V(); v++) {
            distTo[v] = Double.POSITIVE_INFINITY;
        }
        pq = new IndexMinPQ<Double>(G.V());

        distTo[0] = 0.0;
        pq.insert(0, 0.0); //initialize pq with 0, weight 0
        while(!pq.isEmpty()) {
            visit(G, pq.delMin()); //add closest vertex to tree.
        }

        private void visit(EdgeWeightedGraph G, int v) {
            //add v to tree; update data structures.
            marked[v] = true;
            for (Edge e: G.adj(v)) {
                int w = e.other(v);
                if (marked[w]) continue; // v-w is ineligible.
                if (e.weight() < distTo[w]) {
                    //Edge e is new best connection from tree to w.
                    edgeTo[w] = e;
                    distTo[w] = e.weight();
                    if (pq.contains(w)) pq.change(w, distTo[w]);
                    else pq.insert(w, distTo[w]);
                }
            }
        }
    }
}