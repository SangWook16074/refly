import 'package:go_router/go_router.dart';
import 'package:solution_diary_app/src/feature/root/ui/views/root.dart';
import 'package:solution_diary_app/src/feature/main/ui/views/main_ui.dart';
import 'package:solution_diary_app/src/feature/profile/ui/views/user_ui.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => const Root(), routes: [
      GoRoute(path: "/user", builder: (context, state) => const UserUI())
    ]),
  ],
);
