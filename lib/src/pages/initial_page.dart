import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          appBar('Prospectos y Clientes'),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 15),
            child: Row(
              children: [Text('Orden del día', style: TextStylesFull.subtitle)],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _prospectClient(context),
                _prospectClient(context),
                _prospectClient(context),
                _prospectClient(context),
                _prospectClient(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _prospectClient(BuildContext context) {
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
          _titulo(windowsSize),
          const SizedBox(height: 10),
          LinearProgressIndicator(value: 0.5, color: Color(0xff34538C)),
          const SizedBox(height: 10),
          SizedBox(
            height: prospectSize.height * 0.7,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _boxNewClient(windowsSize),
                  _boxNewClient(windowsSize),
                  _boxNewClient(windowsSize),
                  _boxNewClient(windowsSize),
                  _boxNewClient(windowsSize),
                  _boxNewClient(windowsSize),
                  _boxNewClient(windowsSize),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _boxNewClient(html.Window windowsSize) {
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
                child: Text('J', style: TextStylesFull.clientName),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Juan Perez',
                    style:
                        windowsSize.innerWidth! > 1800
                            ? TextStylesFull.clientName
                            : TextStylesMedium.clientName,
                    maxLines: 1,
                  ),
                  Text(
                    'jperez@gmail.com',
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
                Text('Origen: Facebook', style: TextStyle(fontSize: 15)),
                Text(
                  'Campaña: Ofertas de mayo',
                  style: TextStyle(fontSize: 15),
                ),
                Text('Categoría: Deportes', style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _titulo(html.Window windowsSize) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 8, top: 6, bottom: 6),
      decoration: BoxDecoration(
        color: AppColors.newClient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectableText(
            'Nuevos',
            style:
                windowsSize.innerWidth! > 1800
                    ? TextStylesFull.titleProspect
                    : TextStylesMedium.titleProspect,
          ),
          Container(
            width: 40,
            alignment: Alignment.center,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('10', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
