import 'package:lean_canvas_project/core/constants/app_assets.dart';

class CanvasData {
  final String image;
  final String title;

  CanvasData({required this.image, required this.title});

  static List<CanvasData> canvasData = [
    CanvasData(
      image: AppAssets.queEs,
      title: '¿Qué es?',
    ),
    CanvasData(
      image: AppAssets.pilares,
      title: 'Pilares',
    ),
    CanvasData(
      image: AppAssets.libros,
      title: 'Libros',
    ),
  ];
}
