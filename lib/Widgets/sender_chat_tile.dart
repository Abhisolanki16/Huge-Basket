import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/chat_provider.dart';

// ignore: must_be_immutable
class SenderChatTile extends StatelessWidget {
  final String text;
  final int stIndex;
  String newDate;
  // String msg;
  // String msgTime;

   SenderChatTile({
    required this.text,
    super.key,
    required this.newDate,
    // required this.msg,
    // required this.msgTime,
    required this.stIndex,
  });



  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, value, child) {
        final message = value.getMessages(text)[stIndex];
        // final day = DateFormat.d().format(message.time);
        // final month = DateFormat.LLLL().format(message.time);
        final time = DateFormat.jm().format(message.time);
        return Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 10, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Text(
                    newDate,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      color: const Color(0xff8BCB01).withOpacity(.2)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    // child: Text(msg),
                    child: Text(message.text),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          // msgTime,
                          time,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: List.generate(
                            2,
                            (index) => const Padding(
                                  padding: EdgeInsets.only(left: 3),
                                  child: Icon(
                                    size: 5,
                                    Icons.circle,
                                    color: Colors.green,
                                  ),
                                )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
