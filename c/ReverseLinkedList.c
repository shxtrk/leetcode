// https://leetcode.com/problems/reverse-linked-list/

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

struct ListNode* reverseList(struct ListNode* head){
    if (head == NULL || head->next == NULL)
        return head;
    
    struct ListNode *left = head, *right = head->next;
    
    do {
        left->next = right->next;
        right->next = head;
        head = right;
        right = left->next;
    } while (right);
    
    return head;
}