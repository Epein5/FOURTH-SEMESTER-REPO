from unittest import case
from emails import email_list

# function to remove comma(,) , dash(-) and space (" ") from the texts and convert all of it to lowercase
def textmanipulator(string):
    a = ""
    b = ""
    c = ""
    splitted = string.split(" ")
    for i in splitted:
        a = a + i
    splitted = a.split("-")
    for i in splitted:
        b = b + i
    splitted = b.split(",")
    for i in splitted:
        c = c + i
    return c.lower()


input_email = input("Enter the email to be checked \n")
a = 0
for i in email_list:
    if textmanipulator(i[0].split(": ",1)[1]) == textmanipulator(input_email):
        print("The given message has a high probability of being ", i[1])
        a+=1
        break

if(a == 0):
    print("No data as such in datase ")
