import 'package:flutter/widgets.dart';

class DragHandle extends Container {
  DragHandle({super.key})
      : super(
            width: 40,
            height: 3.0,
            margin: const EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.0),
              color: const Color(0xffafafaf),
            ));
}
