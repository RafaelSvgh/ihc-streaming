import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:streaming/src/data/clients_data.dart';
import 'package:streaming/src/models/client_model.dart';
import 'package:streaming/src/theme/app_theme.dart';
import 'package:streaming/src/widgets/app_bar_widget.dart';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  List<NewClient> newClients = newClientsList;
  List<ContactedClient> contactedClients = contactedClientsList;
  List<TrialClient> trialClients = trialClientsList;
  List<SubscribedClient> subscribedClients = subscribedClientsList;
  List<DiscardedClient> discardedClients = discardedClientsList;
  double newClientsCount = newClientsList.length.toDouble();
  double contactedClientsCount = contactedClientsList.length.toDouble();
  double trialClientsCount = trialClientsList.length.toDouble();
  double subscribedClientsCount = subscribedClientsList.length.toDouble();
  double discardedClientsCount = discardedClientsList.length.toDouble();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          appBar('Prospectos y Clientes'),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              children: [Text('Orden del día', style: TextStylesFull.subtitle)],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _prospectNewClient(context, AppColors.newClient, newClients),
                _prospectContactedClient(
                  context,
                  AppColors.contactedClient,
                  contactedClientsList,
                ),
                _prospectTrialClient(
                  context,
                  AppColors.trialClient,
                  trialClientsList,
                ),
                _prospectSubscribedClient(
                  context,
                  AppColors.subscribedClient,
                  subscribedClientsList,
                ),
                _prospectDiscardedClient(
                  context,
                  AppColors.discardedClient,
                  discardedClientsList,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _prospectNewClient(
    BuildContext context,
    Color color,
    List<NewClient> clientsData,
  ) {
    final prospectSize = MediaQuery.of(context).size;
    final windowsSize = html.window;
    return Container(
      padding: EdgeInsets.all(8),
      width: prospectSize.width / 6.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          _titulo(windowsSize, color, 'Nuevos', false, clientsData),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: 1 - ((1 / newClientsCount) * newClients.length),
            color: Color(0xff34538C),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: prospectSize.height * 0.7,
            child: SingleChildScrollView(
              child: Column(
                children:
                    clientsData
                        .asMap()
                        .entries
                        .map(
                          (entry) => _boxNewClient(
                            entry.value,
                            windowsSize,
                            entry.key,
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _boxNewClient(NewClient cliente, html.Window windowsSize, int index) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.go('/prospectos/nuevos', extra: cliente);
        },
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          margin: EdgeInsets.only(right: 10, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xf4f4f4f4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      cliente.name![0],
                      style: TextStylesFull.clientName,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cliente.name!,
                        style:
                            windowsSize.innerWidth! > 1800
                                ? TextStylesFull.clientName
                                : TextStylesMedium.clientName,
                        maxLines: 1,
                      ),
                      Text(
                        cliente.email!,
                        style:
                            windowsSize.innerWidth! > 1800
                                ? TextStylesFull.clientEmail
                                : TextStylesMedium.clientEmail,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  // IconButton(
                  //   tooltip: 'Más opciones',
                  //   onPressed: () {},
                  //   icon: Icon(Icons.more_vert, size: 20),
                  // ),
                  PopupMenuButton(
                    tooltip: 'Mover a',
                    itemBuilder:
                        (context) => [
                          PopupMenuItem(
                            child: Text('Contactados'),
                            onTap: () {
                              setState(() {
                                contactedClients.insert(
                                  0,
                                  ContactedClient(
                                    name: cliente.name,
                                    email: cliente.email,
                                    channel: 'LLamada',
                                    interests: 'Deportes',
                                    level: 'Medio',
                                  ),
                                );
                                newClients.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Center(
                                    child: Text(
                                      '${cliente.name} a Contactados',
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          PopupMenuItem(
                            child: Text('Prueba'),
                            onTap: () {
                              setState(() {
                                trialClients.insert(
                                  0,
                                  TrialClient(
                                    name: cliente.name,
                                    email: cliente.email,
                                    platform: 'Web',
                                    duration: '30 días',
                                    startDate: '01/01/2023',
                                  ),
                                );
                                newClients.removeAt(index);
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Center(
                                    child: Text('${cliente.name} a Prueba'),
                                  ),
                                ),
                              );
                            },
                          ),
                          PopupMenuItem(
                            child: Text('Suscritos'),
                            onTap: () {
                              setState(() {
                                subscribedClients.insert(
                                  0,
                                  SubscribedClient(
                                    name: cliente.name,
                                    email: cliente.email,
                                    platform: 'Web',
                                    plan: 'Premium',
                                    startDate: '01/01/2023',
                                    endDate: '01/01/2024',
                                  ),
                                );
                                newClients.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Center(
                                    child: Text('${cliente.name} a Suscritos'),
                                  ),
                                ),
                              );
                            },
                          ),
                          PopupMenuItem(
                            child: Text('Descartados'),
                            onTap: () {
                              setState(() {
                                discardedClients.insert(
                                  0,
                                  DiscardedClient(
                                    name: cliente.name,
                                    email: cliente.email,
                                    origin: 'Web',
                                    channel: 'Email',
                                    reason: 'No interesado',
                                  ),
                                );
                                newClients.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Center(
                                    child: Text(
                                      '${cliente.name} a Descartados',
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                  ),
                ],
              ),
              Divider(indent: 10, endIndent: 10),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Origen: ${cliente.origin!}',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Campaña: ${cliente.campaign!}',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Categoría: ${cliente.category!}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _prospectContactedClient(
    BuildContext context,
    Color color,
    List<ContactedClient> clientsData,
  ) {
    final prospectSize = MediaQuery.of(context).size;
    final windowsSize = html.window;
    return Container(
      padding: EdgeInsets.all(8),
      width: prospectSize.width / 6.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          _titulo(windowsSize, color, 'Contactados', false, clientsData),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: 1 - ((1 / contactedClientsCount) * contactedClients.length),
            color: Color(0xff34538C),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: prospectSize.height * 0.7,
            child: SingleChildScrollView(
              child: Column(
                children:
                    clientsData
                        .map(
                          (cliente) =>
                              _boxContactedClient(cliente, windowsSize),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _boxContactedClient(ContactedClient cliente, html.Window windowsSize) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.go('/prospectos/contactados', extra: cliente);
        },
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          margin: EdgeInsets.only(right: 10, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xf4f4f4f4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      cliente.name![0],
                      style: TextStylesFull.clientName,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cliente.name!,
                        style:
                            windowsSize.innerWidth! > 1800
                                ? TextStylesFull.clientName
                                : TextStylesMedium.clientName,
                        maxLines: 1,
                      ),
                      Text(
                        cliente.email!,
                        style:
                            windowsSize.innerWidth! > 1800
                                ? TextStylesFull.clientEmail
                                : TextStylesMedium.clientEmail,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  IconButton(
                    tooltip: 'Más opciones',
                    onPressed: () {},
                    icon: Icon(Icons.more_vert, size: 20),
                  ),
                ],
              ),
              Divider(indent: 10, endIndent: 10),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Canal: ${cliente.channel!}',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Interés: ${cliente.interests!}',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Nivel de interés: ${cliente.level!}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _prospectTrialClient(
    BuildContext context,
    Color color,
    List<TrialClient> clientsData,
  ) {
    final prospectSize = MediaQuery.of(context).size;
    final windowsSize = html.window;
    return Container(
      padding: EdgeInsets.all(8),
      width: prospectSize.width / 6.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          _titulo(windowsSize, color, 'Prueba', true, clientsData),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: 1 - ((1 / trialClientsCount) * trialClients.length),
            color: Color(0xff34538C),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: prospectSize.height * 0.7,
            child: SingleChildScrollView(
              child: Column(
                children:
                    clientsData
                        .map((cliente) => _boxTrialClient(cliente, windowsSize))
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _boxTrialClient(TrialClient cliente, html.Window windowsSize) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.go('/prospectos/prueba', extra: cliente);
        },
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          margin: EdgeInsets.only(right: 10, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xf4f4f4f4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      cliente.name![0],
                      style: TextStylesFull.clientName,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cliente.name!,
                        style:
                            windowsSize.innerWidth! > 1800
                                ? TextStylesFull.clientName
                                : TextStylesMedium.clientName,
                        maxLines: 1,
                      ),
                      Text(
                        cliente.email!,
                        style:
                            windowsSize.innerWidth! > 1800
                                ? TextStylesFull.clientEmail
                                : TextStylesMedium.clientEmail,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  IconButton(
                    tooltip: 'Más opciones',
                    onPressed: () {},
                    icon: Icon(Icons.more_vert, size: 20),
                  ),
                ],
              ),
              Divider(indent: 10, endIndent: 10),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Plataforma: ${cliente.platform!}',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Duración: ${cliente.duration!}',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Inicio: ${cliente.startDate!}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _prospectSubscribedClient(
    BuildContext context,
    Color color,
    List<SubscribedClient> clientsData,
  ) {
    final prospectSize = MediaQuery.of(context).size;
    final windowsSize = html.window;
    return Container(
      padding: EdgeInsets.all(8),
      width: prospectSize.width / 6.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          _titulo(windowsSize, color, 'Suscritos', true, clientsData),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value:
                1 - ((1 / subscribedClientsCount) * subscribedClients.length),
            color: Color(0xff34538C),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: prospectSize.height * 0.7,
            child: SingleChildScrollView(
              child: Column(
                children:
                    clientsData
                        .map(
                          (cliente) =>
                              _boxSubscribedClient(cliente, windowsSize),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _boxSubscribedClient(
    SubscribedClient cliente,
    html.Window windowsSize,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.go('/prospectos/suscritos', extra: cliente);
        },
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          margin: EdgeInsets.only(right: 10, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xf4f4f4f4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      cliente.name![0],
                      style: TextStylesFull.clientName,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cliente.name!,
                        style:
                            windowsSize.innerWidth! > 1800
                                ? TextStylesFull.clientName
                                : TextStylesMedium.clientName,
                        maxLines: 1,
                      ),
                      Text(
                        cliente.email!,
                        style:
                            windowsSize.innerWidth! > 1800
                                ? TextStylesFull.clientEmail
                                : TextStylesMedium.clientEmail,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  IconButton(
                    tooltip: 'Más opciones',
                    onPressed: () {},
                    icon: Icon(Icons.more_vert, size: 20),
                  ),
                ],
              ),
              Divider(indent: 10, endIndent: 10),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Plataforma: ${cliente.platform!}',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Plan: ${cliente.plan!}',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Periodo: ${cliente.startDate!} - ${cliente.endDate!}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _prospectDiscardedClient(
    BuildContext context,
    Color color,
    List<DiscardedClient> clientsData,
  ) {
    final prospectSize = MediaQuery.of(context).size;
    final windowsSize = html.window;
    return Container(
      padding: EdgeInsets.all(8),
      width: prospectSize.width / 6.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          _titulo(windowsSize, color, 'Descartados', true, clientsData),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: 1 - ((1 / discardedClientsCount) * discardedClients.length),
            color: Color(0xff34538C),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: prospectSize.height * 0.7,
            child: SingleChildScrollView(
              child: Column(
                children:
                    clientsData
                        .map(
                          (cliente) =>
                              _boxDiscardedClient(cliente, windowsSize),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _boxDiscardedClient(
    DiscardedClient cliente,
    html.Window windowsSize,
  ) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      margin: EdgeInsets.only(right: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10),
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xf4f4f4f4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(cliente.name![0], style: TextStylesFull.clientName),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cliente.name!,
                    style:
                        windowsSize.innerWidth! > 1800
                            ? TextStylesFull.clientName
                            : TextStylesMedium.clientName,
                    maxLines: 1,
                  ),
                  Text(
                    cliente.email!,
                    style:
                        windowsSize.innerWidth! > 1800
                            ? TextStylesFull.clientEmail
                            : TextStylesMedium.clientEmail,
                    maxLines: 1,
                  ),
                ],
              ),
              IconButton(
                tooltip: 'Más opciones',
                onPressed: () {},
                icon: Icon(Icons.more_vert, size: 20),
              ),
            ],
          ),
          Divider(indent: 10, endIndent: 10),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Origen: ${cliente.origin!}',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'Canal: ${cliente.channel!}',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'Motivo: ${cliente.reason!}',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _titulo(
    html.Window windowsSize,
    Color color,
    String title,
    bool whiteText,
    List list,
  ) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 8, top: 6, bottom: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectableText(
            title,
            style:
                windowsSize.innerWidth! > 1800
                    ? TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: whiteText ? Colors.white : Colors.black,
                    )
                    : TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: whiteText ? Colors.white : Colors.black,
                    ),
          ),
          Container(
            width: 40,
            alignment: Alignment.center,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              list.length.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
