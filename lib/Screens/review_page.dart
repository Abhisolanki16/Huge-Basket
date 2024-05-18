import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Model/review.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 58,
              width: 58,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: Colors.red,
                  image: DecorationImage(
                      image: NetworkImage(reviews[index].profilePic),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 106.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          reviews[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        reviews[index].time,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: List.generate(
                    5,
                    (i) {
                      Color iconColor;
                      int passedRating = reviews[index].rating;

                      if (i < passedRating) {
                        iconColor = Colors.yellow;
                      } else {
                        iconColor = Colors.black;
                      }

                      return Icon(
                        Icons.star,
                        size: 11,
                        color: iconColor,
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 110,
                  child: Text(
                    maxLines: 2,
                    'Lorem Ipsum is simply dummy textLorem Lorem Ipsum is simply dummy textLorem Lorem Ipsum is simply dummy textLorem  ',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Divider(),
        )
      ],
    );
  }
}
