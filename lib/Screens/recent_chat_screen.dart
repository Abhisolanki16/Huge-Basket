import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Model/stores_chat.dart';
import 'package:march_27/Widgets/back_button.dart';
import 'package:march_27/constants.dart';

class RecentChatScreen extends StatefulWidget {
  const RecentChatScreen({super.key});

  @override
  State<RecentChatScreen> createState() => _RecentChatScreenState();
}

class _RecentChatScreenState extends State<RecentChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        leading: ArrowBack(
          color: AppColors.black1,
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        title: appBarTitle('Recent Chat', 20.sp, AppColors.green),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: storesChatList.length,
        itemBuilder: (context, index) => Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/chatscreen', arguments: index);
              },
              child: Container(
                padding: EdgeInsets.only(
                    left: 20.w, bottom: 10.h, right: 20.w, top: 15.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 30.r,
                        backgroundImage:
                            AssetImage(storesChatList[index].storeImage),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 15.w,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(storesChatList[index].storeName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: getTextStyle(FontWeight.w500,
                                          18.sp, AppColors.black1)),
                                  Text(storesChatList[index].receivedTime,
                                      style: getTextStyle(FontWeight.w500,
                                          16.sp, const Color(0xFF999B9C)))
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(storesChatList[index].msg,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: getTextStyle(FontWeight.normal,
                                          16.sp, const Color(0xFF999B9C))),
                                ),
                                CircleAvatar(
                                  radius: 12.r,
                                  backgroundColor: AppColors.black1,
                                  child: Text(
                                    storesChatList[index]
                                        .notificationCount
                                        .toString(),
                                    style: getTextStyle(FontWeight.normal,
                                        13.sp, AppColors.originalWhite),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 95.w, right: 25.w),
              child: const Divider(
                thickness: 1.5,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
