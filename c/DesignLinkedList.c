// https://leetcode.com/problems/design-linked-list/

typedef struct List{
    int val;
    struct List * next;
} MyLinkedList;

MyLinkedList* myLinkedListCreate() {
    MyLinkedList *list = malloc(sizeof(MyLinkedList));
    list->val = -1;
    list->next = NULL;
    return list;
}

int myLinkedListGet(MyLinkedList* obj, int index) {
    MyLinkedList* tmp = obj;
    int i = 0;
    while (i++ <= index && tmp) {
        tmp = tmp->next;
    }
    return tmp ? tmp->val : -1;
}

void myLinkedListAddAtHead(MyLinkedList* obj, int val) {
    MyLinkedList *list = malloc(sizeof(MyLinkedList));
    list->val = val;
    list->next = obj->next;
    obj->next = list;
}

void myLinkedListAddAtTail(MyLinkedList* obj, int val) {
    MyLinkedList *tail = obj;
    while (tail->next != NULL)
        tail = tail->next;
    MyLinkedList *list = malloc(sizeof(MyLinkedList));
    list->val = val;
    list->next = NULL;
    tail->next = list;
}

void myLinkedListAddAtIndex(MyLinkedList* obj, int index, int val) {
    MyLinkedList* tmp = obj;
    int i = 0;
    while (i++ < index && tmp)
        tmp = tmp->next;
        
    if (tmp) {
        MyLinkedList *list = malloc(sizeof(MyLinkedList));
        list->val = val;
        list->next = tmp->next;
        tmp->next = list;
    }
}

void myLinkedListDeleteAtIndex(MyLinkedList* obj, int index) {
    MyLinkedList *tmp = obj, *loc;;
    int i = 0;
    while(i++ < index && tmp)
        tmp = tmp->next;
    
    if (tmp)  
        if(tmp->next && tmp->next->next != NULL) {
            loc =tmp->next;
            tmp->next = tmp->next->next;
            free(loc);
        } else if(tmp->next && tmp->next->next == NULL) {
            loc = tmp->next;
            free(loc);
            tmp->next = NULL;
        }
}

void myLinkedListFree(MyLinkedList* obj) {
    MyLinkedList* tmp = obj;
    
    while (tmp->next) {
        MyLinkedList* loc = tmp->next;
        tmp->next = tmp->next->next;
        free(loc);
    }
}

