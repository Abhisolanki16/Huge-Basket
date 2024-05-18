import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:march_27/Model/message.dart';
import 'package:march_27/Model/stores_chat.dart';
import 'package:march_27/Widgets/receiver_chat_tile.dart';
import 'package:march_27/Widgets/back_button.dart';
import 'package:march_27/Widgets/sender_chat_tile.dart';
import 'package:march_27/constants.dart';
import 'package:march_27/provider/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController chatEditingController = TextEditingController();

  static DateTime returnDateAndTimeFormat(DateTime time) {
    // var originalDate = DateFormat('MM/dd/yyyy').format(time);
    return DateTime(time.year, time.month, time.day);
  }

  static String messageTime(DateTime time) {
    String difference = '';
    difference = DateFormat('jm').format(time);
    return difference;
  }

  // function to return date if date changes based on your local date and time
  static String groupMessageDateAndTime(DateTime time) {
    final todayDate = DateTime.now();

    final today = DateTime(todayDate.year, todayDate.month, todayDate.day);
    final yesterday =
        DateTime(todayDate.year, todayDate.month, todayDate.day - 1);
    String difference = '';
    final aDate = DateTime(time.year, time.month, time.day);

    if (aDate == today) {
      difference = "Today";
    } else if (aDate == yesterday) {
      difference = "Yesterday";
    } else {
      difference = DateFormat.yMMMd().format(time).toString();
    }

    return difference;
  }

  @override
  Widget build(BuildContext context) {
    int storeIndex = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        leading: ArrowBack(
          color: AppColors.black1,
        ),
        leadingWidth: 25.w,
        title: Row(children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              radius: 20.r,
              backgroundImage:
                  AssetImage(storesChatList[storeIndex].storeImage),
            ),
          ),
          appBarTitle(
              storesChatList[storeIndex].storeName, 20.sp, AppColors.black1),
        ]),
      ),
      body: Consumer<ChatProvider>(
        builder: (context, value, child) {
          String stName = storesChatList[storeIndex].storeName;
          final chatList = value.getMessages(stName);
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  // itemCount: messageList.reversed.length,
                  itemCount: chatList.reversed.length,
                  shrinkWrap: true,
                  reverse: true,
                  itemBuilder: (context, index) {
                    final message = chatList[index];

                    bool isSameDate = false;
                    String? newDate = '';

                    // final DateTime date =
                    //     returnDateAndTimeFormat(chatList[index].time);

                    if (index == 0 && chatList.length == 1) {
                      newDate = groupMessageDateAndTime(chatList[index].time)
                          .toString();
                    } else if (index == chatList.length - 1) {
                      newDate = groupMessageDateAndTime(chatList[index].time)
                          .toString();
                    } else {
                      final DateTime date =
                          returnDateAndTimeFormat(chatList[index].time);
                      final DateTime prevDate =
                          returnDateAndTimeFormat(chatList[index + 1].time);
                      isSameDate = date.isAtSameMomentAs(prevDate);

                      newDate = isSameDate
                          ? ''
                          : groupMessageDateAndTime(chatList[index - 1].time)
                              .toString();
                    }

                    return message.isSender
                        ? SenderChatTile(
                            text: stName,
                            stIndex: index,
                            // msg: messageList[index].text,
                            // msgTime: messageTime(messageList[index].time),
                            newDate: newDate,
                          )
                        : ReceiverChatTile(
                            text: stName,
                            stIndex: index,
                            // msg: messageList[index].text,
                            // msgTime: messageTime(messageList[index].time),
                            newDate: newDate,
                          );
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        controller: chatEditingController,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.add_circle,
                            color: Colors.black,
                            size: 25,
                          ),
                          prefixIcon: GestureDetector(
                              onTap: () {
                                if (chatEditingController.text.isNotEmpty) {
                                  final String messageText =
                                      chatEditingController.text;

                                  Provider.of<ChatProvider>(context,
                                          listen: false)
                                      .addMessage(
                                    stName,
                                    Message(
                                      text: messageText,
                                      time: DateTime.now(),
                                      isSender: true,
                                    ),
                                  );

                                  chatEditingController.clear();
                                  FocusScope.of(context).unfocus();
                                }
                              },
                              child: const Icon(Icons.settings_voice)),
                          fillColor: Colors.grey.withOpacity(0.2),
                          filled: true,
                          hintText: 'Send Your Massage',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0).w,
                      child: FloatingActionButton(
                        onPressed: () {
                          if (chatEditingController.text.isNotEmpty) {
                            final String messageText =
                                chatEditingController.text;

                            Provider.of<ChatProvider>(context, listen: false)
                                .addMessage(
                              stName,
                              Message(
                                text: messageText,
                                time: DateTime.now(),
                                isSender: true,
                              ),
                            );

                            chatEditingController.clear();
                            FocusScope.of(context).unfocus();
                          }
                        },
                        backgroundColor: const Color(0xFF44B12C),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ));
  }
}
