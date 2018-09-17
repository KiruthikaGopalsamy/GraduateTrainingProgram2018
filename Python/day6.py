"""Create a program which accept the ‘directory path’ and will have the following functions in it –
1.A function to list down all the files in current and subdirectories of the given path.
2.A function to count the number of files and number of unique files in current and subdirectories.
3.A function to count the number of “.txt” files in current directory as well as the subdirectories."""




import os
path=raw_input("enter path:")
l=[]
def lists(path):
	files_name=os.listdir(path)
	for i in files_name:
		file_list=os.path.join(path,i)
		if os.path.isfile(file_list)==True:
			l.append(i)
		else:
			sd=os.listdir(os.path.join(path,i))
	print "directory files :%s"%l
	print "subdirectory files:%s"%sd
	lists=l+sd
	return lists
def cnt(lists):
	cnt=len(lists)
	print "cnt of lists:%d"%cnt
def check(lists):
	file_cnt = 0
	for i in lists:
		if i.endswith('.txt'):
			file_cnt=file_cnt+1
	print "count of txt files:%d"%file_cnt
			
aa=lists(path)
print "list of files:%s"%aa
cnt(aa)
check(aa)
	




















