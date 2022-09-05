// https://leetcode.com/problems/reverse-string/

void reverseString(char* s, int sSize){
    if (sSize < 1)
        return;
    char tmp = s[0];
    s[0] = s[sSize - 1];
    s[sSize - 1] = tmp;
    reverseString(s + 1, sSize - 2);
}