
def insertion_sort (list):
  i = 1
  print(f"input: {list}")
  while i <= len(list) - 1:
    print(f"i: {i}")
    c = list[i]
    print(f"list border: {list[i-1]} | candidate: {c}")
    j = i
    while c < list[j-1] and j > 0:
      list[j] = list[j-1]
      print(f"shift {list[j]}")
      j = j - 1
    print(f"set last j: {j} to {c}")  
    list[j] = c
    i = i + 1 


a = [12, 11, 13, 5, 6, 7]
insertion_sort(a)
print(a)

