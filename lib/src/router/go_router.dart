import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:streaming/src/models/client_model.dart';
import 'package:streaming/src/pages/contacted_client_page.dart';
import 'package:streaming/src/pages/initial_page.dart';

import 'package:streaming/src/pages/new_client_page.dart';
//import 'package:streaming/src/pages/prueba_page.dart';
import 'package:streaming/src/pages/sidebar.dart';

import 'package:streaming/src/pages/subscribed_client_page.dart';
import 'package:streaming/src/pages/trial_client_page.dart';
import 'package:streaming/src/pages/historial_view.dart';

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
        GoRoute(
          path: '/historial',
          builder: (context, state) => const HistorialView(),
          routes: [
            GoRoute(
              path: 'contactados',
              builder: (context, state) => const HistorialView(initialTab: 0),
            ),
            GoRoute(
              path: 'pruebagratis',
              builder: (context, state) => const HistorialView(initialTab: 1),
            ),
            GoRoute(
              path: 'suscritos',
              builder: (context, state) => const HistorialView(initialTab: 2),
            ),
            GoRoute(
              path: 'descartados',
              builder: (context, state) => const HistorialView(initialTab: 3),
            ),
          ],
        ),

        /*GoRoute(
          path: '/prueba',
          builder: (context, state) => const PruebaPage(),
        ),*/
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
  {'icon': Icons.history, 'label': 'historial', 'route': '/historial'},
  {'icon': Icons.mail, 'label': 'Mail', 'route': '/mail'},
  {'icon': Icons.calendar_today, 'label': 'Calendario', 'route': '/calendario'},
  {'icon': Icons.insert_chart, 'label': 'Informes', 'route': '/informes'},
  {'icon': Icons.settings, 'label': 'Configuración', 'route': '/configuracion'},
  {'icon': Icons.help, 'label': 'Ayuda', 'route': '/ayuda'},
];
