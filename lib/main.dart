import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treatment_buddy/routes/app_router.dart';

void main() {
  runApp(ProviderScope(child: TreatmentApp()));
}

class TreatmentApp extends StatelessWidget {
  final _appRouter = AppRouter();

  TreatmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Treatment Buddy',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: _appRouter.config(),
    );
  }
}
