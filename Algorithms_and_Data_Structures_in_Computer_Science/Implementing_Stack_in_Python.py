# Implementing Stacks
s = []
s.append(1)
s.append(2)
s.append(3)
print(s) # Output [1,2,3]
print(s.pop()) # Output 3
print(s.pop()) # Output 2
print(s.pop()) # Output 1

# Implementing Stacks Using Deque
'''
A double-ended queue, or deque, has the feature of adding and removing elements from either end. 
The Deque module is a part of collections library. It has the methods for adding and removing elements which can be invoked directly with arguments. 

In the below program we import the collections module and declare a deque. 
Without need of any class we use the in-built implement methods directly.
'''
from collections import deque
stack = deque()
# Now let's append the elements in the Stack
stack.append(1)
stack.append(2)
stack.append(3)
print(stack) # Output: [1,2,3]

## Let's implement all these functions using a class STACK in Python
from collections import deque
class Stack:
    def __init__(self):
        self.bucket = deque()
    def push(self, value):
        self.value = value
        self.bucket.append(value)
    def pop(self, value):
        #print(self.bucket.pop())
        return self.bucket.pop()
    def last_inserted_value(self):
        print(self.bucket[-1])
        return self.bucket[-1]
    def is_empty(self):
        if len(self.bucket)==0:
            print("True")
            return True 
        else :
            print(len(self.bucket))
            return len(self.bucket)
        
if __name__ == '__main__':
    S = Stack()
    S.push(12)
    S.push(11)
    S.push(13)
    #S.pop()
    S.last_inserted_value()
    S.is_empty()