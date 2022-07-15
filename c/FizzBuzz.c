// https://leetcode.com/problems/fizz-buzz/

char ** fizzBuzz(int n, int* returnSize){
    char **result = (char **)malloc(n * sizeof(char*));
    char s[9];
    for (int i = 1; i <= n; ++i) {
        if(i % 15 == 0) sprintf(s, "%s", "FizzBuzz");
        else if(i % 3 == 0) sprintf(s, "%s", "Fizz");
        else if(i % 5 == 0) sprintf(s, "%s", "Buzz");
        else sprintf(s, "%d", i);
        result[i - 1] = malloc(sizeof(s));
        memcpy(result[i - 1], s, strlen(s) + 1);
        memset(s, "", 9);
    }
    *returnSize = n;
    return result;
}