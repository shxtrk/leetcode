// https://leetcode.com/problems/remove-nth-node-from-end-of-list/

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

struct ListNode* removeNthFromEnd(struct ListNode* head, int n){
    if (head->next == NULL && n==1)
        return NULL;
    
    int count = 0;
    struct ListNode *slow = head, *fast;
    while (slow) {
        slow = slow->next;
        count++;
    }
    
    n = count - n;
    struct ListNode* tmp;
    
    if (n == 0) {
        tmp = head->next;
        free(head);
        return tmp;
    }
    
    slow = head, fast = head->next;
    
    for (int i = 1; i < n; i++) {
        slow = slow->next;
        fast = fast->next;
    }
    
    tmp = fast->next;
    free(fast);
    slow->next = tmp;
    return head;
}