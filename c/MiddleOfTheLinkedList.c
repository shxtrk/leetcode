// https://leetcode.com/problems/middle-of-the-linked-list/

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

struct ListNode* middleNode(struct ListNode* head){
    struct ListNode *mid = head, *last = head;
    
    while (last->next != NULL) {
        mid = mid->next;
        if (last->next->next == NULL)
            break;
        last = last->next->next;
    }
    
    return mid;
}