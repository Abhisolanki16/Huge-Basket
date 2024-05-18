import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Widgets/back_button.dart';
import 'package:march_27/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<IconData> icons = [
    Icons.location_on_outlined,
    Icons.chat_bubble_outline_rounded,
    Icons.notifications_active_outlined,
    Icons.star_border_rounded,
    Icons.share_outlined,
    Icons.help_outline,
    Icons.person_2_outlined,
    Icons.library_books_outlined,
    Icons.list_alt,
    Icons.contact_mail_outlined,
    Icons.logout_outlined
  ];

  List<String> titles = [
    'Manage Address',
    'Recent Chat',
    'Notification',
    'Rate the App',
    'Share App',
    'Help & FAQ',
    'About Us',
    'Terms and conditions ',
    'Privacy Policy',
    'Contact Us',
    'Logout'
  ];
  int storeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            appBar: AppBar(
              backgroundColor: const Color(0xFFFFFFFF),
              leading: ArrowBack(
                color: Colors.black,
              ),
              title: appBarTitle('Walmart', 20.sp, AppColors.green),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/editprofile');
                  },
                ),
              ],
            ),
            body: GridView.builder(
              itemCount: icons.length,
              padding: EdgeInsets.all(15.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.1,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 20.h),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    if (index == 2) {
                      Navigator.pushNamed(context, '/notification');
                    } else if (index == 0) {
                      Navigator.pushNamed(context, '/manageaddress');
                    } else if (index == 1) {
                      Navigator.pushNamed(context, '/recentchat');
                    } else if (index == 10) {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      sp.clear();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/mobile',
                        (route) => false,
                      );
                      //Navigator.popUntil(context,  ModalRoute.withName('/bottommenu'));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 20.w, top: 20.h, bottom: 20.h, right: 20.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0xFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10.r,
                              color: const Color.fromRGBO(0, 0, 0, 0.08),
                              offset: const Offset(0, 0),
                              spreadRadius: 0.5),
                        ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            icons[index],
                            size: 50.w,
                            color: const Color(0xFF44B12C),
                          ),
                          //  15  .verticalSpace,
                          Text(
                            titles[index],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: getTextStyle(FontWeight.bold, 18.sp,
                                const Color(0xFF1E2231)),
                          )
                        ]),
                  ),
                );
              },
            )));
  }
}
