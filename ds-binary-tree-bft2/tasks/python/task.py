nodes_str = '''
         1
        / \\
       2   3
      / \\
     4   5
    /     \\
   6       7
'''

print(nodes_str)

nodes = { "data" : 1 }

nodes['left'] = { "data" : 2 }
nodes['right'] = { "data" : 3 }

nodes['left']['left'] = { "data" : 4 }
nodes['left']['right'] = { "data" : 5 }

nodes['left']['left']['left'] = { "data" : 6 }

nodes['left']['right']['right'] = { "data" : 7 }

print(nodes)

q = []
n = []

q.insert(0,nodes)

def traverse():
  l = len(q)
  while l > 0: 
    i = q.pop()
    print(i['data'])
    n.append(i['data'])
    if 'left' in i:
        q.insert(0,i['left'])
    if 'right' in i:
        q.insert(0,i['right'])
    l = len(q)
    #break       
  return


traverse()


print(n)