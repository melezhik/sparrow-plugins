list = [12, 11, 13, 5, 6, 7]


def buble_sort (list):

  print(f"input: {list}")

  for i in range(len(list)):
    print(f"start: {list[0]}")
    swap_done = False
    tail = len(list)-1-i
    print(f"tail: {list[tail]} at {tail}")
    for j in  range(0,tail):
      print(f"\tcheck {list[j]} <> {list[j+1]}")
      if list[j] > list[j+1]:
        print(f"swap: {list[j]} > {list[j+1]}")
        a = list[j]
        b = list[j+1]
        list[j+1] = a
        list[j] = b
        swap_done = True
buble_sort(list)
print(f"{list}")
