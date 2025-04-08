import 'package:flutter/cupertino.dart';

class ValueListenableBuilder1<A> extends StatelessWidget {
  final ValueNotifier<A> first;
  final Widget Function(BuildContext, A, Widget?) builder;

  const ValueListenableBuilder1({
    super.key,
    required this.first,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: first,
      builder: (context, valueB, _) {
        return builder(context, valueB, null);
      },
    );
  }
}
