<PROBLEM SET 06> SEPTEMBER 07,2018
 SUBMITTED BY kiruthika.gopalsamy

#1.Define a class named Shape and its subclass Square. The Square class has an init function which takes a length as argument.
#Both classes have a area function which can print the area of the shape where Shape's area is 0 by default

class Shape:
	def area(self):
		return 0
class Square(Shape):
	def __init__(self,l):
		self.l=l
		res=Shape.area(self)
		print(res)
	def area(self):
		Area=self.l*self.l
		return Area
obj=Square(5)
result=obj.area()
print(result)
#2.Define a class Person and its two child classes: Male and Female.
#All classes have a method "getGender" which can print "Male" for Male class and "Female" for Female class.
class Person:
    def get_gender(self):
        print("male")


class Male(Person):
    def get_gender(self):
        print("male")


class Female(Person):
    def get_gender(self):
        print("female")


Male().get_gender()
Female().get_gender()
"""3.Design and implement a Money class that stores monetary values in dollars and cents. 
Special method init should have the following function header, def init(self, dollars, cents) Include special method repr (str) for displaying values in dollars and cents: $ 0.45, $ 1.00, $ 1.25. Also include special method add, and three getter methods that each provide the monetary value in another currency.
Choose any three currencies to convert to."""

class Money:
    def __init__(self, dollars, cent):
        self.dollars = dollars
        self.cent = cent
        dollar_string = '$' + str(self.dollars) + '.' + str(cent)
        self.repr(dollar_string)

    def repr(self, string):
        print "Dollar is :", string

    def add_india(self):
        rupee = self.dollars * 71.87
        paise = self.cent * 7.19
        indian_rupee = rupee + paise
        return str(indian_rupee)

    def add_kuwait_dinar(self):
        dinar = self.dollars * 0.30
        k_paise = self.cent * 0.030
        k_dinar = dinar + k_paise
        return str(k_dinar)

    def add_canadian_dollar(self):
        c_dollar = self.dollars * 1.31
        c_cent = self.cent * 0.13
        canadian_dollar = c_dollar + c_cent
        return str(canadian_dollar)


if __name__ == "__main__":
    dol = raw_input('Enter the dollar and cent value :')
    li = map(int, dol.split('.'))
    obj = Money(li[0], li[1])

    india = obj.add_india()
    print "Indian Rupees is :", india

    kuwait = obj.add_kuwait_dinar()
    print "Kuwaiti Dinar is :", kuwait

    canada = obj.add_canadian_dollar()
    print "Canadian Dollar is :", canada
#4.Write both a nonrecursive and recursive function that displays the rows of asterisks 
def spaces(s):
	str1=""
	for j in range(s):
		str1=str1+" "
	return str1
def stars(star):
	st=""
	for j in range(star):
		st=st+"*"
	return st
s=input("enter the rows")	
star=2
for i in range(s):
	strA=spaces(s-1)
	strB=stars(star)
	s=s-1
	star=star+2
	print(strA+strB)





