// https://leetcode.com/problems/remove-linked-list-elements/

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

struct ListNode* removeElements(struct ListNode* head, int val){
    struct ListNode *prev = NULL, *curr = head;
    
    while (curr) {
        if (curr->val == val) {
            if (prev == NULL) {
                head = curr->next;
                free(curr);
                curr = head;
            } else {
                prev->next = curr->next;
                free(curr);
                curr = prev->next;
            }
        } else {
            curr = curr->next;
            if (prev == NULL)
                prev = head;
            else
                prev = prev->next;
        }
    }
    return head;
}