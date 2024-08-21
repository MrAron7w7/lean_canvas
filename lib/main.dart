import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

import '/core/constants/app_route_view.dart';
import '/features/providers/theme_notifier.dart';
import '/shared/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRoute = ref.watch(appRouterProvider);
    final isDarkMode = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Lean Canvas',
      debugShowCheckedModeBanner: false,
      routerConfig: appRoute,
      theme: isDarkMode ? AppTheme.darkMode : AppTheme.lightMode,
    );
  }
}
