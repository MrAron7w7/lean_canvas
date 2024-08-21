import 'package:flutter/material.dart';
import 'package:lean_canvas_project/core/utils/utils.dart';
import 'package:lean_canvas_project/shared/components/components.dart';

class LeanView extends StatefulWidget {
  final Map<String, String> initialData;

  const LeanView({super.key, this.initialData = const {}});
  static const name = 'lean_view';

  @override
  _LeanViewState createState() => _LeanViewState();
}

class _LeanViewState extends State<LeanView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _propuestaValorController;
  late TextEditingController _segmentoClientesController;
  late TextEditingController _problemaController;
  late TextEditingController _solucionController;
  late TextEditingController _canalesController;
  late TextEditingController _flujosIngresoController;
  late TextEditingController _estructuraCostesController;
  late TextEditingController _metricasClaveController;
  late TextEditingController _ventajaDiferencialController;

  @override
  void initState() {
    super.initState();
    _propuestaValorController =
        TextEditingController(text: widget.initialData['propuestaValor'] ?? '');
    _segmentoClientesController = TextEditingController(
        text: widget.initialData['segmentoClientes'] ?? '');
    _problemaController =
        TextEditingController(text: widget.initialData['problema'] ?? '');
    _solucionController =
        TextEditingController(text: widget.initialData['solucion'] ?? '');
    _canalesController =
        TextEditingController(text: widget.initialData['canales'] ?? '');
    _flujosIngresoController =
        TextEditingController(text: widget.initialData['flujosIngreso'] ?? '');
    _estructuraCostesController = TextEditingController(
        text: widget.initialData['estructuraCostes'] ?? '');
    _metricasClaveController =
        TextEditingController(text: widget.initialData['metricasClave'] ?? '');
    _ventajaDiferencialController = TextEditingController(
        text: widget.initialData['ventajaDiferencial'] ?? '');
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final leanCanvasData = {
        'propuestaValor': _propuestaValorController.text,
        'segmentoClientes': _segmentoClientesController.text,
        'problema': _problemaController.text,
        'solucion': _solucionController.text,
        'canales': _canalesController.text,
        'flujosIngreso': _flujosIngresoController.text,
        'estructuraCostes': _estructuraCostesController.text,
        'metricasClave': _metricasClaveController.text,
        'ventajaDiferencial': _ventajaDiferencialController.text,
      };

      Navigator.pop(context, leanCanvasData);
    }
  }

  @override
  void dispose() {
    _propuestaValorController.dispose();
    _segmentoClientesController.dispose();
    _problemaController.dispose();
    _solucionController.dispose();
    _canalesController.dispose();
    _flujosIngresoController.dispose();
    _estructuraCostesController.dispose();
    _metricasClaveController.dispose();
    _ventajaDiferencialController.dispose();
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
            text: 'Pilares Lean Canvas',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomLabel(
                    text: 'Propuesta Única de Valor',
                    fontSize: 16,
                  ),
                  //
                  spacingGap(10),
                  //
                  CustomTextformfiel(
                    maxLines: 2,
                    controller: _propuestaValorController,
                    keyboardType: TextInputType.multiline,
                  ),
                  //
                  spacingGap(10),
                  //
                  const CustomLabel(
                    text: 'Segmento de Clientes',
                    fontSize: 16,
                  ),
                  //
                  spacingGap(10),
                  //
                  CustomTextformfiel(
                    controller: _segmentoClientesController,
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                  ),
                  //
                  spacingGap(10),
                  //
                  const CustomLabel(
                    text: 'Problema',
                    fontSize: 16,
                  ),
                  //
                  spacingGap(10),
                  //
                  CustomTextformfiel(
                    controller: _problemaController,
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                  ),
                  //
                  spacingGap(10),
                  //
                  const CustomLabel(
                    text: 'Solución',
                    fontSize: 16,
                  ),
                  //
                  spacingGap(10),
                  //
                  CustomTextformfiel(
                    controller: _solucionController,
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                  ),
                  //
                  spacingGap(10),
                  //
                  const CustomLabel(
                    text: 'Canales',
                    fontSize: 16,
                  ),
                  //
                  spacingGap(10),
                  //
                  CustomTextformfiel(
                    controller: _canalesController,
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                  ),
                  //
                  spacingGap(10),
                  //
                  const CustomLabel(
                    text: 'Flujos de Ingreso',
                    fontSize: 16,
                  ),
                  //
                  spacingGap(10),
                  //
                  CustomTextformfiel(
                    controller: _flujosIngresoController,
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                  ),
                  //
                  spacingGap(10),
                  //
                  const CustomLabel(
                    text: 'Estructura de Costes',
                    fontSize: 16,
                  ),
                  //
                  spacingGap(10),
                  //
                  CustomTextformfiel(
                    controller: _estructuraCostesController,
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                  ),
                  //
                  spacingGap(10),
                  //
                  const CustomLabel(
                    text: 'Métricas Clave',
                    fontSize: 16,
                  ),
                  //
                  spacingGap(10),
                  //
                  CustomTextformfiel(
                    controller: _metricasClaveController,
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                  ),
                  //
                  spacingGap(10),
                  //
                  const CustomLabel(
                    text: 'Ventaja Diferencial',
                    fontSize: 16,
                  ),
                  //
                  spacingGap(10),
                  //
                  CustomTextformfiel(
                    controller: _ventajaDiferencialController,
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
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
}
