/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class Assets {
  Assets._();

  static const AssetGenImage burger = AssetGenImage('assets/burger.png');
  static const AssetGenImage food1 = AssetGenImage('assets/food1.png');
  static const AssetGenImage frozenfood =
      AssetGenImage('assets/frozenfood.jpg');
  static const AssetGenImage iceCream = AssetGenImage('assets/ice-cream.png');
  static const AssetGenImage iceCream2 = AssetGenImage('assets/ice-cream2.png');
  static const AssetGenImage iceCream3 = AssetGenImage('assets/ice-cream3.png');
  static const AssetGenImage iceCream4 = AssetGenImage('assets/ice-cream4.png');
  static const AssetGenImage icecream = AssetGenImage('assets/icecream.jpeg');
  static const AssetGenImage logo = AssetGenImage('assets/logo.png');
  static const AssetGenImage mastercard =
      AssetGenImage('assets/mastercard.png');
  static const AssetGenImage milkBottle =
      AssetGenImage('assets/milk-bottle.png');
  static const AssetGenImage milkBox = AssetGenImage('assets/milk-box.png');
  static const AssetGenImage milk = AssetGenImage('assets/milk.png');
  static const AssetGenImage milkPacket1 =
      AssetGenImage('assets/milk_packet1.png');
  static const AssetGenImage milkPacket2 =
      AssetGenImage('assets/milk_packet2.png');
  static const AssetGenImage milkPacket4 =
      AssetGenImage('assets/milk_packet4.jpg');
  static const AssetGenImage milkPacket5 =
      AssetGenImage('assets/milk_packet5.png');
  static const AssetGenImage pancakes = AssetGenImage('assets/pancakes.png');
  static const AssetGenImage pizza = AssetGenImage('assets/pizza.png');
  static const String sample = 'assets/sample.json';
  static const AssetGenImage seafood = AssetGenImage('assets/seafood.jpg');
  static const AssetGenImage snacks = AssetGenImage('assets/snacks.jpg');
  static const AssetGenImage spaghetti = AssetGenImage('assets/spaghetti.png');
  static const AssetGenImage store = AssetGenImage('assets/store.jpg');
  static const AssetGenImage tutorial1 = AssetGenImage('assets/tutorial1.png');
  static const AssetGenImage tutorial3 = AssetGenImage('assets/tutorial3.png');
  static const AssetGenImage tutorial4 = AssetGenImage('assets/tutorial4.png');
  static const AssetGenImage vegetables =
      AssetGenImage('assets/vegetables.png');
  static const AssetGenImage walmart = AssetGenImage('assets/walmart.jpg');

  /// List of all assets
  static List<dynamic> get values => [
        burger,
        food1,
        frozenfood,
        iceCream,
        iceCream2,
        iceCream3,
        iceCream4,
        icecream,
        logo,
        mastercard,
        milkBottle,
        milkBox,
        milk,
        milkPacket1,
        milkPacket2,
        milkPacket4,
        milkPacket5,
        pancakes,
        pizza,
        sample,
        seafood,
        snacks,
        spaghetti,
        store,
        tutorial1,
        tutorial3,
        tutorial4,
        vegetables,
        walmart
      ];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
