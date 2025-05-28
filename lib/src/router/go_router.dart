import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:streaming/src/pages/sidebar.dart';
import 'package:streaming/src/pages/initial_page.dart';
import 'package:streaming/src/pages/prueba_page.dart';

final router = GoRouter(
  initialLocation: '/inicio',
  routes: [
    GoRoute(path: '/', redirect: (context, state) => '/inicio'),
    ShellRoute(
      builder: (context, state, child) => HomeLayout(child: child),
      routes: [
        GoRoute(
          path: '/inicio',
          builder: (context, state) => const InitialPage(),
        ),
        GoRoute(
          path: '/prueba',
          builder: (context, state) => const PruebaPage(),
        ),
      ],
    ),
  ],
);

final menuItems = [
    {'icon': Icons.home, 'label': 'Prospectos y Clientes', 'route': '/inicio'},
    {
      'icon': Icons.settings,
      'label': 'Plataforma y Planes',
      'route': '/prueba',
    },
  ];

