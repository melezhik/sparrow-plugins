class Node:
  def __init__ (self, data):
    self.data = data 
    self.next = None

class LinkedList:

    def __init__ (self):
      self.head = None 

    def push (self,data):
      print(f"add {data} to LinkedList")
      node = Node(data)
      node.next = self.head
      self.head = node 

    def print_me (self):
      a = self.head
      while a is not None:
        print(f"{a.data}")
        a = a.next

    def to_array (self):
      l = []
      a = self.head
      while a is not None:
        l.append(a.data)
        a = a.next
      return l 

ll_s = LinkedList()

def sorted_insert(a):
  n = Node(a)
  print(f"insert {a} into sorted list")
  if ll_s.head is None:
    print(f"attach {a} to empty head")
    n.next = ll_s.head 
    ll_s.head = n
  elif ll_s.head.data > a:
    print(f"attach {a} to none empty head: {ll_s.head.data}")
    n.next = ll_s.head 
    ll_s.head = n
  else:
    c = ll_s.head 
    while c.next and c.next.data <= a:
      print(f"{a} is bigger then canidate {c.data}, skip and shift right")
      c = c.next 

    print(f"insert {a} after {c.data}")

    n.next = c.next      
    c.next = n 
    

ll = LinkedList()

#ll.print_me()

ll.push(5)
ll.push(20)
ll.push(4)
ll.push(3)
ll.push(30)

#ll.print_me()

a = ll.head
while a is not None:
  sorted_insert(a.data)
  a = a.next
  #print(a)

print(f"{ll_s.to_array()}")