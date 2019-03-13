public class LSD {
    public static void sort(String[] a, int W) { // fixed-length W stirngs
        // Sort a[] on leading W characters.
        int N = a.length;
        int R = 256; // radix R
        String[] aux = new String[N];


        // Do key-indexed counting for each digit
        // from right to left
        for (int d = W - 1; d >= 0; d--) {
            // Sort by key-indexed counting on dth char.
            int[] count = new int[R+1]; //Compute frequency counts.
            for (int i = 0; i < N; i++) {
                count[a[i].charAt(d) + 1]++;
            }

            for (int r = 0; r < R; r++) {
                count[r+1] += count[r]; // Transform counts to indices.
            }

            for (int i = 0; i < N; i++) {
                aux[count[a[i].charAt(d)]++] = a[i]; // Distribute.
            }

            for (int i = 0; i < N; i++) {
                a[i] = aux[i]; // Copy back.
            }
        }
    }
}
