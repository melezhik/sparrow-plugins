def sort_selection (list):
  print(f"input: {list}")
  j = len(list)
  while j:
    max = list[0]
    max_index = 0
    print(f"set max to {max}")
    for i in range(j):
      #print(list[i])
      if list[i] > max:
        max = list[i]
        max_index = i
    old = list[j-1]
    list[j-1] = max
    list[max_index] = old
    print(f"swap {old} at [{j-1}] <=> {max} at [{max_index}]")     
    j=j-1

  return list
b = sort_selection([12, 11, 13, 5, 6, 7])

print("result:",b)