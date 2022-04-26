
def insertion_sort (list):
  i = 0
  print(f"input: {list}")
  while i <= len(list) - 2:
    c = list[i+1]
    print(f"list border: {list[i]} | candidate: {c}")
    j = i
    while c < list[j] and j >= 0:
      list[j+1] = list[j]
      print(f"shift {list[j]}")
      j = j - 1
    print(f"set last j: {j+1} to {c}")  
    list[j+1] = c
    i = i + 1 


a = [12, 11, 13, 5, 6, 7]
insertion_sort(a)
print(a)

