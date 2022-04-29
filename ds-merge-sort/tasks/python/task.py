def merge_sort (list):
  print(f"input: {list}")
  arr_s = len(list)
  print(f"arr size: {arr_s}")
  if arr_s == 1:
    print(f"we reached a bottom: {list[0]}") 
    return [list[0]]
  if arr_s % 2 == 0:
    middle = (arr_s//2 - 1)
  else:
    middle = (arr_s//2)
  pass

  print(f"middle: {middle}")

  # handling edge cases
  # because array slicing
  # in Python
  # does not do that
  if arr_s == 2:
    a = merge_sort([list[0]])
    b = merge_sort([list[1]])
  elif arr_s == 3:
    a = merge_sort(list[0:2])
    b = merge_sort([list[2]])
  else:
    a = merge_sort(list[0:middle+1])
    b = merge_sort(list[middle+1:])

  r = []
  print(f"merge a={a} with b={b}")
  while len(a) and len(b):
     if a[0] < b[0]:
       k =  a.pop(0)
       print(f"push to r from a: {k}")
       r.append(k)
     else:
       k = b.pop(0)
       print(f"push to r from b: {k}")
       r.append(k)

  if len(a):
    r.extend(a)
  elif len(b):  
    r.extend(b)

  print(f"merged array: {r}")
  return r

print(f"merge_sort1: {merge_sort([12, 11, 13, 5, 6, 7])}")
print(f"merge_sort2: {merge_sort([2, 1, 7, 5, 56, 7, 6])}")