from typing import List
# Write any import statements here

def getSecondsRequired(N: int, F: int, P: List[int]) -> int:
  # Write your code here
  cnt = 0
  print(f"frogs:{P} | N:{N} | F:{F} ")

  P.sort()
  max_frog_ind = P[-1]
  holes_sum = 0

  if len(P) > 1:
    for i in range(F-1):
      holes = P[i+1] - P[i] - 1
      if holes > 0:
        print(f"holes found: {holes} at: {P[i]}")
        holes_sum += holes

  print(f"|frogs:{P} | max_frog_index:{max_frog_ind} | holes_sum: {holes_sum} | N:{N} | F:{F} | cnt:{cnt}|")

  cnt = calc_cnt(holes_sum,N,max_frog_ind,F)

  return cnt


def calc_cnt( holes_sum: int, N: int, max_frog_index: int, F: int):
  return holes_sum + N - max_frog_index - 1 + F


print(getSecondsRequired(3,1,[1]))
print(getSecondsRequired(6,3,[5,2,4]))
