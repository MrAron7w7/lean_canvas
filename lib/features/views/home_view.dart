import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lean_canvas_project/features/models/canvas_data.dart';
import 'package:lean_canvas_project/features/providers/theme_notifier.dart';
import 'package:uicons/uicons.dart';

import '/core/utils/utils.dart';
import '/features/views/views.dart';
import '/shared/components/components.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  static const name = 'home_view';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomLabel(text: 'B I E N V E N I D O'),
      ),
      drawer: _buidlDrawer(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 2.0),

                spacingGap(30),

                // Cards
                GridView.builder(
                  itemCount: CanvasData.canvasData.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (context, index) {
                    final canvas = CanvasData.canvasData[index];
                    return CustomCard(
                      image: canvas.image,
                      text: canvas.title,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      onTap: () {},
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Drawer _buidlDrawer(BuildContext context) {
    final isDarkMode = ref.watch(themeNotifierProvider);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DrawerHeader(
              child: CustomIcon(
                iconType: UIcons.boldRounded.comment_info,
                sizeIcon: 70,
              ),
            ),
            spacingGap(40),
            CustomListTile(
              onTap: () => context.pop(),
              title: 'Inicio',
              leading: Icon(UIcons.solidRounded.home),
            ),
            CustomListTile(
              onTap: () => context.push('/${CreateView.name}'),
              title: 'Crear',
              leading: Icon(UIcons.solidRounded.credit_card),
            ),
            const Spacer(),
            CustomSwitchListTitle(
              text: 'Modo oscuro',
              value: isDarkMode,
              onChanged: (value) =>
                  ref.read(themeNotifierProvider.notifier).toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }
}
