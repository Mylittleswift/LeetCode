public class MSD {

    private static int R = 256; // radix
    private static final int M = 15; // cutoff for small subarrays
    private static String[] aux; // auxiliary array for distribution

    private static int charAt(String s, int d) {
        if (d < s.length()) return s.charAt(d);
        else return -1; // Treat strings as if they had an extra char at end (smaller than any char)
    }

    public static void sort(String[] a) {
        int N = a.length;
        aux = new String[N];
        sort(a, 0, N-1, 0);
    }

    private static void sort(String[] a, int lo, int hi, int d) {
        // Sort from a[lo] to a[hi], starting at the dth character.

        if (hi <= lo + M) { Insertion.sort(a, lo, hi, d); return; }

        // Compute frequency counts.
        int[] count = new int[R+2];
        for (int i = lo; i <= hi; i++) {
            count[charAt(a[i], d) + 2]++;
        }

        // Transform counts to indices.
        for (int r = 0; r < R+1; r++) {
            count[r+1] += count[r];
        }

        // Distribute.
        for (int i = lo; i <= hi; i++) {
            aux[count[charAt(a[i], d) + 1]++] = a[i];
        }

        // Copy back.
        for (int = lo; i <= hi; i++) {
            a[i] = aux[i - lo];
        }

        //Recursively sort for each character value.
        for (int r = 0; r < R; r++) {
            sort(a, lo + count[r], lo + count[r+1] - 1, d+1);
        }
    }
}
