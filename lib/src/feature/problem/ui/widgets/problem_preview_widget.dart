import 'package:flutter/material.dart';

class ProblemPreviewWidget extends StatelessWidget {
  final String? title;
  final String? content;
  final Widget? trailing;
  final void Function()? onTrailing;
  const ProblemPreviewWidget(
      {super.key, this.title, this.content, this.trailing, this.onTrailing})
      : assert(trailing != null || !(onTrailing != null),
            "trailing 위젯을 반드시 전달해야 onTrailing을 전달할 수 있습니다.");

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: const Color(0xfffffffff),
                borderRadius: BorderRadius.circular(12.0)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title ?? "",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                    ),
                    trailing ?? Container()
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 1.0,
                        decoration: const BoxDecoration(
                          color: Color(0xffdbdbdb),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        content != null ? content! : "등록된 상세내용이 없습니다.",
                        style: TextStyle(
                          fontSize: 13,
                          color: content != null
                              ? const Color(0xff000000)
                              : const Color(0xffafafaf),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
