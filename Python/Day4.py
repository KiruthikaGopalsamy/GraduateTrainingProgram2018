<PROBLEM SET 04> SEPTEMBER 05,2018
 SUBMITTED BY kiruthika.gopalsamy


"""You are asked to ensure that the first and last names of people begin with a capital letter in their passports. For example, alison heck should be capitalised correctly as Alison Heck.

alison heck => Alison Heck

Given a full name, your task is to capitalize the name appropriately.

Input Format:-

A single line of input containing the full name, S .

Constraints:-

* 0<len(S)<1000
* The string consists of alphanumeric characters and spaces."""

name=raw_input("enter name")
new=""
c_name=name.split(' ')
for i in range(len(c_name)):
 new=new+c_name[i].capitalize()+" "
print new




import string
name=raw_input("enter name")
print string.capwords(name)


"""

You have a record of  students. Each record contains the student's name, and their percent marks in Maths, Physics and Chemistry. The marks can be floating values. The user enters some integer  followed by the names and marks for students. You are required to save the record in a dictionary data type. The user then enters a student's name. Output the average percentage marks obtained by that student, correct to two decimal places.

Input Format:-

The first line contains the integer N, the number of students. The next  lines contains the name and marks obtained by that student separated by a space. The final line contains the name of a particular student previously listed.

Constraints:-

* 2<=N<=10
* 0<=MARKS<=100


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
Exceptions
----------
Errors detected during execution are called exceptions."""


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
  
