import 'package:flutter/material.dart';
import 'package:lean_canvas_project/core/constants/app_assets.dart';
import 'package:lean_canvas_project/core/utils/utils.dart';
import 'package:lean_canvas_project/shared/components/components.dart';

import 'edit_view.dart';

class DetailView extends StatelessWidget {
  final Map<String, String> item;
  final int index;

  const DetailView({
    super.key,
    required this.item,
    required this.index,
  });

  static const name = 'detail_view';

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: const CustomLabel(text: 'Eliminar Proyecto'),
          content: const CustomLabel(
              text: '¿Estás seguro de que deseas eliminar este proyecto?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop({'delete': 'false'}),
              child: CustomLabel(
                text: 'Cancelar',
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop({'delete': 'true'}),
              child: CustomLabel(
                text: 'Eliminar',
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        );
      },
    );

    if (result != null && result['delete'] == 'true') {
      Navigator.pop(context, {'delete': 'true'});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomLabel(
          text: ' ${item['nombreProyecto'] ?? ''}',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          PopupMenuButton<String>(
            iconColor: Theme.of(context).colorScheme.secondary,
            onSelected: (String value) async {
              if (value == 'Eliminar') {
                await _showDeleteConfirmationDialog(context);
              } else if (value == 'Generar PDF') {
                await PDFGenerator.generatePDF(context, item);
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'Generar PDF',
                  child: ListTile(
                    leading:
                        Icon(Icons.picture_as_pdf, color: Color(0xFF1B264F)),
                    title: Text(
                      'Generar PDF',
                      style: TextStyle(
                        color: Color(0xFF274690),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Eliminar',
                  child: ListTile(
                    leading: Icon(Icons.delete, color: Color(0xFF1B264F)),
                    title: Text(
                      'Eliminar',
                      style: TextStyle(
                        color: Color(0xFF274690),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ];
            },
            icon: CustomIcon(
              iconType: Icons.more_vert,
              colorIcon: Theme.of(context).colorScheme.secondary,
              sizeIcon: 30,
            ),
            color: Colors.white,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildDetailSection(context, 'Empresa', item['empresa']),
              _buildDetailSection(context, 'Descripción', item['descripcion']),
              _buildDetailSection(context, 'Nota', item['nota']),
              const SizedBox(height: 20),
              CustomLabel(
                text: 'Lean Canvas',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 40),
              Image.asset(
                AppAssets.modeloLeanCanvas,
                height: 250,
              ),
              const SizedBox(height: 40),
              _buildCanvasDetailSection(
                context,
                'Propuesta Única de Valor',
                item['propuestaValor'],
              ),
              _buildCanvasDetailSection(
                context,
                'Segmento de Clientes',
                item['segmentoClientes'],
              ),
              _buildCanvasDetailSection(
                context,
                'Problema',
                item['problema'],
              ),
              _buildCanvasDetailSection(
                context,
                'Solución',
                item['solucion'],
              ),
              _buildCanvasDetailSection(
                context,
                'Canales',
                item['canales'],
              ),
              _buildCanvasDetailSection(
                context,
                'Flujos de Ingreso',
                item['flujosIngreso'],
              ),
              _buildCanvasDetailSection(
                context,
                'Estructura de Costes',
                item['estructuraCostes'],
              ),
              _buildCanvasDetailSection(
                context,
                'Métricas Clave',
                item['metricasClave'],
              ),
              _buildCanvasDetailSection(
                context,
                'Ventaja Diferencial',
                item['ventajaDiferencial'],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () async {
          final result = await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(builder: (context) => EditView(item: item)),
          );
          if (result != null) {
            Navigator.pop(context, result);
          }
        },
        child: const Icon(Icons.edit, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildDetailSection(
    BuildContext context,
    String title,
    String? value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomLabel(
            text: '$title:',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
          ),
          CustomLabel(
            text: value ?? '',
            fontSize: 16,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildCanvasDetailSection(
    BuildContext context,
    String title,
    String? value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomLabel(
            text: '$title:',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 8),
          CustomLabel(
            text: value ?? '',
            fontSize: 15,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
