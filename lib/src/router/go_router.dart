import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:streaming/src/models/client_model.dart';
import 'package:streaming/src/pages/contacted_client_page.dart';
import 'package:streaming/src/pages/new_client_page.dart';
import 'package:streaming/src/pages/sidebar.dart';
import 'package:streaming/src/pages/initial_page.dart';
import 'package:streaming/src/pages/subscribed_client_page.dart';
import 'package:streaming/src/pages/trial_client_page.dart';

final router = GoRouter(
  initialLocation: '/prospectos',
  routes: [
    GoRoute(path: '/', redirect: (context, state) => '/inicio'),
    ShellRoute(
      builder: (context, state, child) => HomeLayout(child: child),
      routes: [
        GoRoute(
          path: '/prospectos',
          builder: (context, state) => const InitialPage(),
          routes: [
            GoRoute(
              path: 'nuevos',
              builder: (context, state) {
                NewClient newClient = state.extra as NewClient? ?? NewClient();
                return NewClientPage(newClient: newClient);
              },
            ),
            GoRoute(
              path: 'contactados',
              builder: (context, state) {
                ContactedClient contactedClient =
                    state.extra as ContactedClient? ?? ContactedClient();
                return ContactedClientPage(contactedClient: contactedClient);
              },
            ),
            GoRoute(
              path: 'prueba',
              builder: (context, state) {
                TrialClient trialClient =
                    state.extra as TrialClient? ?? TrialClient();
                return TrialClientPage(trialClient: trialClient);
              },
            ),
            GoRoute(
              path: 'suscritos',
              builder: (context, state) {
                SubscribedClient subscribedClient =
                    state.extra as SubscribedClient? ?? SubscribedClient();
                return SubscribedClientPage(subscribedClient: subscribedClient);
              },
            ),
            // GoRoute(
            //   path: 'editar/:id',
            //   builder: (context, state) => const EditarClientePage(),
            // ),
          ],
        ),
      ],
    ),
  ],
);

final menuItems = [
  {
    'icon': Icons.home,
    'label': 'Prospectos y Clientes',
    'route': '/prospectos',
  },
  {'icon': Icons.settings, 'label': 'Plataforma y Planes', 'route': '/prueba'},
];
