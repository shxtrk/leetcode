// https://leetcode.com/problems/min-stack/

typedef struct _node Node;
struct _node {
    int val;
    Node *next;
    Node *nextMin;
};

typedef struct {
    Node *stack;
    Node *min;
} MinStack;

MinStack* minStackCreate() {
    MinStack *stack = (MinStack *)malloc(sizeof(MinStack));
    stack->stack = NULL;
    stack->min = NULL;
    return stack;
}

void minStackPush(MinStack* obj, int val) {
    Node *new = (Node *)malloc(sizeof(Node));
    new->val = val;
    new->nextMin = NULL;
    if (obj->min == NULL || (obj->min != NULL && val <= obj->min->val)) {
        new->nextMin = obj->min;
        obj->min = new;
    }
    new->next = obj->stack;
    obj->stack = new;
}

void minStackPop(MinStack* obj) {
    if (obj->stack == NULL)
        return;
    Node *last = obj->stack;
    obj->stack = last->next;
    if (obj->min == last) {
        obj->min = last->nextMin;
    }
    free(last);
}

int minStackTop(MinStack* obj) {
    return obj->stack != NULL ? obj->stack->val : 0;
}

int minStackGetMin(MinStack* obj) {
    return obj->min != NULL ? obj->min->val : 0;
}

void minStackFree(MinStack* obj) {
    Node *n = obj->stack;
    while (n) {
        obj->stack = obj->stack->next;
        free(n);
        n = obj->stack;
    }
    free(obj);
}