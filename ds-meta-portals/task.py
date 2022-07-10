# Python3 Program to print BFS traversal
# from a given source vertex. BFS(int s)
# traverses vertices reachable from s.
from collections import defaultdict
from typing import List

symbols = [] 

# This class represents a directed graph
# using adjacency list representation
class Graph:
 
    # Constructor
    def __init__(self):
 
        # default dictionary to store graph
        self.graph = defaultdict(list)
        self.symbols = []
        #print(f"default graph: {self.graph}")

    # function to add an edge to graph
    def addEdge(self,u,v):
        if v not in self.graph[u]:
            self.graph[u].append(v)
 
    # Function to print a BFS of graph
    def BFS(self, s):
        print(f"start from s: {s} ({symbols[s]})")
        # Mark all the vertices as not visited
        visited = [False] * len(self.graph)
        #print(f"graph: {self.graph}")
        #print(f"visited: {visited}")
        # Create a queue for BFS
        queue = []
 
        v = len(self.graph)

        print(f"v:{v}")
        pred=[0 for i in range(v)]
        dist=[0 for i in range(v)];

        for i in range(v):
            pred[i] = -1
            dist[i] = 0

        # Mark the source node as
        # visited and enqueue it
        queue.append(s)
        visited[s] = True
        while queue:
 
            # Dequeue a vertex from
            # queue and print it
            s = queue.pop(0)
            print(f"{symbols[s]}_{s}", end = " ")
            if symbols[s] == "E":
                print(f"exit found. hops: {dist[s]}")
                return dist[s]   
            # Get all adjacent vertices of the
            # dequeued vertex s. If a adjacent
            # has not been visited, then mark it
            # visited and enqueue it
            for i in self.graph[s]:
                #print(f"check i: {i}")
                if visited[i] == False:
                    queue.append(i)
                    visited[i] = True
                    dist[i] = dist[s] + 1;
            print("")    
        print(f"no exit found")
        return -1

def getSecondsRequired(R: int, C: int, G: List[List[str]]) -> int:
    # Write your code here
    g = Graph()
    global symbols
    symbols = [] 
    portals = {}
    j = - 1
    for r in range(R):
        for c in range(C):
            j = j + 1        
            n = G[r][c]
            symbols.append(n)
            if n != '.' and n != '#' and n !='S' and n != 'E':
                if n in portals:
                    portals[n].append(j)
                else:
                    portals[n] = []
                    portals[n].append(j)

    print("//////////////////",end="")

    i = -1 # graph  node number 
    s_i = None 

    for r in range(R):
        print(f"\n")    
        for c in range(C):
            i = i + 1        
            n = G[r][c]
            print(f"{n}",end=" ")
            n_right = None; n_right_i = None
            n_left = None; n_left_i = None 
            n_up = None; n_up_i = None
            n_down = None; n_down_i = None 

            if n == "#":
                g.addEdge(i,i)
                continue

            if n != '.' and n != '#' and n !='S' and n != 'E':
                if n in portals:
                    for k in portals[n]:
                        #print(f"teleport from {i}({symbols[i]}) to {k}({symbols[k]})")
                        g.addEdge(i,k)
                        g.addEdge(k,i)
                #continue
            if c > 0:
                n_left = G[r][c-1]; n_left_i = i - 1 
            if c < C - 1: 
                n_right = G[r][c+1]; n_right_i = i + 1 
            if r > 0:     
                n_up = G[r-1][c]; n_up_i = i - C 
            if r < R - 1:     
                n_down = G[r+1][c]; n_down_i = i + C 

            if n_right is not None and n_right != "#":
                g.addEdge(i, n_right_i)
                g.addEdge(n_right_i, i)
            if n_left is not None and n_left != "#":
                g.addEdge(i, n_left_i)
                g.addEdge(n_left_i, i)
            if n_up is not None and n_up != "#":
                g.addEdge(i, n_up_i)
                g.addEdge(n_up_i, i)
            if n_down is not None and n_down != "#":
                g.addEdge(i, n_down_i)
                g.addEdge(n_down_i, i)

            if n == "S":
                s_i = i 
                #print(f"start index set to {s_i}")

    print("\n//////////////////")
    h = g.BFS(s_i)
    return h

getSecondsRequired(3,3,[
    [ '.', 'E', '.'],
    ['.','#','E'],
    ['.','S','#']
])  


getSecondsRequired(3,4,[
    [ 'a','.','S','a' ],
    [ '#','#','#','#' ],
    [ 'E','b','.','b' ]
])

getSecondsRequired(3,4,[
     ['a','S','.','b'],
     ['#','#','#','#'],
     ['E','b','.','a']
 ])


getSecondsRequired(1,9,[
 ["x","S",".",".","x",".",".","E","x"]
]
)