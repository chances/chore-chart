import 'package:flutter/widgets.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    required Widget child,
    required this.media,
    Key? key,
  }) : super(key: key, child: child);

  final MediaQueryData media;

  static AppConfig of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppConfig>()!;

  // TODO bool get isIos => true || false;

  bool get isPortrait => media.orientation == Orientation.portrait;
  double get logicalWidth => isPortrait ? media.size.width : media.size.height;
  double get logicalHeight => isPortrait ? media.size.height : media.size.width;

  @override
  bool updateShouldNotify(AppConfig oldWidget) => true;

  double vw(double percentage, {bool fromLogicalSize = false}) {
    assert(percentage >= 0.0 && percentage <= 1.0);
    return (fromLogicalSize ? logicalWidth : media.size.width) * percentage;
  }

  double vh(double percentage, {bool fromLogicalSize = false}) {
    assert(percentage >= 0.0 && percentage <= 1.0);
    return (fromLogicalSize ? logicalHeight : media.size.height) * percentage;
  }
}
