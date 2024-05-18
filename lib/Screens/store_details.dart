import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Model/review.dart';
import 'package:march_27/Widgets/custom_card.dart';
import 'package:march_27/gen/assets.gen.dart';

import 'review_page.dart';

// ignore: must_be_immutable
class StoreDetails extends StatefulWidget {
  const StoreDetails({
    super.key,
  });

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  bool isLoading = true;
  Future<void> loadingScreen() async {
    await Future.delayed(const Duration(seconds: 0), () {
      return isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int storeIndex = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
        child: Scaffold(
       backgroundColor: const Color(0xFFFFFFFF),
      body: FutureBuilder(
        future: loadingScreen(),
        builder: (context, snapshot) {
          if (isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: const Color(0xFFFFFFFF),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_outlined),
                      color: Colors.white,
                    ),
                    title: Text(
                      "Store Details",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    centerTitle: true,
                    actions: [
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/viewcart');
                            },
                            icon: const Icon(Icons.shopping_cart),
                            color: Colors.white,
                          ),
                          Positioned(
                            right: 5.w,
                            top: 5.h,
                            child: Container(
                              height: 17.h,
                              width: 17.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.r),
                                color: Colors.green,
                              ),
                              child: Center(
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    expandedHeight: 270.h,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(children: [
                        Container(
                          height: 205.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.2), BlendMode.darken),
                              image: Assets.store.image().image
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 3 - 120,
                          left: MediaQuery.of(context).size.width / 20,
                          right: MediaQuery.of(context).size.width / 20,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/categories',
                                  arguments: storeIndex);
                            },
                            child: CustomCard(
                              storeIndex: storeIndex,
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                ];
              },
              body: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Scaffold(
                  body: Column(
                    children: [
                      10.verticalSpace,
                      TabBar(
                        padding: EdgeInsets.zero,
                        controller: controller,
                        labelPadding: EdgeInsets.only(right: 5.w, left: 5.w),
                        indicator:
                            const BoxDecoration(color: Color(0xffF0F6EE)),
                        labelColor: Colors.green,
                        indicatorColor: Colors.transparent,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Container(
                              color: const Color(0xffF0F6EE),
                              child: const Center(
                                  child: Tab(
                                text: 'About Us',
                              ))),
                          Container(
                              color: const Color(0xffF0F6EE),
                              child: const Center(child: Tab(text: 'Reviews'))),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: controller,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20.w),
                              child: const SingleChildScrollView(
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                  maxLines: 19,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              child: SingleChildScrollView(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "All Reviews(${reviews.length})",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Color(
                                                  0xFF272727,
                                                ),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "View all",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.sp),
                                            )),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        children: List.generate(
                                            reviews.length,
                                            (index) => ReviewPage(
                                                  index: index,
                                                )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    ));
  }
}
