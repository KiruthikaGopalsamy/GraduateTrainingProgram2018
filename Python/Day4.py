#1

def sort_backpack():
    inventory['backpack'].sort()
    print("sorted list%s"%inventory['backpack'])
def delete():
    # del inventory['backpack'][2]
   inventory['backpack'].pop(2)
   print("after deletion%s"%inventory['backpack'])	
def add_element():
    inventory['gold']=[500,50]
    print("after adding value to the key gold%s"%inventory)
inventory = {
                   'gold' : 500,
                   'pouch' : ['flint', 'twine', 'gemstone'],
                   'backpack' : ['xylophone','dagger', 'bedroll','bread loaf']
                }
				
inventory['pocket']=['seashell', 'strange berry' ,'lint']
print("new inventory%s"%inventory)
sort_backpack()
delete()
add_element()
"""
#2
"""
def sum_stu():
   #sum_s={}
   for k,v in student_details.iteritems():
       sum_s[k]=sum(v)
   print("total mark%s"%sum_s)
def avg():
   avg_s={}
   for k,v in student_details.iteritems():
       avg_s[k]=sum(v)/len(v)
   print("average mark%s"%avg_s)

student_details={}
student_details['student1']=[99,89,96]
student_details['student2']=[99,98,96]
sum_stu()				
avg()				
				
"""
