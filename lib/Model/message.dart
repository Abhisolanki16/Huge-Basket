
class Message {
  String text;
  DateTime time;
  bool isSender;

  Message({required this.text, required this.time, required this.isSender});

  // String get message => text;
  // DateTime get timeFormat => time;
  // bool get isMee => isSender;
}

List<Message> messageList = [
  Message(text: 'Today msg', time: DateTime.now(), isSender: false),
  Message(text: 'Today msg', time: DateTime.now(), isSender: true),
  Message(text: 'Today msg', time: DateTime.now(), isSender: false),
  Message(
      text: 'Yesterday msg',
      time: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day - 1, 11, 30),
      isSender: false),
  Message(
      text: 'Yesterday msg',
      time: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day - 1, 11, 30),
      isSender: false),
  Message(
      text: 'Feb 8th Message',
      time: DateTime(2023, 02, 08, 15, 20),
      isSender: true),
  Message(
      text: 'Feb 8th Message',
      time: DateTime(2023, 02, 08, 15, 20),
      isSender: true),
];
