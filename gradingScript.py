#!usr/bin/python

from sys import argv

class parseFileName:
    def __init__(self, fileName):
        self.submitNum = ""
        self.assignNum = ""
        self.studentName = ""
        self.parseName(fileName)
    
    #-------------------------------------
    def parseName(self, fileName):

        fileNameLength = len(fileName);
        index = 0;

        while fileName[index] != '-':
            self.submitNum += fileName[index]
            index += 1
            
        index +=1

        while fileName[index] != '-':
            self.assignNum += fileName[index]
            index += 1

        index +=1

        while fileName[index] != ' ':
            self.studentName += fileName[index]
            index +=1

        self.studentName += '_'
        index +=1

        while fileName[index] != '-':
            self.studentName += fileName[index]
            index +=1

    #----------------------------------------------------

    def getStudentName(self):

        return self.studentName

    #---------------------------------------------------

    def getSubmitNum(self):

        return self.submitNum

    #--------------------------------------------------

    def getAssignNum(self):

        return self.assignNum
#-------------------------------------------------------
    


if __name__ == '__main__':

    #argvLength = len(argv)
    #if argvLength != 2:
    #    print("too many args passed into program")
    #    exit(1)
    #else:
    fileName = argv[3] + "_" + argv[4]
    print(fileName)
    #    myParser = parseFileName(fileName)
    #    print(myParser.getStudentName())


    '''
    myParser = parseFileName("0034-33353-jimmy pie-")
    print(myParser.getStudentName())
    print(myParser.getSubmitNum())
    print(myParser.getAssignNum())
    '''







    
    

#def parseFileName(fileName):
    
#def get


#def create_files(zippedFile):


