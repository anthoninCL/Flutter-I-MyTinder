import 'package:my_tinder/constants/messages.dart';

bool isLastMessage(int index, Conversation conversation) {
  return index + 1 == conversation.conversation.length;
}

bool isNextMessageFromSameSender(int index, Conversation conversation) {
  bool current = conversation.conversation[index].sendByMe;

  if (isLastMessage(index, conversation)) {
    return false;
  }

  return current == conversation.conversation[index + 1].sendByMe;
}

bool isNextMessageFromSameTime(int index, Conversation conversation) {
  String current = conversation.conversation[index].time;

  if (isLastMessage(index, conversation)) {
    return false;
  }

  return current == conversation.conversation[index + 1].time;
}

bool isPrevMessageFromSameSender(int index, Conversation conversation) {
  bool current = conversation.conversation[index].sendByMe;

  if (index == 0) {
    return false;
  }

  return current == conversation.conversation[index - 1].sendByMe;
}

bool isPrevMessageFromSameTime(int index, Conversation conversation) {
  String current = conversation.conversation[index].time;

  if (index == 0) {
    return false;
  }

  return current == conversation.conversation[index - 1].time;
}