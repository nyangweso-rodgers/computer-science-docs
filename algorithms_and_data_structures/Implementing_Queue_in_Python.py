# Implementing Queue Data Structure
'''
For Implementing a Queue in Python we will make use of List First 
'''
price = []
price.insert(0,100) # whenever we insert element at 0th position the older element is pushed forward 
price.insert(0,200)
price.insert(0,300)
print(price) # output will be [300,200,100]

'''
So what will happen when we use POP operation . 
As we know it will be FIFO - First in - First out . 
So the first element that was inserted will pop out first.
'''
price = []
price.insert(0,100)
price.insert(0,200)
price.insert(0,300)
print(price.pop()) # output will be 100

## Remark
'''
Though a List (Array) works fine for implementing a Queue but the problem will emerges due to Dynamic Array .
When you are inserting in a Dynamic Array , first it will allocate a random continues memory location and when its gets filled it will again allocate double the size of memory location and then it will copy all old elements to the new location. Hence they are not recommended
'''

# Using Deque
'''
A double-ended queue, or deque, has the feature of adding and removing elements from either end. 
The Deque module is a part of collections library. It has the methods for adding and removing elements which can be invoked directly with arguments. 

In the below program we import the collections module and declare a deque. Without need of any class we use the in-built implement methods directly.
'''
from collections import deque
queue = deque()

'''
Since in case of Queue we always add elements to the left side of the list so we will use the function appendleft()
'''
queue.appendleft(100)
queue.appendleft(200)
queue.appendleft(300)
#print(queue)

'''
Now when we do a queue.pop() the value it will return will be 100 , because it was the first value that was inserted into the queue
'''
print(queue.pop()) # output: 100

# Let's implement all these functions using a class QUEUE in Python
from collections import deque
class Queue():
    def __init__(self):
        self.queue = deque()
    def insert(self, value):
        self.value = value
        self.queue.appendleft(value)
        print(self.queue)
    def delete(self):
        self.queue.pop()
        print(self.queue)
    def length(self):
        if len(self.queue)==0:
            print("Empty")
        else:
            print(len(self.queue))
            
if __name__ =='__main__':
    q = Queue()
    q.insert(100)
    q.insert(200)
    q.delete()
    q.length()