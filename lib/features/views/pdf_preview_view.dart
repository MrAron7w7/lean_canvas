import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:go_router/go_router.dart';
import 'package:lean_canvas_project/features/views/views.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfPreviewView extends StatelessWidget {
  final String filePath;

  const PdfPreviewView({super.key, required this.filePath});

  static const name = 'pdf_preview_view';

  Future<void> _saveToDownloads(BuildContext context) async {
    try {
      await _requestPermissions();

      final String downloadsPath =
          await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS,
      );
      final String fileName = filePath.split('/').last;
      final File newFile = File('$downloadsPath/$fileName');

      await File(filePath).copy(newFile.path);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PDF guardado en Descargas')),
      );

      context.pushReplacement('/${CreateView.name}');

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => CreatePage()),
      // );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar el PDF: $e')),
      );
    }
  }

  Future<void> _requestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      return;
    } else if (await Permission.manageExternalStorage.request().isGranted) {
      return;
    } else {
      throw 'Permiso de almacenamiento no concedido';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PDF',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1B264F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: PDFView(
          filePath: filePath,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: const Color(0xFF1B264F),
        onPressed: () => _saveToDownloads(context),
        child: const Icon(
          Icons.save_alt,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
