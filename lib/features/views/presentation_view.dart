import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lean_canvas_project/features/data/datas.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/utils/utils.dart';
import '/features/views/views.dart';
import '/shared/components/components.dart';

class PresentationView extends ConsumerStatefulWidget {
  const PresentationView({super.key});
  static const name = '/';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PresentationViewState();
}

class _PresentationViewState extends ConsumerState<PresentationView> {
  late PageController _pageController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    WidgetsBinding.instance.addPostFrameCallback((_) => _checkFirstView());
  }

  // Verificar si se ha visto por primera vez y si no pasa directo al home
  Future<void> _checkFirstView() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = prefs.getBool('seen') ?? false;
    if (seen) {
      // Navega a HomeView si ya se ha visto la presentación
      context.go('/${HomeView.name}');
    } else {
      // Marca como visto si es la primera vez
      await prefs.setBool('seen', true);
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onItemTapped(int index) {
    if (index < getPresentations.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/${HomeView.name}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final presentations = getPresentations;
    if (_isLoading) {
      // Mostrar una pantalla de carga mientras se realiza la verificación
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: presentations.length,
          itemBuilder: (context, index) {
            final presentation = presentations[index];
            return Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400,
                    height: 400,
                    child: Image.asset('${presentation.image}'),
                  ),
                  CustomLabel(
                    textAlign: TextAlign.center,
                    text: '${presentation.title}',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  spacingGap(20),
                  CustomLabel(
                    textAlign: TextAlign.center,
                    text: '${presentation.description}',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  spacingGap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool('seen', true);
                          context.go('/${HomeView.name}');
                        },
                        style: TextButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.tertiary,
                        ),
                        child: const CustomLabel(
                          text: 'Skip',
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      CustomElevatedButton(
                        onPressed: () => _onItemTapped(index),
                        sizeText: 15,
                        text: index == getPresentations.length - 1
                            ? 'Comenzar'
                            : 'Siguiente',
                        sizeWidth: 30,
                        sizeHeight: 50,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
