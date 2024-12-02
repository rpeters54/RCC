
typedef long size_t;
void * memset ( void * ptr, int value, size_t num );
int printf(char *s, ...);

int main() {
    int row, col, m_row, mT_col;
    long result[4][4];

    long m[4][3] = {
        { 1,  2,  3 },
        { 4,  5,  6 },
        { 7,  8,  9 },
        { 10, 11, 12 },
    };

    long mT[3][4] = {
        { 1, 4, 7, 10 },
        { 2, 5, 8, 11 },
        { 3, 6, 9, 12 },
    };

    memset(result, 0, sizeof(long) * 4 * 4);
    for (m_row = 0; m_row < 4; m_row+=1) {
        for (mT_col = 0; mT_col < 4; mT_col+=1) {
            for (col = 0; col < 3; col+=1) {
                result[m_row][mT_col] += m[m_row][col] * mT[col][mT_col];
            }
        }
    }

    for (row = 0; row < 4; row+=1) {
        for (col = 0; col < 4; col+=1) {
            printf("Value at (row: %d, col: %d) = %d\n", row, col, result[row][col]);
        }
    }

    return 0;
}