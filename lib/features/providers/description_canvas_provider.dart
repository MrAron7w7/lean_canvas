import 'package:flutter_riverpod/flutter_riverpod.dart';

final descriptionStateProvider =
    StateProvider<DescriptionCanvasViewData>((ref) {
  return DescriptionCanvasViewData(
    namePilar: '',
    description: '',
    tips: '',
    imagePilar: '',
  );
});

class DescriptionCanvasViewData {
  final String? namePilar;
  final String? description;
  final String? tips;
  final String? imagePilar;

  DescriptionCanvasViewData({
    this.namePilar,
    this.description,
    this.tips,
    this.imagePilar,
  });
}
