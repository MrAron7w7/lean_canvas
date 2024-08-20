import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '/core/utils/utils.dart';
import '/features/models/presentation.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: Presentation.getPresentations().length,
          itemBuilder: (context, index) {
            final presentation = Presentation.getPresentations()[index];
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
                        onPressed: () => context.go('/${HomeView.name}'),
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
                        onPressed: () {},
                        sizeText: 15,
                        text: 'Siguiente',
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
