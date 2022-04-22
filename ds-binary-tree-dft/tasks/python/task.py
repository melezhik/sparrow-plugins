nodes_str = '''
        A
       /  \\
      /    \\
     B      C
    / \\    /
   D   E  F
  /
 G
'''

print(nodes_str)


nodes = { "data" : "A" }

nodes['left'] = { "data" : "B" }

nodes['right'] = { "data" : "C" }

nodes['left']['left'] = { "data" : "D" }

nodes['right']['left'] = { "data" : "F" }

nodes['left']['right'] = { "data" : "E" }

nodes['left']['left']['left'] = { "data" : "G" }


print(nodes)

def traverse_in_order (node):
  if node:
    if 'left' in node:            
      traverse_in_order(node['left'])
    d = node['data']
    print(f'pick {d}')
    if 'right' in node:            
      traverse_in_order(node['right'])
  else:
    return

def traverse_pre_order (node):
   if node:
     d = node['data']
     print(f'pick {d}')
     if 'left' in node:
       traverse_pre_order(node['left'])
     if 'right' in node:
       traverse_pre_order(node['right'])



print("in order1")
traverse_in_order(nodes)
print("===")

print("pre order1")
traverse_pre_order(nodes)
print("===")

nodes_str = '''
                A
              /   \\
             /     \\
            B       C
           / \\      /
          /   \\    /
        D      E  F
'''

print(nodes_str)

nodes = { "data" : "A" }
nodes['left'] = { "data" :  "B" }
nodes['right'] = { "data" : "C"}
nodes['left']['left'] = { "data" : "D"} 
nodes['left']['right'] = { "data" : "E"}
nodes['right']['left'] = { "data" : "F"}

print("pre order2")
traverse_pre_order(nodes)
print("===")

print("in order2")
traverse_in_order(nodes)
print("===")
