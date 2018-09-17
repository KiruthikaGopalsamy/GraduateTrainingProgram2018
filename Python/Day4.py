name=raw_input("enter name")
new=""
c_name=name.split(' ')
for i in range(len(c_name)):
 new=new+c_name[i].capitalize()+" "
print new
"""
"""
import string
name=raw_input("enter name")
print string.capwords(name)
"""
"""
def sum_stu():
   sum_s={}
   for k,v in student_details.iteritems():
       sum_s[k]=sum(v)
   print("total mark%s"%sum_s)
def avg(new):
   avg_s={}
   k1=new
   for k,v in student_details.iteritems():
       if(k==k1):
         print(float(sum(v)/len(v)))
         #print("average mark%s"%avg_s[k])
student_details={}	
std_count=raw_input("enter no student")			
for i in range(int(std_count)):
   name=raw_input("enter student name")
   sub_count=raw_input("enter no of subject")
   student_marklist=[]
   for j in range(int(sub_count)):
      j=j+1
      v=input("enter marks of subject"+str(j)+":")		
      student_marklist.append(v)
   student_details[name]=student_marklist
	
print(student_details)
sum_stu()
new=raw_input("enter name to find avg")
avg(new)
"""
"""
def div(n1,n2):
  try:
   p=n1/n2
   print(p)
  except Exception as error:
    print error

n= raw_input("enter range")
for i in range(int(n)):
  n1=raw_input("enter number 1")
  try:
     div(int(n1),int(n2))
  except Exception as error:
     print error
  
 """
