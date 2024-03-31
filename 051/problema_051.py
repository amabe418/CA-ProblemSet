def intersect(A,B):
    for i in range (len(A)):
        for j in range (len(B)):
            if(A[i]==B[j]):
                print(A[i])
                
intersect([2,3,4], [2,4])