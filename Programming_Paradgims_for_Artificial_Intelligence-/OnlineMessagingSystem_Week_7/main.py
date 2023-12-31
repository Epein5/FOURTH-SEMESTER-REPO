class User:
    def __init__(self, username, email):
        self.username = username
        self.email = email
        self.contacts = []

    def add_contact(self, user):
        print(f"Adding {user.username} to {self.username}'s contacts")
        self.contacts.append(user)

    def send_message(self, recipient, content):
        if recipient in self.contacts:
            message = Message(self, recipient, content)
            recipient.receive_message(message)
        else:
            print(f"Error: {recipient.username} not in contacts list. Cannot send message.")

    def receive_message(self, message):
        print(f"Received message from {message.sender.username}: {message.content}")

class Message:
    def __init__(self, sender, recipient, content):
        self.sender = sender
        self.recipient = recipient
        self.content = content

class GroupChat(Message):
    def __init__(self, sender, recipients, content):
        super().__init__(sender, None, content)
        self.recipients = recipients

    def add_member(self, user):
        self.recipients.append(user)

# Example Usage:
user1 = User('user1', 'user1@example.com')
user2 = User('user2', 'user2@example.com')
user3 = User('user3', 'user3@example.com')


user1.add_contact(user3)
user1.send_message(user3, 'Hello!')
user1.send_message(user2, 'Hello!')
