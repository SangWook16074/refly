import 'package:flutter/material.dart';
import 'package:solution_diary_app/src/core/ui/widgets/icon_image_widget.dart';

/// 사용자가 등록한 문제를 보여주는 ROW
class ProblemListRow extends StatelessWidget {
  final String? title;
  final Widget? trailing;
  final bool isFavorite;
  final void Function()? onTrailing;
  final void Function()? onPrefix;
  const ProblemListRow(
      {super.key,
      this.title,
      this.trailing,
      required this.isFavorite,
      this.onTrailing,
      this.onPrefix})
      : assert(trailing != null || !(onTrailing != null),
            "trailing 위젯을 반드시 전달해야 onTrailing을 전달할 수 있습니다.");

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: const Color(0xff000000).withOpacity(.04))
            ]),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onPrefix,
                child: SizedBox(
                    width: 18,
                    child: IconImageWidget(
                        path: isFavorite
                            ? ImagePath.favoriteOn
                            : ImagePath.favoriteOff)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    child: Text(
                      title ?? "",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(onTap: onTrailing, child: trailing ?? Container())
            ],
          )
        ]));
  }
}
