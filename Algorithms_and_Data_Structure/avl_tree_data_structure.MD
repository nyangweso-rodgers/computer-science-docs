# Algorithm and Data Structure
## AVL Tree

### Overview of Binary Tree
* binary tree is a collection that stores data in a tree structure
* each node in the tree contains:
1. value
2. left and right pointer

* navigation rules:
1. smaller value on left
2. equal or larger value on right

* standard tree operation
1. Insertion
2. Deletion
3. Search
4. Clear
5. Enumeration

### AVL Tree Overview
* Self-balancing binary tree invented by Adelson-Velsky & Landis (1962)
* AVL Tree are similar to Binary Tree:
1. follow all binary tree structural constraints
2. search and enumeration are identical to Binary Tree
3. Insertion and Deletion differ in only running the Balance algorithm

* New tree concepts:
1. Self-Balancing
2. Height
3. Balance Factor
4. Right/Left Heavy

#### Unbalanced Binary Tree
* can become a singly linked list in worst case:
1. O(n) search performance

## Balanced Binary Tree
* The tree remains balanced as nodes are inserted or deleted.
>>  O(log n) search performance
* Height or left and right tree differ by at most 1

### Balancing (Rotation) Algorithms
1. Rigt Rotation
2. Left Rotation
3. Right - Left Rotation
4. Left -Right Rotation


