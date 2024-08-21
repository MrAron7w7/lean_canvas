import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/constants/app_assets.dart';
import '/core/utils/utils.dart';
import '/features/views/views.dart';
import '/shared/components/components.dart';

class CreateView extends ConsumerStatefulWidget {
  const CreateView({super.key});

  static const name = 'create_view';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateViewState();
}

class _CreateViewState extends ConsumerState<CreateView> {
  List<Map<String, String>> items = [];

  @override
  void initState() {
    _loadItems();
    super.initState();
  }

  // Cargar los items desde SharedPreferences
  Future<void> _loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final String? itemsString = prefs.getString('items');
    if (itemsString != null) {
      final List<dynamic> decodedItems = json.decode(itemsString);
      setState(() {
        items =
            decodedItems.map((item) => Map<String, String>.from(item)).toList();
      });
    }
  }

  // Guardar los items en SharedPreferences
  Future<void> _saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('items', json.encode(items));
  }

  // Añadir un nuevo item
  void _addItem(Map<String, String> newItem) {
    setState(() {
      items.add(newItem);
    });
    _saveItems();
  }

  // Actualizar un item
  void _updateItem(int index, Map<String, String> updatedItem) {
    setState(() {
      items[index] = updatedItem;
    });
    _saveItems();
  }

  // Eliminar un item
  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
    _saveItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomLabel(
          text: 'Lean Canvas',
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomLabel(
              text: 'PROYECTOS',
              color: Theme.of(context).colorScheme.primary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            //

            spacingGap(10),

            //
            const CustomLabel(
              text: 'Visualiza tu modelo de negocio',
              fontSize: 16,
            ),
            //

            spacingGap(30),

            //
            Image.asset(
              AppAssets.modeloLeanCanvas,
              height: 250,
            ),
            //

            spacingGap(20),

            //
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 80,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.white,
                            Color.fromARGB(255, 217, 238, 255)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFF274690),
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: ListTile(
                          title: CustomLabel(
                            text: items[index]['nombreProyecto'] ?? '',
                            color: const Color(0xFF302B27),
                            fontWeight: FontWeight.bold,
                          ),
                          onTap: () async {
                            final jsonString = jsonEncode(items[index]);
                            final result =
                                await context.push<Map<String, String>>(
                              '/${DetailView.name}/$jsonString/$index',
                            );
                            if (result != null) {
                              if (result.containsKey('delete') &&
                                  result['delete'] == 'true') {
                                _deleteItem(index);
                              } else {
                                _updateItem(index, result);
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () async {
          final result =
              await context.push<Map<String, String>>('/${AddView.name}');

          if (result != null) {
            _addItem(result);
          }
        },
        child: const Icon(
          Icons.add_circle_outline,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
