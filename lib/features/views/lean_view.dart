import 'package:flutter/material.dart';
import 'package:lean_canvas_project/core/utils/utils.dart';
import 'package:lean_canvas_project/shared/components/components.dart';

class LeanView extends StatefulWidget {
  final Map<String, String> initialData;

  const LeanView({super.key, this.initialData = const {}});

  @override
  _LeanViewState createState() => _LeanViewState();
}

class _LeanViewState extends State<LeanView> {
  final _formKey = GlobalKey<FormState>();

  // Creo una variable en la cual sera un mapeo de tipo string y textfieldEditinController
  final Map<String, TextEditingController> _controllers = {};

  // Me creo la lista en la cual estaran los nombres de los textfield
  final List<String> _fields = [
    'Propuesta Única de Valor',
    'Segmento de Clientes',
    'Problema',
    'Solución',
    'Canales',
    'Flujos de Ingreso',
    'Estructura de Costes',
    'Métricas Clave',
    'Ventaja Diferencial',
  ];

  // Al iniciar el widget junto los espaciados de los textos para que estean juntos
  // ademas los pongo en minusculas
  @override
  void initState() {
    super.initState();
    for (var field in _fields) {
      _controllers[field] = TextEditingController(
        text: widget.initialData[field.toLowerCase().replaceAll(' ', '')] ?? '',
      );
    }
  }

  // Se ha creado un metodo en la cual valida si se cumple la validacion puesta
  //
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final leanCanvasData = {
        for (var field in _fields)
          field.toLowerCase().replaceAll(' ', ''): _controllers[field]!.text,
      };

      Navigator.pop(context, leanCanvasData);
    }
  }

  // Se llama el metodo dispone cuando el widget ya no se consume (Se elinina los datos
  // de los textfield)
  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const CustomLabel(text: 'Pilares Lean Canvas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView.builder(
              itemCount: _fields.length,
              itemBuilder: (context, index) {
                final field = _fields[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: _buildTextField(label: field),
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: _saveForm,
          child: const CustomIcon(
            iconType: Icons.done_all,
            colorIcon: Colors.white,
            sizeIcon: 30,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(
          text: label,
          fontSize: 16,
        ),
        spacingGap(10),
        CustomTextformfiel(
          controller: _controllers[label]!,
          maxLines: 2,
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }
}
