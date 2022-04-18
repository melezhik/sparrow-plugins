nodes_str = '''
         1
       /  \\
      2    3
     / \\
    4   5
   /     \\
  6       7
'''

print(nodes_str)

tree = { 'data': 1 }

tree['left'] = { 'data' : 2 }
tree['right'] = { 'data' : 3 }
tree['left']['left'] = { 'data' : 4 }
tree['left']['left']['left'] = { 'data' : 6 }
tree['left']['right'] = { 'data' : 5 }
tree['left']['right']['right'] = { 'data' : 7 }


nodes = []

def tree_len(tree):
  if not tree['data']:
    return

  a = tree['left']['data']

  b = tree['right']['data']

  return a+1 if a > b else b+1
 
  tree_len(tree['left'])

  tree_len(tree['right'])


print(f"tree len: {tree_len(tree)}")

def traverse(tree, i):

  if not tree['data']:
    return

  if i == 1:
    nodes.append(f"{tree['data']}")
    print(f"pick up a node: {tree['data']}")
    return


  if i == 0:
    return # we need to increase handle (i)

  if 'left' in tree:
    traverse(tree['left'],i-1)

  if 'right' in tree:
    traverse(tree['right'],i-1)


for i in range(tree_len(tree)):
  traverse(tree,i+1)


print("[",(" ".join(nodes)),"]")
