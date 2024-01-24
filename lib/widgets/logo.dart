import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  const Logo(this.size, {Key? key}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) =>
      Image.asset('assets/emoji_sponge.png', height: size);
}
