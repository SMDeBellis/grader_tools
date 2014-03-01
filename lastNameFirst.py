<<<<<<< HEAD
=======
#!/usr/bin/python
>>>>>>> 4c29bd5901abbdad6ef98443b0c33f5acef04aef
from sys import argv

def lastNameFirst(nameString):
    firstName = []
    lastName = []
    swappedName = []
    length = len(nameString)
    _found = False
    index = 0

    while index < length and nameString[index] != '_':
        firstName.append(nameString[index])
        index +=1

    index += 1

    while index < length:
        lastName.append(nameString[index])
        index +=1

    swappedName = swappedName + lastName
    swappedName.append('_')
    swappedName = swappedName + firstName
    nameStr = "".join(swappedName)
    return nameStr

    
if __name__ == '__main__':

    print(lastNameFirst(argv[1]))
    exit(0)
    


    





    

