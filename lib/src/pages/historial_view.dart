import 'package:flutter/material.dart';
import 'package:streaming/src/models/client_model.dart';
import 'package:streaming/src/data/clients_data.dart';
import 'package:streaming/src/widgets/generic_table.dart'; // Importa tu tabla genérica

class HistorialView extends StatefulWidget {
  final int initialTab;
  const HistorialView({super.key, this.initialTab = 0});

  @override
  _HistorialViewState createState() => _HistorialViewState();
}

class _HistorialViewState extends State<HistorialView> {
  late List<ContactedClient> sortedContactedClients;
  late List<TrialClient> sortedTrialClients;
  late List<SubscribedClient> sortedSubscribedClients;
  late List<DiscardedClient> sortedDiscardedClients;
  bool isAscending = true;

  @override
  void initState() {
    super.initState();
    sortedContactedClients = List.from(contactedClientsList);
    sortedTrialClients = List.from(trialClientsList);
    sortedSubscribedClients = List.from(subscribedClientsList);
    sortedDiscardedClients = List.from(discardedClientsList);
  }

  void _sortByName<T>(List<T> clients, bool ascending) {
    clients.sort((a, b) {
      final nameA = (a as dynamic).name ?? '';
      final nameB = (b as dynamic).name ?? '';
      return ascending ? nameA.compareTo(nameB) : nameB.compareTo(nameA);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: widget.initialTab,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Historial'),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ), // Rounded corners
              color: Colors.white, // Blue accent color
            ),
            tabs: const [
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
              data: sortedContactedClients,
              columns: [
                DataColumn(
                  label: Row(
                    children: [
                      Text(
                        'Nombre',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        isAscending ? Icons.arrow_upward : Icons.arrow_downward,
                        size: 16,
                      ),
                    ],
                  ),
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      isAscending = ascending;
                      _sortByName(sortedContactedClients, ascending);
                    });
                  },
                ),
                DataColumn(
                  label: Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Canal',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Intereses',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Nivel',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Último contacto',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Origen',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Acciones',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
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
                      Row(
                        children: [
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              // Define action based on selected value
                            },
                            itemBuilder:
                                (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                      const PopupMenuItem<String>(
                                        value: 'Prueba',
                                        child: Text('Prueba'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'Suscritos',
                                        child: Text('Suscritos'),
                                      ),
                                    ],
                            icon: Icon(Icons.more_vert),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                // Remove the item from the list
                                // Example: sortedContactedClients.remove(client);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
            ),
            // Prueba gratis
            GenericTable<TrialClient>(
              data: sortedTrialClients,
              columns: [
                DataColumn(
                  label: Text(
                    'Nombre',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      isAscending = ascending;
                      _sortByName(sortedTrialClients, ascending);
                    });
                  },
                ),
                DataColumn(
                  label: Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Plataforma',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Duración',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Inicio',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Último contacto',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Origen',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Acciones',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
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
                      Row(
                        children: [
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              // Define action based on selected value
                            },
                            itemBuilder:
                                (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                      const PopupMenuItem<String>(
                                        value: 'Prueba',
                                        child: Text('Prueba'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'Suscritos',
                                        child: Text('Suscritos'),
                                      ),
                                    ],
                            icon: Icon(Icons.more_vert),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                // Remove the item from the list
                                // Example: sortedTrialClients.remove(client);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
            ),
            // Suscritos
            GenericTable<SubscribedClient>(
              data: sortedSubscribedClients,
              columns: [
                DataColumn(
                  label: Text(
                    'Nombre',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      isAscending = ascending;
                      _sortByName(sortedSubscribedClients, ascending);
                    });
                  },
                ),
                DataColumn(
                  label: Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Plataforma',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Plan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Inicio',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Fin',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Último contacto',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Origen',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Acciones',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
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
                      Row(
                        children: [
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              // Define action based on selected value
                            },
                            itemBuilder:
                                (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                      const PopupMenuItem<String>(
                                        value: 'Prueba',
                                        child: Text('Prueba'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'Suscritos',
                                        child: Text('Suscritos'),
                                      ),
                                    ],
                            icon: Icon(Icons.more_vert),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                // Remove the item from the list
                                // Example: sortedSubscribedClients.remove(client);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
            ),
            // Descartados
            GenericTable<DiscardedClient>(
              data: sortedDiscardedClients,
              columns: [
                DataColumn(
                  label: Text(
                    'Nombre',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      isAscending = ascending;
                      _sortByName(sortedDiscardedClients, ascending);
                    });
                  },
                ),
                DataColumn(
                  label: Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Origen',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Canal',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Razón',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Último contacto',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Acciones',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
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
                      Row(
                        children: [
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              // Define action based on selected value
                            },
                            itemBuilder:
                                (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                      const PopupMenuItem<String>(
                                        value: 'Prueba',
                                        child: Text('Prueba'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'Suscritos',
                                        child: Text('Suscritos'),
                                      ),
                                    ],
                            icon: Icon(Icons.more_vert),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                // Remove the item from the list
                                // Example: sortedDiscardedClients.remove(client);
                              });
                            },
                          ),
                        ],
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
