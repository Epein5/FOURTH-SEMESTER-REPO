# Iterates over the main problem solver to find various solution to the problem 
# Guraantes the optimunum solution by choosing the shortest path obtained
# Should place high iterating value for While loop in main function for complex problems


import random
import time
class Tracker:
    # checks whether the preconditions are set
    def preconditionchecker(checklist, operations):
        for i in operations:
            if all(precond in checklist for precond in i['preconds']):
                return i
            else:
                pass
        return False
    
   # checks whether the the finish condition is satisfied or not 
    def finishconditionchecker(checklist, finish):
        if all(x in checklist for x in finish):
            return True
        else:
            return False
        
    # Used for filtering out the actions while choosing the best optimum solution
    def actionchecker(list, action):
        if all(x in list for x in action):
            return True
        else:
            return False


class AddandDelete:
    #adds and deletes conditions
    def addAndDeleteOperation(checklist, operation,actions,finishcondition):
        if (len(operation['add'])!=0):
                    [checklist.append(i) for i in operation['add']]
        if Tracker.finishconditionchecker(checklist,finishcondition)==True:
            return   
        for x in operation['delete']:
            if x in checklist:            
                if (len(operation['delete'])!=0):
                    [checklist.remove(i) for i in operation['delete']]              
            else:
                pass
        return 
        


class ProblemSolver:
    #main logic to be implemented 
    def mainproblemSolver(checklist, finishcondition, operations,x,actiondict):
        
        actions=[]
        while(Tracker.finishconditionchecker(checklist,finishcondition)==False):
            # Suffle the operatins so that the task doese not goes to infinite loop
            shu = random.sample(operations,len(operations))
            a = Tracker.preconditionchecker(checklist,shu)
            # does the actions 
            if(a != False):
                b = AddandDelete.addAndDeleteOperation(checklist,a,actions,finishcondition)
                if(b == False):
                    return actions
                else:
                    actions.append(a['action'])
            else:
                actions.append("TRYING AGAIN")
                return actions
        return actions
    
    # main function 
    # set the while loop iterations high for complex operations 
    def mainsolver(self,checklist, finishcondition, operations):   
        x = -1
        actionsdict={}
        while x < 10:
            newlist = checklist[:]
            x = x +1
            actionsdict[x] =ProblemSolver.mainproblemSolver(newlist, finishcondition, operations,x,actionsdict)
        return ProblemSolver.findOpmimalSolution(actionsdict,finishcondition)

    # finds the optimum solution 
    def findOpmimalSolution(dictionary,finishcondition):
        finishedlist=[]
        for key,value in dictionary.items():
            if Tracker.actionchecker(value,['TRYING AGAIN'])==False:
                finishedlist.append(value)
        optimumaction = min(finishedlist, key=len)
        return optimumaction
    

class UselessAnimations:
    def TimeDalay():
        time.sleep(1)
        print("\n")
