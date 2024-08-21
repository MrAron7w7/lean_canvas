import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lean_canvas_project/features/models/guide_lean_canvas.dart';

final descriptionStateProvider = StateProvider<GuideLeanCanvas>((ref) {
  return GuideLeanCanvas(
    name: '',
    description: '',
    tips: '',
    imagePilar: '',
  );
});
