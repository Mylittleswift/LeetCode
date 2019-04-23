public class RabinKarp {

    private String pat; // pattern
    private long patHash; // pattern hash value
    private int M; // pattern length
    private long Q; // a large prime
    private int R = 256; // alphabet size
    private long RM; // R^(M-1)%Q

    public RabinKarp(String pat) {
        this.pat = pat; // save pattern
        this.M = pat.length();
        Q = longRandomPrime();
        RM = 1;

        // Compute R^(M-1)%Q for use
        // in removing leading digit.
        for (int i = 1; i <= M-1; i++)
            RM = (R * RM) % Q;
        patHash = hash(pat, M);
    }

    // Monte Carlo
    public boolean check(int i) { return true; }

    private long hash(String key, int M) { return 1; }

    private int search(String txt) {
        // Search for hash match in text.
        int N = txt.length();
        long txtHash = hash(txt, M);
        // Match at beginning.
        if (patHash == txtHash) return 0;
        for (int i = M; i < N; i++) {
            // Remove leading digit,
            // add trailing digit,
            // check for match.
            txtHash = (txtHash + Q - RM*txt.charAt(i-M)%Q)%Q;
            txtHash = (txtHash*R + txt.charAt(i))%Q;
            if (patHash == txtHash)
                if (check(i - M + 1)) return i - M + 1; //match
        }
        return N; // no match found
    }
}
