def find_max_idx(array):
    n = 0
    loop = array[n]
    second = array[n+1]
    while loop < second:
        n += 1
    return loop
return find_max_idx([1,2,3,4,5,4,3,2,1])
