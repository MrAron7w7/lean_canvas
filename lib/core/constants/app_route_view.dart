import 'dart:convert';

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
      GoRoute(
        path: '/${AddView.name}',
        builder: (context, state) => const AddView(),
      ),
      GoRoute(
        path: '/${EditView.name}/:item',
        builder: (context, state) {
          String jsonString = state.pathParameters['item']!;
          Map<String, String> item =
              Map<String, String>.from(jsonDecode(jsonString));
          return EditView(item: item);
        },
      ),
      GoRoute(
        path: '/${LeanView.name}',
        builder: (context, state) => const LeanView(),
      ),
      GoRoute(
        path: '/${DetailView.name}/:item/:index',
        builder: (context, state) {
          final jsonString = state.pathParameters['item']!;
          final Map<String, String> item =
              Map<String, String>.from(jsonDecode(jsonString));

          final index = int.parse(state.pathParameters['index']!);
          return DetailView(item: item, index: index);
        },
      ),
      GoRoute(
        path: '/${PdfPreviewView.name}/:filePath',
        builder: (context, state) {
          final filePath = state.pathParameters['filePath']!;
          return PdfPreviewView(filePath: filePath);
        },
      ),
      GoRoute(
        path: '/${DescriptionCanvasView.name}',
        builder: (context, state) => const DescriptionCanvasView(),
      ),
    ],
  );
}
