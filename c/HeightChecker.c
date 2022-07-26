// https://leetcode.com/problems/height-checker/


int heightChecker(int* heights, int heightsSize) {
    int expected[heightsSize];
    int x, c = 0;
    bool f =  false;
    
    for (int i=  0; i < heightsSize; i++)
        expected[i] = heights[i];
        
    for (int i = 0; i < heightsSize - 1; i++) 
        for (int k = 0; k < heightsSize - 1; k++)
            if (expected[k] >= expected[k + 1]) {
                x = expected[k];
                expected[k] = expected[k + 1];
                expected[k + 1] = x;
                f = true;
            }
    
    if (f == false)
        return 0;
    
    for (int i = 0; i < heightsSize; i++)
        if (expected[i] != heights[i])
            c++;
    
    return c;
}