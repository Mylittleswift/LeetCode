public class MaxPQ<Key extends Comparable<Key>> {

    private Key[] pq; //heap-ordered complete binary tree
    private int N = 0; // in pq[1..N] with pq[0] unused

    public MaxPQ(int maxN) {
        pq = (Key[]) new Comparable[maxN+1];
    }

    public boolean isEmpty() {
        return N == 0;
    }

    public int size() { return N; }
    public void insert(Key v) {
        pq[++N] = v;
        swim(N);
    }

    public Key delMax() {
        Key max = pq[1]; // Retrieve max key from top.
        exch(1, N--); //Exchange with last item.
        pq[N+1] = null; // Avoid loitering
        sink(1); // restore heap property.
        return max;
    }

    // See Heap.java
    //private boolean less(int i, int j)
    //private void exch(int i, int j)
    //private void swim(int k)
    //private void sink(int k)
}
