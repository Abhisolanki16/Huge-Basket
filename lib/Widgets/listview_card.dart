import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Widgets/product_card_custom.dart';

// ignore: must_be_immutable
class ListViewCard extends StatefulWidget {
  ListViewCard(
      {super.key,
      required this.heroText,
      required this.itemList,
      required this.store});

  List<dynamic> itemList;
  String heroText;
  var store;
  @override
  State<ListViewCard> createState() => _ListViewCardState();
}

class _ListViewCardState extends State<ListViewCard> {
  bool isTapped = false;

  bool loadingData = false;
  Future<bool> loadData() async {
    return Future.delayed(const Duration(seconds: 3), () {
      return loadingData = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                height: 230.h,
                child: ListView.builder(
                  itemCount: widget.itemList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 25.h,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/productdetails',
                            arguments: {
                              'itemList': widget.itemList[index],
                              'store': widget.store
                            });
                      },
                      child: CustomProductCard(
                        product: widget.itemList[index],
                        // isTapped: isTapped,
                        //quantity: quantity,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 20.w),
            child: FloatingActionButton(
              heroTag: widget.heroText,
              onPressed: () {},
              backgroundColor: const Color(0xFFFFFFFF),
              foregroundColor: const Color(0xFF44B12C),
              shape: const CircleBorder(),
              child: const Icon(Icons.arrow_forward_rounded),
            ),
          )
        ],
      ),
    );
  }
}
