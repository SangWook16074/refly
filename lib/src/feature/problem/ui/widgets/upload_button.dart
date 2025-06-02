import 'package:flutter/material.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 118,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: colorScheme.primary),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add,
            color: Color(0xffffffff),
          ),
          Text(
            "추가하기",
            style: TextStyle(
              fontFamily: "Roboto",
              color: Color(0xffffffff),
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
