import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Widgets/product_card_custom.dart';

// ignore: must_be_immutable
class ProductListView extends StatefulWidget {
  ProductListView(
      {super.key,
      required this.isTapped,
      required this.quantity,
      required this.onTap,
      required this.listItemCount,
      required this.heroText,
      required this.onPressed,
      required this.itemList});

  bool isTapped;
  int quantity;
  void Function()? onTap;
  int listItemCount;
  var itemList;
  void Function()? onPressed;
  String heroText;

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
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
                  itemCount:widget.listItemCount,
                  semanticChildCount: 1,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 25.h,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: widget.onTap,
                      child: CustomProductCard(
                        product: widget.itemList,
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
