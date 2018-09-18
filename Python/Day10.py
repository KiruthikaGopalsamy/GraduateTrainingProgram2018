<PROBLEM SET 08> SEPTEMBER 17,2018
 SUBMITTED BY kiruthika.gopalsamy
 
 """Assign each to a variable called data1, data2, data3
 Join the two dataframes along rows and assign it to all_data
 Join the two dataframes along columns and assing it to all_data_col
 Print data3
 Merge all_data and data3 along the subject_id value
 Merge only the data that has the same 'subject_id' on both data1 and data2
 Merge all values in data1 and data2, with matching records from both sides where available"""

import pandas as pd 
d1 = {
        'subject_id': ['1', '2', '3', '4', '5'],
        'first_name': ['Alex', 'Amy', 'Allen', 'Alice', 'Ayoung'], 
        'last_name': ['Anderson', 'Ackerman', 'Ali', 'Aoni', 'Atiches']}

data1=pd.DataFrame(data=d1)
d2 = {
        'subject_id': ['4', '5', '6', '7', '8'],
        'first_name': ['Billy', 'Brian', 'Bran', 'Bryce', 'Betty'], 
        'last_name': ['Bonder', 'Black', 'Balwner', 'Brice', 'Btisan']}

data2=pd.DataFrame(data=d2)

d3 = {
        'subject_id': ['1', '2', '3', '4', '5', '7', '8', '9', '10', '11'],
        'test_id': [51, 15, 15, 61, 16, 14, 15, 1, 61, 16]}
data3=pd.DataFrame(data=d3)
print(data1)
all_data= pd.concat([data1, data2])
print(all_data)

all_data2= pd.concat([data1, data2],axis=1)
print(all_data2)

d_merge=pd.merge(all_data, data3, on='subject_id')
print(d_merge)
d_m=pd.merge(data1, data2, on='subject_id', how='inner')
print(d_m)

d_all=pd.merge(data1, data2, on='subject_id', how='outer')

print(d_all)
