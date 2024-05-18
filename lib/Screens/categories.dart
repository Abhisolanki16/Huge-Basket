import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Model/categoryModel.dart';
import 'package:march_27/Model/stores.dart';
import 'package:march_27/Widgets/back_button.dart';
import 'package:march_27/Widgets/cart_button.dart';
import 'package:march_27/Widgets/listview_card.dart';
import 'package:march_27/Widgets/listview_title.dart';
import 'package:march_27/constants.dart';
import 'package:march_27/gen/assets.gen.dart';

class CategoriesSubcategories extends StatefulWidget {
  const CategoriesSubcategories({super.key});

  @override
  State<CategoriesSubcategories> createState() =>
      _CategoriesSubcategoriesState();
}

class _CategoriesSubcategoriesState extends State<CategoriesSubcategories> {
  bool loadingData = false;
  TextEditingController searchController = TextEditingController();
  int selectedCategoryIndex = 0;
  bool isLoading = true;

  CategoryModel? categoryModel;

  List<String> herolist = ['snd', 'snddd'];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.originalWhite,
    ));
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 3), () {
      return loadingData = false;
    });
  }

  Future<void> loadingScreen() async {
    await Future.delayed(const Duration(seconds: 0), () {
      return isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    int storeIndex = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xFFF5F5F5),
            body: FutureBuilder(
              future: loadingScreen(),
              builder: (context, snapshot) {
                if (isLoading == true) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 6),
                                    color:
                                        const Color.fromRGBO(31, 84, 195, 0.15),
                                    blurRadius: 20.sp,
                                    spreadRadius: 10.sp),
                              ],
                              image: DecorationImage(
                                
                                  image: Assets.store.image().image,
                                  fit: BoxFit.fill,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.5),
                                      BlendMode.darken)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                17.verticalSpace,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ArrowBack(color: const Color(0xFFFFFFFF)),
                                    appBarTitle(storeList[storeIndex].name,
                                        18.sp, const Color(0xFFFFFFFF)),
                                    CartButton(
                                      color: const Color(0xFFFFFFFF),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/viewcart');
                                      },
                                    )
                                  ],
                                ),
                                8.verticalSpace,
                                Container(
                                  height: 74.h,
                                  width: 74.w,
                                  decoration: BoxDecoration(
                                      //color: Colors.amber,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              storeList[storeIndex].imgPath),
                                          fit: BoxFit.cover),
                                      shape: BoxShape.circle),
                                ),
                                12.verticalSpace,
                                Text(
                                  storeList[storeIndex].discription,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: getTextStyle(FontWeight.normal, 12.sp,
                                      const Color(0xFFFFFFFF)),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 30.w, vertical: 15.h),
                                  child: TextFormField(
                                    controller: searchController,
                                    decoration: InputDecoration(
                                        hintText: 'Search Walmart',
                                        hintStyle: TextStyle(
                                            fontSize: 14.sp,
                                            color: const Color(0xFF999B9C)
                                                .withOpacity(0.5)),
                                        fillColor: const Color(0xFFF3F4F6),
                                        prefixIcon:
                                            const Icon(Icons.search_rounded),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12.w, vertical: 12.h),
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.r),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          15.verticalSpace,
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(240, 246, 238, 1),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 3),
                                    color: const Color.fromRGBO(0, 0, 0, 0.06),
                                    blurRadius: 10.sp,
                                    spreadRadius: 10.sp),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.h, left: 25.w, bottom: 10.h),
                                  child: Text('Choose your Category',
                                      style: getTextStyle(FontWeight.bold,
                                          18.sp, const Color(0xFF000000))),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(),
                                  alignment: Alignment.center,
                                  height: 140.h,
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    padding: EdgeInsets.only(
                                      left: 15.w,
                                      right: 15.w,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: categoryModelList.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedCategoryIndex = index;
                                              });
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                height: 70.h,
                                                width: 70.h,
                                                margin: EdgeInsets.only(
                                                  right: 15.w,
                                                  left: 15.w,
                                                ),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    border:
                                                        selectedCategoryIndex ==
                                                                index
                                                            ? Border.all(
                                                                color: AppColors
                                                                    .green,
                                                                width: 1)
                                                            : null,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            selectedCategoryIndex ==
                                                                    index
                                                                ? const Color
                                                                    .fromRGBO(
                                                                    8,
                                                                    255,
                                                                    0,
                                                                    0.17)
                                                                : const Color
                                                                    .fromRGBO(0,
                                                                    0, 0, 0.1),
                                                        blurRadius: 16,
                                                        offset:
                                                            const Offset(0, 0),
                                                        spreadRadius: 1,
                                                      )
                                                    ]),
                                                child: FutureBuilder(
                                                  future: loadData(),
                                                  builder: (context, snapshot) {
                                                    if (loadingData == false) {
                                                      return Image.asset(
                                                        categoryModelList[index]
                                                            .imgUrl,
                                                        height: 40,
                                                        width: 40,
                                                      );
                                                    } else {
                                                      return const CircularProgressIndicator();
                                                    }
                                                  },
                                                )),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            child: Text(
                                              categoryModelList[index].name,
                                              style: getTextStyle(
                                                  FontWeight.bold,
                                                  14.sp,
                                                  (selectedCategoryIndex ==
                                                          index)
                                                      ? const Color.fromRGBO(
                                                          68, 177, 44, 1)
                                                      : const Color.fromRGBO(
                                                          0, 0, 0, 1)),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          15.verticalSpace,
                          Column(
                            children: List.generate(
                                categoryModelList[selectedCategoryIndex]
                                    .subCategoryList
                                    .length, (index) {
                              return Container(
                                height: 300.h,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(240, 246, 238, 1),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 6),
                                        color:
                                            const Color.fromRGBO(0, 0, 0, 0.1),
                                        blurRadius: 16.sp,
                                        spreadRadius: 10.sp),
                                  ],
                                ),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    ListViewTitle(
                                      moreItemList: categoryModelList[
                                              selectedCategoryIndex]
                                          .subCategoryList[index],
                                      title: categoryModelList[
                                              selectedCategoryIndex]
                                          .name,
                                    ),
                                    ListViewCard(
                                      heroText: herolist[index],
                                      itemList: categoryModelList[
                                              selectedCategoryIndex]
                                          .subCategoryList[index],
                                      store: storeList[storeIndex].name,
                                    ),
                                    10.verticalSpace
                                  ],
                                ),
                              );
                            }),
                          )
                        ]),
                  );
                }
              },
            )));
  }
}
