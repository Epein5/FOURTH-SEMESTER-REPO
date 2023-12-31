# 1. Design a Python class structure for a simple online messaging system. 
  Code is given in the above main.py file
  - - You can create a user using the code

                  user1 = User('user1', 'user1@example.com')

  - You can add a person using the code

                  user1.add_contact(user3)
    - You can send messages using the code

                  user1.send_message(user2, 'Hello!')
    
# 2. Apply at least one object-oriented design principle (e.g., encapsulation, inheritance) in your design.

I have applied bothe the concept of Encapsulation as well as inheritance

## 1. Encapsulation:
Encapsulation refers to the bundling of attributes with the methods that operate on that data within a class.

In the User class:
  - Attributes username, email, and contacts are encapsulated within the class as instance variables.
  - Methods add_contact, send_message, and receive_message act as the interface for interacting with the class attributes. These methods control how external entities interact with the class's internal data.

  
## Inheritance:
Inheritance is the process by which one class inherits the properties (attributes and methods) of another class.

In the provided code:

  - The GroupChat class inherits from the Message class using class GroupChat(Message). This means that GroupChat will inherit attributes (sender, recipient, content) and methods from the Message class.
  - Aditionally, the GroupChat class introduces its own attribute (recipients) and method (add_member), extending the functionalities of the Message class specifically for group chat functionalities.

# 3. Explain how the chosen principle improves the design.
  - Encapsulation:
     Controls data access, ensuring data integrity and secure manipulation within the User class.

  - Inheritance:
    Enables code reuse, reducing redundancy by inheriting and extending functionalities from the Message class for group chat-specific features.
