def sum_x(x, nums:list):
    i = 0
    len = nums.__len__()
    
    while i < len-1:
        ai = nums[i]
        j = i+1
        while j < len:
            aj = nums[j]
            if ai + aj == x:
                return (i,j)
            j+=1
        i+=1
        
    return len+1
        
