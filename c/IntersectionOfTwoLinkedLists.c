// https://leetcode.com/problems/intersection-of-two-linked-lists/

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

struct ListNode *getIntersectionNode(struct ListNode *headA, struct ListNode *headB) {
    int Anum = 0, Bnum = 0;
    
    struct ListNode *tmp = headA;
    while (tmp) {
        tmp = tmp->next;
        Anum++;
    }
    
    tmp = headB;
    while (tmp) {
        tmp = tmp->next;
        Bnum++;
    }
    
    struct ListNode *shortest = (Anum <= Bnum ? headA : headB);
    struct ListNode *longest = (Anum > Bnum ? headA : headB);
    
    int diff = Anum - Bnum;
    diff = diff < 0 ? -diff : diff;
    
    while (diff-- > 0)
        longest = longest->next;
    
    while (shortest != NULL) {
        if (shortest == longest)
            return shortest;
        shortest = shortest->next;
        longest = longest->next;
    }
    
    return NULL;
}