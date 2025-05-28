import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class PruebaPage extends StatelessWidget {
  const PruebaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Prueba Page'),
          ElevatedButton(
            onPressed: () {
              // Navigate to another page
              context.go('/inicio');
            },
            child: const Text('Go to Initial Page'),
          ),
        ],
      ),
    );
  }
}
