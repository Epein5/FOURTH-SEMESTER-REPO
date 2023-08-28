# incomplete

print("SELECT YOUR PROBLEM")
print("         'pet-dhukyo' , 'haat-chilayo', 'tauko-dhukyo','khutta-dhukyo'")
problem_list = []
problem = input("WHat is your problem select form above : ")
problem_list.append(problem)
for i in range(10):
    x = 1
    print("Want to add problems click 1 else clik 0")
    x = int(input("ENter your choice"))
    if(x == 1):
        problem = input("WHat else is your problem select form above : ")
        problem_list.append(problem)
    else:
        break        

problem = {
    "start": problem_list,
    "finish": ["not-birami"],
    "rules":[
        {
            "problem" : "pet-dhukyo",
            "solution":"jibanjal kha"
        },

        {
            "problem" : "haat-chilayo",
            "solution":"haaat-chilanus"
        },
        {
            "problem" : "tauko-dhukyo",
            "solution":"sitamal khanus"
        },
        {
            "problem" : "khutta-dhukyo",
            "solution":"aaram garnus"
        },
    ]
}

start = problem['start']
finish = problem['finish']
rules = problem['rules']

for i in rules:
    # print(start[0])
    # print(i['problem'])
    if(start[0]==i['problem']):
        print(i['solution'])

