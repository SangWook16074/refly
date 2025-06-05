import 'package:go_router/go_router.dart';
import 'package:solution_diary_app/src/core/ui/views/root.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => const Root()),
  ],
);
