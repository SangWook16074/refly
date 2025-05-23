import 'package:go_router/go_router.dart';
import 'package:solution_diary_app/src/root.dart';
import 'package:solution_diary_app/src/ui/view/main_ui.dart';
import 'package:solution_diary_app/src/ui/view/user_ui.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => const MainUI(), routes: [
      GoRoute(path: "/user", builder: (context, state) => const UserUI())
    ]),
  ],
);
