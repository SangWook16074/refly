import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProblemEditSheet extends StatelessWidget {
  const ProblemEditSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                color: const Color(0xff000000).withOpacity(.04))
          ],
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(12.0)),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "수정하기",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "삭제하기",
              // selectionColor: Color(0xffff0000),
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffff0000)),
            ),
          ),
        ],
      ),
    );
  }
}
