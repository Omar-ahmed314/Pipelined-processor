# all numbers in hex format
# we always start by reset signal
# this is a commented line
.ORG 0  #this means the the following line would be  at address  0 , and this is the reset address
10
#you should ignore empty lines

.ORG 2  #this is empty stack exception handler address
400

.ORG 4  #this is invalid addess exception handler address
450

.ORG 6  #this is int 0
200

.ORG 8  #this is int 2
250

.ORG 10
IN 1     #R1=30
IN 2     #R2=50
IN 3     #R3=100
IN 4     #R4=300
Push 4   #sp=FFFFFFFE, M[FFFFFFFF]=300
#INT 2     #SP=FFFFFFFC, M[FFFFFFFD]=half next PC,M[FFFFFFFE]=other half next PC
#INC 1	  # this statement shouldn't be executed
JMP 1 

#check flag fowarding  
.ORG 30
AND 5,1,5   #R5=0 , Z = 1
JZ  2       #Jump taken, Z = 0
SETC        # this statement shouldn't be executed, C-->1

#check on flag updated on jump
.ORG 50
JZ 1      #shouldn't be taken
JC 3      #Jump Not taken

#check destination forwarding
NOT 5     #R5=FFFF, Z= 0, C--> not change, N=1
#INT 0      #SP=FFFFFFFC, M[FFFFFFFD]=half next PC,M[FFFFFFFE]=other half next PC
IN  6     #R6=700, flag no change
JN  6     #jump taken, N = 0
INC 1     # this statement shouldn't be executed


.ORG 200 #this is int 0
AND 0,0,0    #N=0,Z=1
OUT 6
RTI          #POP PC and flags restored

.ORG 250 #this is int 2
SETC
AND 0,0,0    #N=0,Z=1
OUT 2
RTI          #POP PC and flags restored

.ORG 300
ADD 6,3,6 #R6=400
ADD 1,1,2 #R1=80, C->0,N=0, Z=0
RET
SETC           #this shouldnot be executed

.ORG 500
NOP
NOP


#check on load use
.ORG 700
SETC      #C-->1
POP 6     #R6=300, SP=FFFFFFFF
Call 6    #SP=FFFFFFFD, M[FFFFFFFE]=half next PC,M[FFFFFFFF]=other half next PC
INC 6	  #R6=401, this statement shouldn't be executed till call returns, C--> 0, N-->0,Z-->0
NOP
NOP


