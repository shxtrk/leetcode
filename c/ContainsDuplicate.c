// https://leetcode.com/problems/contains-duplicate/

struct Node {
    int val;
    struct Node *next;
};

struct HashSet {
    int base;
    struct Node **hashTable;
};

struct HashSet* createHashSet(int base) {
    struct HashSet *set = (struct HashSet *)malloc(sizeof(struct HashSet));
    set->base = base;
    set->hashTable = (struct Node **)malloc(sizeof(struct Node *) * base);
    for (int i = 0; i < base; i ++)
        set->hashTable[i] = NULL;
    return set;
}

bool addValue(struct HashSet* set, int val) {
    int hash = abs(val % set->base);
    bool exist = false;
    if (set->hashTable[hash] != NULL) {
        struct Node *node = set->hashTable[hash];
        while (node)
            if (node->val == val) {
                exist = true;
                break;
            } else
                node = node->next;
    }
    if (exist)
        return false;
    struct Node *node = (struct Node *)malloc(sizeof(struct Node));
    node->val = val;
    node->next = set->hashTable[hash];
    set->hashTable[hash] = node;
    return true;
}

void freeHash(struct HashSet* set) {
	int i;
	struct Node *node, *t;
	for (i = 0; i < set->base; i++) {
		node = set->hashTable[i];
		while (node) {
			t = node->next;
			free(node);
			node = t;
		}
	}
	free(set);
}

bool containsDuplicate(int* nums, int numsSize){
    struct HashSet *set = createHashSet(997);
    for (int i = 0; i < numsSize; i++)
        if (!addValue(set, nums[i])) {
            freeHash(set);
            return true;
        }
    freeHash(set);
    return false;
}