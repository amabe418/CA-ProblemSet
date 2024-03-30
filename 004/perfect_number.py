# THIS
def is_prime(n):
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False
    return True

def perfect_number(n):
    m = 2
    count = 0
    while True:
        if is_prime(m) and is_prime((2**m)-1):
            numero_perfecto = (2**(m-1)) * ((2**m) - 1)
            count += 1
            if count == n:
                return numero_perfecto
        m += 1
        
# END


def verify(n):
    sum = 0
    i = 1   
    while i < n:
        if n%i == 0:
            sum+=i
        i+=1
    
    print(sum)
    return sum == n

# print(verify(28))

# print(perfect_number(5))


for i in range(1,8):
    result = perfect_number(i)
    print(result)


