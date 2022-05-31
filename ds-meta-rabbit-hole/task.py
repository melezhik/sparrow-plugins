from typing import List
from collections import deque
# Write any import statements here

# WARNING - the code was "shamelessly" taken from 
# https://leetcode.com/discuss/interview-question/1787518/meta-facebook-recruiting-portal-interview-prep-rabbit-hole 
# thanks to @jaredlwong - I could have not done  it better!

def getMaxVisitableWebpages(N: int, L: List[int]) -> int:

    L_orig = L 
    L = [x-1 for x in L]

    indegrees = [0]*N
    for l in L:
        indegrees[l] += 1

    levels = [0]*N
    visited = [False]*N
    queue = deque([i for i, c in enumerate(indegrees) if c == 0])
    print(queue)
    
    while len(queue) > 0:
        i = queue.popleft()
        print(f"queue, popleft: {i}")
        visited[i] = True
        j = L[i]
        print(f"L[{i}]={L[i]}")
        levels[j] = max(levels[j], levels[i]+1)
        indegrees[j] -= 1
        if indegrees[j] == 0:
            queue.append(j)
    #print(f"levels: {level}")
    roots = {}
    cycle_size = {}
    def count_cycle(start):
        if start in roots:
            return cycle_size[roots[start]]
        count = 0
        i = start
        while True:
            count += 1
            roots[i] = start
            i = L[i]
            if start == i:
                break
        cycle_size[start] = count
        return count

    max_chain = 0
    for i in range(N):
      if not visited[i]:
        max_chain = max(max_chain, levels[i] + count_cycle(i))

    print(f"|{L_orig} max={max_chain}|")

    return max_chain

getMaxVisitableWebpages(4,[4, 1, 2, 1])

getMaxVisitableWebpages(5,[4, 3, 5, 1, 2])

getMaxVisitableWebpages(5,[2, 4, 2, 2, 3])

