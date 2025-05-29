import 'package:flutter/material.dart';
import 'package:streaming/src/data/clients_data.dart';
import 'package:streaming/src/models/client_model.dart';
import 'package:streaming/src/theme/app_theme.dart';
import 'package:streaming/src/widgets/app_bar_widget.dart';
import 'package:streaming/src/widgets/form_event.dart';
import 'package:streaming/src/widgets/form_note.dart';

class NewClientPage extends StatefulWidget {
  final NewClient newClient;
  const NewClientPage({super.key, required this.newClient});

  @override
  State<NewClientPage> createState() => _NewClientPageState();
}

class _NewClientPageState extends State<NewClientPage> {
  NewClient get newClient => widget.newClient;
  List<EventClient> eventClients = eventClientsList;
  List<NoteClient> noteClients = noteClientsList;
  bool isEvent = true;

  void openDialogEvent() async {
    final event = await eventForm(context, eventClients);
    if (event != null) {
      setState(() {
        eventClients.insert(0, event);
      });
    }
  }

  void openDialogNote() async {
    final note = await noteForm(context);
    if (note != null) {
      setState(() {
        noteClients.insert(0, note);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          appBar('Prospectos y Clientes'),
          _headerClient(screenWidth),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _boxInfoNewClient(screenWidth),
                    _boxInfoNewClient(screenWidth),
                    _boxInfoNewClient(screenWidth),
                    _boxInfoNewClient(screenWidth),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70,
                      width: screenWidth * 0.60,
                      decoration: BoxDecoration(
                        color: Color(0xffF3F4F6),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                // Handle click for Eventos
                                setState(() {
                                  isEvent = true;
                                });
                              },
                              child: Container(
                                width: screenWidth * 0.25,
                                height: 50,
                                decoration: BoxDecoration(
                                  color:
                                      isEvent
                                          ? Colors.white
                                          : Color(0xffF3F4F6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Eventos',
                                    style: TextStylesFull.clientName,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isEvent = false;
                                });
                              },
                              child: Container(
                                width: screenWidth * 0.25,
                                height: 50,
                                decoration: BoxDecoration(
                                  color:
                                      !isEvent
                                          ? Colors.white
                                          : Color(0xffF3F4F6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Notas',
                                    style: TextStylesFull.clientName,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    isEvent
                        ? Container(
                          height: screenHeight * 0.70,
                          width: screenWidth * 0.60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                      ),
                                      label: Text('Todos'),
                                      iconAlignment: IconAlignment.end,
                                    ),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          openDialogEvent();
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.60 - 40,
                                height: screenHeight * 0.54,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children:
                                        eventClients
                                            .map(
                                              (event) => _eventClient(
                                                screenWidth,
                                                event,
                                              ),
                                            )
                                            .toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        : Container(
                          height: screenHeight * 0.70,
                          width: screenWidth * 0.60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                      ),
                                      label: Text('Todos'),
                                      iconAlignment: IconAlignment.end,
                                    ),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          openDialogNote();
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.60 - 40,
                                height: screenHeight * 0.54,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children:
                                        noteClients
                                            .map(
                                              (note) => _noteClient(
                                                screenWidth,
                                                note,
                                              ),
                                            )
                                            .toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _eventClient(double screenWidth, EventClient event) {
    return Container(
      height: 200,
      width: screenWidth * 0.60 - 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.calendar_month_outlined),
                const SizedBox(width: 10),
                Text('${event.title}'),
              ],
            ),
          ),
          Divider(height: 0),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                Icon(Icons.access_time_outlined),
                const SizedBox(width: 10),
                Text('Fecha: ${event.date}'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                Icon(Icons.segment_outlined),
                const SizedBox(width: 10),
                Text('Objetivo: ${event.description}'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                Icon(Icons.link_outlined),
                const SizedBox(width: 10),
                Text('Link: ${event.link}'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                Icon(Icons.alarm_outlined),
                const SizedBox(width: 10),
                Text('Duración: ${event.duration}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _noteClient(double screenWidth, NoteClient note) {
    return Container(
      width: screenWidth * 0.60 - 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.segment_outlined),
                    const SizedBox(width: 10),
                    Text('Nota'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined),
                    const SizedBox(width: 10),
                    Text(note.date!),
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 0),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Text(note.content!),
          ),
        ],
      ),
    );
  }

  Container _boxInfoNewClient(double screenWidth) {
    return Container(
      width: screenWidth * 0.14,
      height: 110,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Color(0xffd9d9d9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ejecutivo de Ventas', style: TextStylesFull.clientName),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.support_agent, size: 30),
              const SizedBox(width: 5),
              Text('Maria Moreno', style: TextStylesMedium.clientName),
            ],
          ),
        ],
      ),
    );
  }

  Container _headerClient(double screenWidth) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              const SizedBox(width: 15),
              Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  newClient.name!.isEmpty
                      ? 'U'
                      : newClient.name![0].toUpperCase(),
                  style: TextStylesFull.subtitle,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    newClient.name ?? 'Usuario',
                    style: TextStylesFull.clientName,
                    maxLines: 1,
                  ),
                  Text(
                    newClient.email ?? 'correo@user.com',
                    style: TextStylesFull.clientEmail,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: screenWidth * 0.35,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xfff4f4f4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.fiber_new_sharp, size: 30),
                const SizedBox(width: 25),
                Text('Nuevo Cliente', style: TextStylesFull.titleProspect),
              ],
            ),
          ),
          Row(
            spacing: 20,
            children: [
              Container(
                width: screenWidth * 0.038,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffA7C2F3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.phone_outlined, color: Colors.white),
                ),
              ),
              Container(
                width: screenWidth * 0.038,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffA7C2F3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.mail_outline, color: Colors.white),
                ),
              ),
              const SizedBox(width: 0),
            ],
          ),
        ],
      ),
    );
  }
}
