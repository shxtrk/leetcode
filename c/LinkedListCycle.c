// https://leetcode.com/problems/linked-list-cycle/

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

bool hasCycle(struct ListNode *head) {
    if (head == NULL)
        return false;
    struct ListNode *curr = head, *next = head->next;
    while (next && curr) {
        if (next->next == NULL)
            return false;
        if (curr == next)
            return true;
        curr = curr->next;
        next = next->next->next;
    }
    return false;
}