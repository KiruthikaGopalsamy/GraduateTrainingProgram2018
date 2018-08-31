#get first name and last name from user and print your full name 
"""
a=raw_input("enter your first name")
b=raw_input("enter your last name")
print("Full Name : %s%s"%(a,b)) 
"""

#print first name and last name and age 
"""
a=raw_input("enter your full name ")
b=raw_input("enter your age")
x,y=a.split(" ")

print("first name:%s\n""last name:%s\n" "age:%s\n"%(x,y,b))"""
"""print(int(x[0])+int(x[-1]))
z=int(z)
print(z)
"""

#Calculating your birth number in numerology
"""
a=raw_input("enter your DOB in dd/mm/yyyy format")
x,y,z=a.split("/")
print("%s%s%s" %(x,y,z))
c=x+y+z
c=int(c)
t=0
while(c>0):
 r=c%10
 t=t+r
 c=c/10
print("%s"%t)

if(t>9):
  s=0
  while(t>0):
   r=t%10
   s=s+r
   t=t/10
  print("%s"%s)
  
if(s>9):
  k=0
  while(s>0):
   r=s%10
   k=k+r
   s=s/10
  print("%s"%k)
"""
#Python program to perform sum of three given integers

d=raw_input("enter 3 digit number")
a=d[0]
b=d[1]
c=d[-1]
if(a!=b):
 if(b!=c):
  if(a!=c):
   z=a+b+c
   z=int(z)
   t=0
   while(z>0):
     r=z%10
     t=t+r
     z=z/10
   print("%s"%t)
  else:
   print("0")
 else:
  print("0")
else:
  print("0")

