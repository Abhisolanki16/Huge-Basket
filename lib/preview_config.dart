import 'package:flutter/material.dart';
import 'Screens/categories.dart';

Widget buildPreview(BuildContext context, Widget child) {
  return const MaterialApp(
   // theme: buildTheme(),
    home: CategoriesSubcategories(),
  );
}