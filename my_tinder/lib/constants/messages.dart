class Message {
  final String content;
  final String time;
  final bool sendByMe;

  Message(this.content, this.time, this.sendByMe);
}

class Conversation {
  final String name;
  final String image;
  final List<Message> conversation;

  Conversation(this.name, this.image, this.conversation);
}