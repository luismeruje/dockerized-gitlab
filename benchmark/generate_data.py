import sys

file = open(sys.argv[1], 'w')
file.write('name,username,email,password,project\n')
for i in range(int(sys.argv[2]),int(sys.argv[3])+1):
    file.write('name' + str(i) + ',username' + str(i) + ',email' + str(i) + '@email.com,password' + str(i) + ',project' + str(i) + '\n')
file.close()