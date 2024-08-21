import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lean_canvas_project/features/data/datas.dart';
import 'package:lean_canvas_project/features/models/guide_lean_canvas.dart';
import 'package:uicons/uicons.dart';

import '/core/utils/utils.dart';
import '/features/providers/description_canvas_provider.dart';
import '/features/providers/theme_notifier.dart';
import '/features/views/views.dart';
import '/shared/components/components.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  static const name = 'home_view';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomLabel(
          text: 'B I E N V E N I D O',
        ),
      ),
      drawer: _buildDrawer(context, ref),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomLabel(
              text: 'Guia paso a paso',
              fontSize: 20,
            ),
            spacingGap(20),
            Expanded(
              child: GridView.builder(
                itemCount: getGuideLeanCanvas.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final guideLean = getGuideLeanCanvas[index];
                  return CustomCard(
                    onTap: () {
                      ref.read(descriptionStateProvider.notifier).update(
                            (state) => GuideLeanCanvas(
                              name: guideLean.name,
                              description: guideLean.description,
                              tips: guideLean.tips,
                              imagePilar: guideLean.imagePilar,
                            ),
                          );

                      context.push(
                        '/${DescriptionCanvasView.name}',
                      );
                    },
                    image: guideLean.imagen!,
                    text: guideLean.name!,
                    fontSize: 12,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context, WidgetRef ref) {
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
              fontWeight: FontWeight.w600,
              leading: const CustomIcon(
                iconType: Icons.home,
                sizeIcon: 25,
              ),
            ),
            CustomListTile(
              onTap: () => context.push('/${CreateView.name}'),
              title: 'Crear',
              fontWeight: FontWeight.w600,
              leading: const CustomIcon(
                sizeIcon: 25,
                iconType: Icons.edit_square,
              ),
            ),
            const Spacer(),
            CustomSwitchListTitle(
              text: 'Modo oscuro',
              fontWeight: FontWeight.w600,
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
