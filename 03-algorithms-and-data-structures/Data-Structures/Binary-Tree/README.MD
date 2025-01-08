# Binary Tree

## Table Of Contents


# Overview Of Binary Tree
* A __binary tree__ is a hierarchy of data with some structure rules. It starts out with a __Root Node__ (_this is a node with no parent_), we can then create a 0, 1,2 e.t.c., children. Therefore, the __binary tree__ has at most two child nodes, thus the name __binary__ and those children are known as the __left__ and __right__ children.

* The tree which is a child of a node is called a __subtree__.

* Elements with no chilren are called __leaves__

* A __binary search tree__ doesn't change the structural rules of the binary tree, but they impose additional data rule i.e., all the values in the tree are stored in __Sort Order__.The smallest values are on the left, and the largest values are on the right.

* Adding item into the tree is performed by _recursive algorithm_

* Standard tree __operations__ include:
    1. Insertion
    2. Deletion
    3. Search
    4. Clear
    5. Enumeration

* __Unbalanced Binary Tree__: can become a singly linked list in worst case, i.e., O(n) search performance

* __Balanced Binary Tree__: The tree remains balanced as nodes are inserted or deleted. i.e., O(log n) search performance, Height or left and right tree differ by at most 1

# Types of Binary Trees
1. __Full Binary Tree__ a binary tree is considered __full__ if every node has 0 or 2 children
2. __Complete Binary Tree__: all levels are completely filled except possibly the last level and the last level has all nodes as far left as possible
3. __Perfect Binary Tree__: if all internal nodes have two childres abd all leaves are at the same level.

# AVL Tree
* __AVL Tree__ is a Self-balancing binary tree invented by Adelson-Velsky & Landis (1962). 

* __AVL Tree__ are similar to __Binary Tree__:
    * follow all binary tree structural constraints
    * search and enumeration are identical to Binary Tree
    * Insertion and Deletion differ in only running the Balance algorithm
    
* New tree concepts include:
    * Self-Balancing
    * Height
    * Balance Factor
    * Right/Left Heavy

# Advantages of Binary Tree
- trees reflect structural relationships in the data and are used to represent hierarchies
- trees provide efficient inseration and searching
- trees are flexible, allowing subtrees to be moved around with minimum effort