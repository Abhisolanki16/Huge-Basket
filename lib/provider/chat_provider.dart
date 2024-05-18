import 'package:flutter/material.dart';
import 'package:march_27/Model/message.dart';

class ChatProvider extends ChangeNotifier {
  Map<String, List<Message>> martMessages = {
    'Walmart': [],
    'Stop&Shop': [],
    'John': [],
    'zeearson': [],
    'Kartain Killer': [],
  };
  List<Message> getMessages(String title) {
    return martMessages[title] ?? [];
  }

  void addMessage(String title, Message message) {
    if (martMessages.containsKey(title)) {
      martMessages[title]!.add(message);
    } else {
      martMessages[title] = [message];
    }
    notifyListeners();
  }
}
