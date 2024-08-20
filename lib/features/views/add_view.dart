import 'package:flutter/material.dart';
import 'package:lean_canvas_project/core/utils/utils.dart';
import 'package:lean_canvas_project/features/views/views.dart';
import 'package:lean_canvas_project/shared/components/components.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  final _formKey = GlobalKey<FormState>();

  final _nombreProyectoController = TextEditingController();
  final _empresaController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _notaController = TextEditingController();

  void _goToLeanCanvasForm() async {
    if (_formKey.currentState!.validate()) {
      final leanCanvasData = await Navigator.push<Map<String, String>>(
        context,
        MaterialPageRoute(
          builder: (context) => const LeanView(),
        ),
      );

      if (leanCanvasData != null) {
        final newItem = {
          'nombreProyecto': _nombreProyectoController.text,
          'empresa': _empresaController.text,
          'descripcion': _descripcionController.text,
          'nota': _notaController.text,
          ...leanCanvasData,
        };

        Navigator.pop(context, newItem);

        _nombreProyectoController.clear();
        _empresaController.clear();
        _descripcionController.clear();
        _notaController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const CustomLabel(
            text: 'Nuevo Proyecto',
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
                  CustomTextformfiel(
                    keyboardType: TextInputType.text,
                    controller: _nombreProyectoController,
                    labelText: 'Nombre del Proyecto',
                    icon: const Icon(Icons.title),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa el nombre del proyecto';
                      }
                      return null;
                    },
                  ),
                  //
                  spacingGap(10),
                  //
                  CustomTextformfiel(
                    keyboardType: TextInputType.text,
                    labelText: 'Empresa',
                    controller: _empresaController,
                    icon: const Icon(Icons.factory),
                  ),
                  //
                  spacingGap(10),
                  //
                  CustomTextformfiel(
                    keyboardType: TextInputType.text,
                    controller: _descripcionController,
                    labelText: 'Descripción',
                    icon: const Icon(Icons.description),
                  ),
                  //
                  spacingGap(10),
                  //
                  CustomTextformfiel(
                    keyboardType: TextInputType.text,
                    controller: _notaController,
                    labelText: 'Nota',
                    icon: const Icon(Icons.note),
                  ),
                  const SizedBox(height: 20),
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
}
