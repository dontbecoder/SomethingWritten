age=25
name='swaroop'
print('{0} is {1} years old'.format(name,age))
print("Why is {0} playing with that python?".format(name))
age='this is python 3.2'
print(age)
age=2
if age>0:
	print('yes')
else:
	print('no')

#guess=(input('Guess a number plz:\n'))

if True:
	print('You are right!')
else:
	print('U are wrong!')
def tst():
	'''This is a helpful doc for newer!'''
	pass

print(tst.__doc__)
######### A example here 
import sys
import time
print('The command line arguments are:')
for i in sys.argv:
	print(i)

print('\n\nThe python path is ',sys.path,'\n')

print(time.strftime('%H%M%S'))

comment=input('give me 5 plz:\n')
if comment==0:
	print('empty\n')
else:
	print(comment,'\n')

######### A example here 
class person:
	def __init__(self,name):
		self.name=name
	def sayhi(self):
		print('hello,python3!',self.name)
p=person('huangda')
p.sayhi()

######### A example here 
class Robot:
	population=0
	def __init__(self,name):
		'''Initializes the data.'''
		self.name=name
		print('(Initializing {0})'.format(self.name))
		Robot.population +=1

	def __del__(self):
		print('{0} is being destroyed!'.format(self.name))
		Robot.population -=1

		if Robot.population==0:
			print('{0} was the last one'.format(self.name))
		else:
			print('There are still {0:d} robots'.format(Robot.population))

	def sayHi(self):
		print('Greetings,my name is {0}'.format(self.name))

	def howMany():
		print('We have {0:d} robots'.format(Robot.population))
	howMany=staticmethod(howMany)

android1=Robot('R2-D2')
android1.sayHi()
Robot.howMany()

droid2=Robot('C30')
droid2.sayHi()
Robot.howMany()

print('start here!')

print('Ending them now')
del android1
del droid2

Robot.howMany()

######### A example here 

class SchoolMember:
	def __init__(self,name,age):
		self.name=name
		self.age=age
		print('Initialized SchoolMember:{0}'.format(self.name))
	
	def tell(self):
		print('Name:"{0}"\n Age:{1}'.format(self.name,self.age))

class Teacher(SchoolMember):
	def __init__(self,name,age,salary):
		SchoolMember.__init__(self,name,age)
		self.salary=salary
		print('Initialized Teacher:{0}'.format(self.name))

	def tell(self):
		SchoolMember.tell(self)
		print('Salary:{0}'.format(self.salary))

class Student(SchoolMember):
	def __init__(self,name,age,marks):
		SchoolMember.__init__(self,name,age)
		self.marks=marks
		print('Initialized Student:{0}'.format(self.name))

	def tell(self):
		SchoolMember.tell(self)
		print('Marks:{0}'.format(self.marks))

t=Teacher('Mrs.Lee',40,30000)
s=Student('Hd',25,90)
print()
members=[t,s]
for member in members:
	member.tell()

######### A example here 
poem='''Programming is fun when the work is done.If you wanna make your work
also fun: Use Python!'''

f=open('poem.txt','w')
f.write(poem)
f.close()

f=open('poem.txt')
while True:
	line=f.readline()
	if len(line)==0:
		break
	print(line,end='')
f.close()

######### A example here 
import pickle

shoplistfile='shoplist.data'
shoplist=['apple','mango','carrot']

f=open(shoplistfile,'wb')
pickle.dump(shoplist,f)
f.close()

del shoplist

f=open(shoplistfile,'rb')
storedlist=pickle.load(f)
print("\n",storedlist)

######### A example here 
try:
	text=input('Enter something -->')
except EOFError:
	print('Why did you do an EOF on me?')
except KeyboardInterrupt:
	print('You cancelled the operation.')
else:
	print('You entered {0}'.format(text))

######### A example here
my_str='hello,python 3'
print(my_str)

######### A example here
import time
import signal

def handler(signo, frame):
	print("Got signal",signo)

signal.signal(signal.SIGALRM,handler)
signal.alarm(2)
now=time.time()
time.sleep(200)
print("Sleep for",time.time()-now,"secs")

######## socket
tcpSock = socket.socket(socket.AAF_INET,socket.SOCK_STREAM)

udpSock = socket.socket(socket.AAF_INET,socket.SOCK_DGRAM)

from socket import *
tcpSock = socket(AF_INET,SOCK_STREAM)

# fake code for tcp server
ss=socket() # create a socket 
ss.bind()	# bind Address 
ss.listen()	# start to listen
inf_loop()	# server loop
cs = ss.accept()	# accept client connection
comm_loop	# communicate loop
cs.recv()/cs.send() # talk (send/receive)
cs.close()	# close client socket
ss.close()	# close server socket in option

# Fake code for tcp client
cs=socket()
cs.connet()
comm_loop
cs.send()/cs.recv()
cs.close()

# Create a UDP server
ss=socket()
ss.bind()
inf_loop
cs=ss.recvfrom()/ss.sendto()
ss.close()

# Create a UDP client
cs=socket()
comm_loop
cs.sendto()/cs.recvfrom()
cs.close()

# FTP 
from ftplib import FTP
f=FTP('ftp.python.org')
f.login('anonymous','guess@who.org')
f.quit()

# module zipFile
import zipFile
filename="abdcd.zip"
z=zipfile.ZipFile(filename,"r")
z.extractall()
z.close()
