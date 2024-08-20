import 'package:flutter/material.dart';
import 'package:lean_canvas_project/core/constants/app_assets.dart';
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

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eliminar Proyecto'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('¿Estás seguro de que deseas eliminar este proyecto?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Color(0xFF1B264F)),
              ),
              onPressed: () {
                Navigator.of(context).pop({'delete': 'false'});
              },
            ),
            TextButton(
              child: const Text(
                'Eliminar',
                style: TextStyle(color: Color(0xFF1B264F)),
              ),
              onPressed: () {
                Navigator.of(context).pop({'delete': 'true'});
              },
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
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color;

    return Scaffold(
      appBar: AppBar(
        title: CustomLabel(
          text: ' ${item['nombreProyecto'] ?? ''}',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            icon: const CustomIcon(
              iconType: Icons.delete,
              sizeIcon: 30,
            ),
            onPressed: () {
              _showDeleteConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomLabel(
                        text: 'Empresa:',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B264F),
                      ),
                      Text(
                        ' ${item['empresa'] ?? ''}',
                        style: TextStyle(fontSize: 16, color: textColor),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const Text(
                        'Descripción: ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B264F)),
                      ),
                      Text(
                        ' ${item['descripcion'] ?? ''}',
                        style: TextStyle(fontSize: 16, color: textColor),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const Text(
                        'Nota: ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B264F)),
                      ),
                      Text(
                        ' ${item['nota'] ?? ''}',
                        style: TextStyle(fontSize: 16, color: textColor),
                      ),
                    ]),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              const Text('Lean Canvas',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B264F))),
              const SizedBox(height: 40),
              Image.asset(
                AppAssets.modeloLeanCanvas,
                height: 250,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: Container(
                  color: theme.cardColor,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Divider(),
                      const Text(
                        'Propuesta Única de Valor:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B264F),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item['propuestaValor'] ?? '',
                        style: TextStyle(
                          fontSize: 15,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const Text('Segmento de Clientes: ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B264F))),
                      const SizedBox(height: 8),
                      Text(' ${item['segmentoClientes'] ?? ''}',
                          style: TextStyle(fontSize: 15, color: textColor)),
                      const SizedBox(height: 20),
                      const Divider(),
                      const Text('Problema: ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B264F))),
                      const SizedBox(height: 8),
                      Text(' ${item['problema'] ?? ''}',
                          style: TextStyle(fontSize: 15, color: textColor)),
                      const SizedBox(height: 20),
                      const Divider(),
                      const Text('Solución: ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B264F))),
                      const SizedBox(height: 8),
                      Text(' ${item['solucion'] ?? ''}',
                          style: TextStyle(fontSize: 15, color: textColor)),
                      const SizedBox(height: 20),
                      const Divider(),
                      const Text('Canales: ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B264F))),
                      const SizedBox(height: 8),
                      Text(' ${item['canales'] ?? ''}',
                          style: TextStyle(fontSize: 15, color: textColor)),
                      const SizedBox(height: 20),
                      const Divider(),
                      const Text('Flujos de Ingreso: ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B264F))),
                      const SizedBox(height: 8),
                      Text(' ${item['flujosIngreso'] ?? ''}',
                          style: TextStyle(fontSize: 15, color: textColor)),
                      const SizedBox(height: 20),
                      const Divider(),
                      const Text('Estructura de Costes: ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B264F))),
                      const SizedBox(height: 8),
                      Text(' ${item['estructuraCostes'] ?? ''}',
                          style: TextStyle(fontSize: 15, color: textColor)),
                      const SizedBox(height: 20),
                      const Divider(),
                      const Text('Métricas Clave: ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B264F))),
                      const SizedBox(height: 8),
                      Text(' ${item['metricasClave'] ?? ''}',
                          style: TextStyle(fontSize: 15, color: textColor)),
                      const SizedBox(height: 20),
                      const Divider(),
                      const Text('Ventaja Diferencial: ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B264F))),
                      const SizedBox(height: 8),
                      Text(' ${item['ventajaDiferencial'] ?? ''}',
                          style: TextStyle(fontSize: 15, color: textColor)),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: const Color(0xFF1B264F),
        onPressed: () async {
          final result = await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(
              builder: (context) => EditView(item: item),
            ),
          );

          if (result != null) {
            Navigator.pop(context, result);
          }
        },
        child: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
