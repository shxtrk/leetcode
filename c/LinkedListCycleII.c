// https://leetcode.com/problems/linked-list-cycle-ii/

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode *detectCycle(struct ListNode *head) {
    if (head == NULL || head->next == NULL)
        return NULL;
    
    struct ListNode *slow = head, *fast = head->next;
    struct ListNode *checker = NULL;
    
    while (fast->next != NULL && fast->next->next != NULL) {
        if (fast == slow) {
            if (checker == NULL)
                checker = head;
            else
                checker = checker->next;
        }
        if (checker == slow)
            return checker;
        slow = slow->next;
        fast = fast->next->next;
    }
    return NULL;
}