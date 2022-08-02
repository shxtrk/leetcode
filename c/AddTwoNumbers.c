// https://leetcode.com/problems/add-two-numbers/

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2){
    struct ListNode *head = (struct ListNode *)malloc(sizeof(struct ListNode));
    struct ListNode *tail = head;
    
    int carry = 0;
    while(l1 != NULL || l2 != NULL) {
        struct ListNode *new = (struct ListNode *)malloc(sizeof(struct ListNode));
        int v1 = (l1 != NULL) ? l1->val : 0;
        int v2 = (l2 != NULL) ? l2->val : 0;
        new->val = (v1 + v2 + carry) % 10;
        carry = (v1 + v2 + carry) / 10;
        tail = tail->next = new;
        if (l1) l1 = l1->next;
        if (l2) l2 = l2->next;
    }
    
    if (carry) {
        tail->next = (struct ListNode *)malloc(sizeof(struct ListNode));
        tail->next->next = NULL;
        tail->next->val = carry;
    } else {
        tail->next = NULL;
    }
    
    return head->next;
}