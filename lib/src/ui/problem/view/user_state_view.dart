// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:solution_diary_app/src/ui/problem/viewModel/problem_view_model.dart';
// import 'package:solution_diary_app/src/ui/widgets/progress_widget.dart';
// import 'package:solution_diary_app/src/ui/widgets/state_detail_widget.dart';

// class UserStateView extends ConsumerWidget {
//   final double height;
//   const UserStateView({super.key, required this.height});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final asyncState = ref.watch(problemViewModelProvider);
//     return Container(
//       padding: const EdgeInsets.all(18.0),
//       decoration: BoxDecoration(
//           color: const Color(0xffffffff).withOpacity(.15),
//           borderRadius: BorderRadius.circular(12.0)),
//       alignment: Alignment.center,
//       child: asyncState.when(
//           loading: () => const CircularProgressIndicator.adaptive(),
//           error: (error, stackTrace) => const Text(
//                 "에러가 발생했습니다!",
//                 style: TextStyle(
//                   fontFamily: "Roboto",
//                   color: Color(0xffffffff),
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//           data: (data) {
//             final totalCount = data.length;
//             final completedCount =
//                 data.where((it) => it.isDone).toList().length;
//             final unresolvedCount = totalCount - completedCount;

//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                           child: StateDetailWidget(
//                               label: "전체", count: totalCount)),
//                       const SizedBox(
//                         width: 16.0,
//                       ),
//                       Expanded(
//                           child: StateDetailWidget(
//                               label: "완료", count: completedCount)),
//                       const SizedBox(
//                         width: 16.0,
//                       ),
//                       Expanded(
//                           child: StateDetailWidget(
//                               label: "진행중", count: unresolvedCount)),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: ProgressWidget(
//                     total: totalCount,
//                     current: completedCount,
//                     height: height / 3,
//                   ),
//                 ),
//               ],
//             );
//           }),
//     );
//   }
// }
