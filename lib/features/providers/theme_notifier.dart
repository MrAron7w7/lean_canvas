import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_notifier.g.dart';

@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  static const _isDarkMode = 'isDarkMode';
  @override
  bool build() => GetStorage().read(_isDarkMode) ?? false;

  void toggleTheme() {
    state = !state;
    GetStorage().write(_isDarkMode, state);
  }
}
