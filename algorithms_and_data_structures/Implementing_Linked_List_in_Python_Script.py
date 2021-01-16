class Node:
    #Class for creating a Node which contains the data and the next address 
    #If this is the first node hence the next value will be none
    def __init__(self,data=None,next=None):
        self.data = data
        self.next = next
        
class LinkedList:
    #Creating a class for LinkedList which contains various functions 
    def __init__(self):
        #head of the Linked List
        self.head = None

    def insert_at_start(self,data):
        #Function for inserting at the starting 
        new_node = Node(data,self.head) #creating a new node 
        self.head = new_node #now head will point to newly created node
    def insert_at_end(self,data):
        if self.head is None: #which means there is nothing in the Linked List
            new_node = Node(data,self.head) #creating a new node 
            self.head = new_node #now head will point to newly created node
            return
        temp = self.head
        while temp.next:
            temp = temp.next
        temp.next = Node(data,None)

    def find_length(self):
        temp = self.head
        count = 0
        while temp:
            count += 1
            temp = temp.next
        #print(count)
        return count

    def delete_at_index(self,index):
        if index < 0 or index >= self.find_length():
            raise Exception("Invalid Index")
        if index == 0 :
            self.head = self.head.next
            return
        count = 0 
        temp = self.head
        while temp:
            if count == index - 1:
                temp.next = temp.next.next
                break
            temp = temp.next
            count += 1          

    def print(self): #funtion for prinitng the nodes and the datas
        element = ''
        if self.head is None:
            element += 'Null'
        temp = self.head
        while temp: #looping through the head to check the next element 
            element += str(temp.data)+ '--->'
            temp = temp.next
        print(element)
if __name__ == '__main__':
    ll = LinkedList()  
    ll.insert_at_start(2)
    ll.insert_at_start(3)
    ll.insert_at_start(4)
    ll.insert_at_end(5)
    ll.insert_at_end(9)
    ll.find_length()
    #ll.delete_at_index(9)
    ll.delete_at_index(2)
    ll.print()