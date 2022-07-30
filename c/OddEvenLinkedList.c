// https://leetcode.com/problems/odd-even-linked-list/

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

struct ListNode* oddEvenList(struct ListNode* head){
    if (head == NULL || head->next == NULL)
        return head;
    
    struct ListNode *odd = head, *even = head->next, *f_even = head->next;
    
    while (even && even->next) {
        odd = odd->next = even->next;
        even = even->next = odd->next;
    }
    
    odd->next = f_even;
    return head;
}