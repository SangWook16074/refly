import 'dart:ui';

import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String content;
  final Function() onConfirm;
  final String confirmLabel;
  final String cancelLabel;
  const CustomDialog(
      {super.key,
      required this.content,
      required this.onConfirm,
      this.confirmLabel = "확인",
      this.cancelLabel = "취소"});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: Dialog(
        elevation: 0.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                content,
                style: const TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              height: 1.0,
              thickness: 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: onConfirm,
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        decoration: const BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    width: 0.5, color: Color(0xffefefef))),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0))),
                        alignment: Alignment.center,
                        child: Text(
                          confirmLabel,
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        decoration: const BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    width: 0.5, color: Color(0xffefefef))),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12.0))),
                        alignment: Alignment.center,
                        child: Text(
                          cancelLabel,
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 15,
                            color: Color(0xffff0000),
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
