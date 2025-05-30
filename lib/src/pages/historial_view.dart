import 'package:flutter/material.dart';
import 'package:streaming/src/models/client_model.dart';
import 'package:streaming/src/data/clients_data.dart';
import 'package:streaming/src/widgets/generic_table.dart'; // Importa tu tabla genérica

class HistorialView extends StatelessWidget {
  final int initialTab;
  const HistorialView({super.key, this.initialTab = 0});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: initialTab,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Historial'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Contactados'),
              Tab(text: 'Prueba gratis'),
              Tab(text: 'Suscritos'),
              Tab(text: 'Descartados'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Contactados
            GenericTable<ContactedClient>(
              data: contactedClientsList,
              columns: const [
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Canal')),
                DataColumn(label: Text('Intereses')),
                DataColumn(label: Text('Nivel')),
                DataColumn(label: Text('Último contacto')),
                DataColumn(label: Text('Origen')),
                DataColumn(label: Text('Acciones')),
              ],
              rowBuilder:
                  (client) => [
                    DataCell(Text(client.name ?? '')),
                    DataCell(Text(client.email ?? '')),
                    DataCell(Text(client.channel ?? '')),
                    DataCell(Text(client.interests ?? '')),
                    DataCell(Text(client.level ?? '')),
                    DataCell(Text(client.lastContact ?? '')),
                    DataCell(Text(client.origin ?? '')),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {
                          // Define action here
                        },
                      ),
                    ),
                  ],
            ),
            // Prueba gratis
            GenericTable<TrialClient>(
              data: trialClientsList,
              columns: const [
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Plataforma')),
                DataColumn(label: Text('Duración')),
                DataColumn(label: Text('Inicio')),
                DataColumn(label: Text('Último contacto')),
                DataColumn(label: Text('Origen')),
                DataColumn(label: Text('Acciones')),
              ],
              rowBuilder:
                  (client) => [
                    DataCell(Text(client.name ?? '')),
                    DataCell(Text(client.email ?? '')),
                    DataCell(Text(client.platform ?? '')),
                    DataCell(Text(client.duration ?? '')),
                    DataCell(Text(client.startDate ?? '')),
                    DataCell(Text(client.lastContact ?? '')),
                    DataCell(Text(client.origin ?? '')),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {
                          // Define action here
                        },
                      ),
                    ),
                  ],
            ),
            // Suscritos
            GenericTable<SubscribedClient>(
              data: subscribedClientsList,
              columns: const [
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Plataforma')),
                DataColumn(label: Text('Plan')),
                DataColumn(label: Text('Inicio')),
                DataColumn(label: Text('Fin')),
                DataColumn(label: Text('Último contacto')),
                DataColumn(label: Text('Origen')),
                DataColumn(label: Text('Acciones')),
              ],
              rowBuilder:
                  (client) => [
                    DataCell(Text(client.name ?? '')),
                    DataCell(Text(client.email ?? '')),
                    DataCell(Text(client.platform ?? '')),
                    DataCell(Text(client.plan ?? '')),
                    DataCell(Text(client.startDate ?? '')),
                    DataCell(Text(client.endDate ?? '')),
                    DataCell(Text(client.lastContact ?? '')),
                    DataCell(Text(client.origin ?? '')),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {
                          // Define action here
                        },
                      ),
                    ),
                  ],
            ),
            // Descartados
            GenericTable<DiscardedClient>(
              data: discardedClientsList,
              columns: const [
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Origen')),
                DataColumn(label: Text('Canal')),
                DataColumn(label: Text('Razón')),
                DataColumn(label: Text('Último contacto')),
                DataColumn(label: Text('Acciones')),
              ],
              rowBuilder:
                  (client) => [
                    DataCell(Text(client.name ?? '')),
                    DataCell(Text(client.email ?? '')),
                    DataCell(Text(client.origin ?? '')),
                    DataCell(Text(client.channel ?? '')),
                    DataCell(Text(client.reason ?? '')),
                    DataCell(Text(client.lastContact ?? '')),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {
                          // Define action here
                        },
                      ),
                    ),
                  ],
            ),
          ],
        ),
      ),
    );
  }
}
