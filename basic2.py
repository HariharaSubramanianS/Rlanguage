a = 58
b = 60
print (a>50 and b>50)

a = True
b = False
print(a or b)

a = True
b = False
print(not a)
print(not b)

a = int(input("Number 1: "))
b = int(input("Number 2: "))
c = int(input("Number 3: "))
d = int(input("Number 4: "))
e = int(input("Number 5: "))

if (a > b and a > c and a > d and a > e):
    print("A is the greatest:", a)
elif (b > a and b > c and b > d and b > e):
    print("B is the greatest:", b)
elif (c > a and c > b and c > d and c > e):
    print("C is the greatest:", c)
elif (d > a and d > b and d > c and d > e):
    print("D is the greatest:", d)
else:
    print("E is the greatest:", e)

if (a < b and a < c and a < d and a < e):
    print("A is the smallest:", a)
elif (b < a and b < c and b < d and b < e):
    print("B is the smallest:", b)
elif (c < a and c < b and c < d and c < e):
    print("C is the smallest:", c)
elif (d < a and d < b and d < c and d < e):
    print("D is the smallest:", d)
else:
    print("E is the smallest:", e)    
