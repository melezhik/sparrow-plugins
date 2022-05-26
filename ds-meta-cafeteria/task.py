from typing import List
from math import *
# Write any import statements here

def getMaxAdditionalDinersCount(N: int, K: int, M: int, S: List[int]) -> int:
  cnt = 0 # count dinners
  print(f"dinners: {S}, gap(K)={K}")
  S.sort()
  for i in range(M):
    dinner = S[i]
    print(f"i={i} dinner={dinner}")
    if i == (M - 1):
      print("we reach the last dinner")
    else:
      next_dinner = S[i+1]
      cnt += calc_cnt(dinner,next_dinner,K)    
  
  print("=============")
  if S[0] >= 3:
    print("====================")
    print("handle left boundary")
    cnt += calc_cnt_bnd(1,S[0],K)

  if S[M-1] <= (N - 3):
    print("====================")
    print("handle right boundary")
    cnt += calc_cnt_bnd(S[M-1],N,K)

  print(f"|dinners: {S}, gap(K)={K}, cnt: {cnt}|")
  return cnt

def calc_cnt_bnd (a,b,gap):
  spots = b - a
  print(f"[b] a={a} b={b} spots={spots}")
  if spots > 0:
    delta = floor((spots /(gap+1)))
    if delta > 0:
      print(f"[b] free {delta} spot found between {b} and {a}")
      return delta
    else:
      return 0

def calc_cnt (a,b,gap):
  spots = b - a
  print(f"next_dinner={b} spots={spots}")
  if spots > 0:
    delta = floor((spots /(gap+1))) - 1
    if delta > 0:
      print(f"free {delta} spot found between {b} and {a}")
      return delta
    else:
      return 0   

def getMaxAdditionalDinersCount2(N: int, K: int, M: int, S: List[int]) -> int:

  S.sort()
  count = 0
  # S = [2, 6] -> [-1, 2, 6] [2, 6, 12]
  for start, end in zip([-K]+S, S+[N+K+1]):
    delta = (end - start) // (K + 1) - 1
    print(f"start={start} | end={end} | delta={delta}")
    count += delta
  return count

a = getMaxAdditionalDinersCount(10,1,2,[2,6])
a = getMaxAdditionalDinersCount(15,2,3,[11,6,14])
