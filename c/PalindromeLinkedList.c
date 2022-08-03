// https://leetcode.com/problems/palindrome-linked-list/

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

bool isPalindrome(struct ListNode* head) {
    if (head->next == NULL) return head;
    
    struct ListNode *slow = head, *fast = head->next;
    while (fast->next != NULL && fast->next->next != NULL) {
        slow = slow->next;
        fast = fast->next->next;
    }
    
    fast = slow->next;
    while (fast->next) {
        struct ListNode *next = fast->next;
        fast->next = next->next;
        next->next = slow->next;
        slow->next = next;
    }
    
    fast = slow->next;
    slow = head;
    
    struct ListNode *halfHead = fast;
    
    while (fast && halfHead != slow)  {
        if (fast->val != slow->val)
            return false;
        slow = slow->next;
        fast = fast->next;
    };
    
    return true;
}