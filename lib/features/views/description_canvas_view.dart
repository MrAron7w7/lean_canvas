import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lean_canvas_project/core/utils/utils.dart';
import 'package:lean_canvas_project/features/providers/description_canvas_provider.dart';
import 'package:lean_canvas_project/shared/components/components.dart';

class DescriptionCanvasView extends ConsumerWidget {
  const DescriptionCanvasView({super.key});
  static const name = 'description_view';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final descriptionData = ref.watch(descriptionStateProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomLabel(
          text: descriptionData.namePilar ?? 'Descripción',
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLabel(
              text: descriptionData.description ?? 'No description provided.',
            ),
            const SizedBox(height: 16),
            CustomLabel(
              text: descriptionData.tips ?? 'No tips provided.',
            ),
            spacingGap(40),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('${descriptionData.imagePilar}')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
