// https://leetcode.com/problems/richest-customer-wealth/

int maximumWealth(int** accounts, int accountsSize, int* accountsColSize){
    int richest = 0;
    for (int a = 0; a < accountsSize; ++a) {
        int sum = 0;
        for (int b = 0; b < accountsColSize[a]; ++b) {
            sum += accounts[a][b];
        }
        if (sum > richest) {
            richest = sum;
        }
    }
    return richest;
}