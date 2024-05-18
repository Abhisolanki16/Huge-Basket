import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:march_27/Screens/add_more_details.dart';
import 'package:march_27/Screens/add_new_address.dart';
import 'package:march_27/Screens/bottom_menu.dart';
import 'package:march_27/Screens/categories.dart';
import 'package:march_27/Screens/chat_screen.dart';
import 'package:march_27/Screens/profile_scree.dart';
import 'package:march_27/Screens/recent_chat_screen.dart';
import 'package:march_27/Screens/edit_address.dart';
import 'package:march_27/Screens/edit_profile.dart';
import 'package:march_27/Screens/manage_address.dart';
import 'package:march_27/Screens/mobile_number.dart';
import 'package:march_27/Screens/more_products.dart';
import 'package:march_27/Screens/place_an_order.dart';
import 'package:march_27/Screens/product_details.dart';
import 'package:march_27/Screens/notification.dart';
import 'package:march_27/Screens/store_details.dart';
import 'package:hive/hive.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Screens/view_cart.dart';
import 'package:march_27/provider/chat_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'Screens/otp_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
  ));
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await initLocalStorage();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      designSize: Size(width, height),
      builder: (context, child) {
        return ChangeNotifierProvider<ChatProvider>(
          create: (context) =>  ChatProvider(),
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            supportedLocales: const [Locale('en'), Locale('hi')],
            locale: const Locale('hi'),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routes: {
              '/': (context) =>  const RecentChatScreen(),
              //'/': (context) => const BottomMenuScreen(),
              '/mobile': (context) => const MobileNumberScreen(),
              '/otp': (context) => const OtpScreen(),
              '/moredetails': (context) => const AddMoreDetails(),
              '/bottomMenu': (context) => const BottomMenuScreen(),
              '/storedetails': (context) => const StoreDetails(),
              '/categories': (context) => const CategoriesSubcategories(),
              '/productdetails': (context) => const ProductDetailsScreen(),
              '/moreproducts': (context) => const MoreProducts(),
              '/editprofile': (context) => const EditProfile(),
              '/notification': (context) => NotificationScreen(),
              '/manageaddress': (context) => const ManageAddressScreen(),
              '/addnewaddress': (context) => const AddNewAddress(),
              '/editaddress': (context) => const EditAddress(),
              '/placeanorder': (context) => const PlaceAnOrder(),
              '/viewcart': (context) => const ViewCart(),
              '/profilescreen': (context) => const ProfileScreen(),
              '/recentchat': (context) => const RecentChatScreen(),
              '/chatscreen': (context) =>  const ChatScreen(),
            },
            theme:
                ThemeData(useMaterial3: false, canvasColor: Colors.transparent),
          ),
        );
      },
    );
  }
}
