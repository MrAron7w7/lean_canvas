import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/features/views/views.dart';

part 'app_route_view.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: PresentationView.name,
        builder: (context, state) => const PresentationView(),
      ),
      GoRoute(
        path: '/${HomeView.name}',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/${CreateView.name}',
        builder: (context, state) => const CreateView(),
      ),
    ],
  );
}
