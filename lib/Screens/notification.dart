import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Widgets/back_button.dart';
import 'package:march_27/Widgets/notification_tile.dart';
import 'package:march_27/constants.dart';

// ignore: must_be_immutable
class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  bool isOrderIdPresent = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
         backgroundColor: const Color(0xFFFFFFFF),
        leading: ArrowBack(color: const Color(0xFF000000)),
        title: appBarTitle('Notifications', 20.sp, AppColors.green),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 3,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        itemBuilder: (context, index) {
          return CustomNotificationTile(
              isOrderIdPresent: true,
              orderId: "Order ID : ABC124",
              time: '3:00 pm',
              title: 'Your order has been successfully placed! ');
        },
      ),
    );
  }
}
