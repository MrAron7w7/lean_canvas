import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lean_canvas_project/core/utils/utils.dart';
import 'package:lean_canvas_project/shared/components/components.dart';

import 'lean_view.dart';

class EditView extends StatefulWidget {
  final Map<String, String> item;

  const EditView({super.key, required this.item});

  static const name = 'edit_view';

  @override
  _EditViewState createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nombreProyectoController;
  late TextEditingController _empresaController;
  late TextEditingController _descripcionController;
  late TextEditingController _notaController;

  @override
  void initState() {
    super.initState();
    _nombreProyectoController =
        TextEditingController(text: widget.item['nombreProyecto']);
    _empresaController = TextEditingController(text: widget.item['empresa']);
    _descripcionController =
        TextEditingController(text: widget.item['descripcion']);
    _notaController = TextEditingController(text: widget.item['nota']);
  }

  void _goToLeanCanvasForm() async {
    if (_formKey.currentState!.validate()) {
      final leanCanvasData =
          await context.push<Map<String, String>>('/${LeanView.name}');

      if (leanCanvasData != null) {
        final updatedItem = {
          'nombreProyecto': _nombreProyectoController.text,
          'empresa': _empresaController.text,
          'descripcion': _descripcionController.text,
          'nota': _notaController.text,
          ...leanCanvasData,
        };

        //context.pop(updatedItem);
        Navigator.pop(context, updatedItem);

        // _nombreProyectoController.clear();
        // _empresaController.clear();
        // _descripcionController.clear();
        // _notaController.clear();
      }
    }
  }

  @override
  void dispose() {
    _nombreProyectoController.dispose();
    _empresaController.dispose();
    _descripcionController.dispose();
    _notaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const CustomLabel(
            text: 'Editar Proyecto',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomLabel(
                    text: 'Nombre del Proyecto',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  spacingGap(15),
                  CustomTextformfiel(
                    controller: _nombreProyectoController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa el nombre del proyecto';
                      }
                      return null;
                    },
                  ),
                  spacingGap(15),
                  _buildEditSection(
                    text: 'Empresa',
                    controller: _empresaController,
                  ),
                  spacingGap(15),
                  const SizedBox(height: 10),
                  _buildEditSection(
                    text: 'Descripción',
                    controller: _descripcionController,
                  ),
                  spacingGap(15),
                  _buildEditSection(
                    text: 'Nota',
                    controller: _notaController,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: _goToLeanCanvasForm,
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget _buildEditSection({
    required String text,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(
          text: text,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        spacingGap(10),
        CustomTextformfiel(
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: 2,
        ),
      ],
    );
  }
}
