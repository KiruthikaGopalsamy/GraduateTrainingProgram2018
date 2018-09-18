<PROBLEM SET 01> SEPTEMBER 06 31,2018
 SUBMITTED BY kiruthika.gopalsamy


"""You are given two sets, A and B . 
Your job is to find whether set A is a subset of set B .

If set A is subset of set B , print True.
If set A is not a subset of set B , print False."""



n=raw_input("enter number of test case")
for i in range(int(n)):
    i=i+1
    print("Test case%s"%i)
    a=raw_input("enter number of n1")
    num1=[]
    for i in range(int(a)):
        n1=raw_input("enter %s numbers"%a)
        num1.append(n1)

    b=raw_input("enter number of n2")
    num2=[]
    for i in range(int(b)):
        n2=raw_input("enter %s numbers"%b)
        num2.append(n2)
    print("Testcase  is",set(num1).issubset(set(num2)))
