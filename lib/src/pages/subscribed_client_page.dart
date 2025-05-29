import 'package:flutter/material.dart';
import 'package:streaming/src/data/clients_data.dart';
import 'package:streaming/src/models/client_model.dart';
import 'package:streaming/src/theme/app_theme.dart';
import 'package:streaming/src/widgets/app_bar_widget.dart';
import 'package:streaming/src/widgets/form_event.dart';
import 'package:streaming/src/widgets/form_message.dart';
import 'package:streaming/src/widgets/form_note.dart';

class SubscribedClientPage extends StatefulWidget {
  final SubscribedClient subscribedClient;
  const SubscribedClientPage({super.key, required this.subscribedClient});

  @override
  State<SubscribedClientPage> createState() => _SubscribedClientPageState();
}

class _SubscribedClientPageState extends State<SubscribedClientPage> {
  SubscribedClient get subscribedClient => widget.subscribedClient;
  List<EventClient> eventClients = eventClientsList;
  List<NoteClient> noteClients = noteClientsList;
  List<MessageClient> messageClients = messageClientsList;
  final _formKey = GlobalKey<FormState>();

  bool isTimeline = false;
  bool isEvent = false;
  bool isNote = false;
  bool isTrial = true;

  void openDialogEvent() async {
    final event = await eventForm(context, eventClients, _formKey);
    if (event != null) {
      setState(() {
        eventClients.insert(0, event);
      });
    }
  }

  void openDialogNote() async {
    final note = await noteForm(context, _formKey);
    if (note != null) {
      setState(() {
        noteClients.insert(0, note);
      });
    }
  }

  void openDialogMessage() async {
    final message = await messageForm(
      context,
      subscribedClient.name!,
      subscribedClient.email!,
      _formKey,
    );
    if (message != null) {
      setState(() {
        messageClients.insert(0, message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
                                setState(() {
                                  isTrial = true;
                                  isTimeline = false;
                                  isEvent = false;
                                  isNote = false;
                                });
                              },
                              child: Container(
                                width: screenWidth * 0.13,
                                height: 50,
                                decoration: BoxDecoration(
                                  color:
                                      isTrial
                                          ? Colors.white
                                          : Color(0xffF3F4F6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Suscripciones',
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
                                  isTrial = false;
                                  isTimeline = true;
                                  isEvent = false;
                                  isNote = false;
                                });
                              },
                              child: Container(
                                width: screenWidth * 0.13,
                                height: 50,
                                decoration: BoxDecoration(
                                  color:
                                      isTimeline
                                          ? Colors.white
                                          : Color(0xffF3F4F6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Línea de tiempo',
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
                                  isEvent = true;
                                  isTimeline = false;
                                  isNote = false;
                                  isTrial = false;
                                });
                              },
                              child: Container(
                                width: screenWidth * 0.13,
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
                                  isTimeline = false;
                                  isNote = true;
                                  isTrial = false;
                                });
                              },
                              child: Container(
                                width: screenWidth * 0.13,
                                height: 50,
                                decoration: BoxDecoration(
                                  color:
                                      isNote ? Colors.white : Color(0xffF3F4F6),
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
                                padding: const EdgeInsets.only(
                                  top: 20,
                                  left: 20,
                                  right: 20,
                                ),
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
                        : isNote
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
                                padding: const EdgeInsets.only(
                                  top: 20,
                                  left: 20,
                                  right: 20,
                                ),
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
                        )
                        : isTimeline
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
                              const SizedBox(height: 20),
                              SizedBox(
                                width: screenWidth * 0.60 - 40,
                                height: screenHeight * 0.65,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children:
                                        messageClients
                                            .map(
                                              (message) => _timeLineClient(
                                                screenWidth,
                                                message,
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
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                width: screenWidth * 0.60 - 40,
                                height: screenHeight * 0.65,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      _trialClient(screenWidth, 'NETFLIX'),
                                      _trialClient(screenWidth, 'HBO'),
                                      _trialClient(screenWidth, 'DISNEY+'),
                                      _trialClient(screenWidth, 'AMAZON PRIME'),
                                    ],
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

  Container _trialClient(double screenWidth, String title) {
    final width = screenWidth * 0.60 - 40;
    return Container(
      width: width,
      decoration: BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width * 0.22,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xffF3F4F6),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                padding: const EdgeInsets.only(top: 10, left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Membresía', style: TextStylesFull.titleProspect),
                    const SizedBox(height: 10),
                    Text('user@email.com', style: TextStylesFull.clientBody),
                    const SizedBox(height: 10),
                    Text('+591 79865677', style: TextStylesFull.clientBody),
                  ],
                ),
              ),
              Container(
                width: width * 0.22,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xffF3F4F6),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                padding: const EdgeInsets.only(top: 10, left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Detalles del plan',
                      style: TextStylesFull.titleProspect,
                    ),
                    const SizedBox(height: 10),
                    Text('Basico - Prueba', style: TextStylesFull.clientBody),
                    const SizedBox(height: 10),
                    Text('USD 7.99', style: TextStylesFull.clientBody),
                  ],
                ),
              ),
              Container(
                width: width * 0.22,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xffF3F4F6),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                padding: const EdgeInsets.only(top: 10, left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.credit_card_outlined, size: 26),
                        Text(
                          'XXXX XXXX XXXX 8096',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text('Próximo pago: ', style: TextStylesFull.clientBody),
                    const SizedBox(height: 10),
                    Text('15/06/2025', style: TextStylesFull.clientBody),
                  ],
                ),
              ),
              Container(
                width: width * 0.22,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xffF3F4F6),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                padding: const EdgeInsets.only(top: 10, left: 0, right: 5),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Pagos', style: TextStylesFull.titleProspect),
                      const SizedBox(height: 10),
                      Text(
                        '14/05/2025     \$7.99',
                        style: TextStylesFull.clientBody,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '14/05/2025     \$7.99',
                        style: TextStylesFull.clientBody,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '14/05/2025     \$7.99',
                        style: TextStylesFull.clientBody,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '14/05/2025   \$7.99',
                        style: TextStylesFull.clientBody,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '14/05/2025     \$7.99',
                        style: TextStylesFull.clientBody,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _timeLineClient(double screenWidth, MessageClient message) {
    return Container(
      width: screenWidth * 0.60 - 40,
      decoration: BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message.date!),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Icon(Icons.circle, color: AppColors.secondary),
                  Container(
                    width: 1,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      // borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.mail_outline),
                      const SizedBox(width: 10),
                      Text(
                        'Email enviado',
                        style: TextStylesMedium.titleProspect,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  Text('Campaña: Beneficios nuevos suscriptores'),
                  const SizedBox(height: 5),
                  Container(
                    width: screenWidth * 0.56 - 80,
                    decoration: BoxDecoration(
                      color: Color(0xffF3F4F6),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.subject!,
                          style: TextStylesMedium.clientName,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          message.content!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
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
            child:
                event.description!.isNotEmpty
                    ? Row(
                      children: [
                        Icon(Icons.segment_outlined),
                        const SizedBox(width: 10),
                        Text('Objetivo: ${event.description}'),
                      ],
                    )
                    : null,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child:
                event.link!.isNotEmpty
                    ? Row(
                      children: [
                        Icon(Icons.link_outlined),
                        const SizedBox(width: 10),
                        Text('Link: ${event.link}'),
                      ],
                    )
                    : null,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child:
                event.duration!.isNotEmpty
                    ? Row(
                      children: [
                        Icon(Icons.alarm_outlined),
                        const SizedBox(width: 10),
                        Text('Duración: ${event.duration}'),
                      ],
                    )
                    : null,
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
                  subscribedClient.name!.isEmpty
                      ? 'U'
                      : subscribedClient.name![0].toUpperCase(),
                  style: TextStylesFull.subtitle,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    subscribedClient.name ?? 'Usuario',
                    style: TextStylesFull.clientName,
                    maxLines: 1,
                  ),
                  Text(
                    subscribedClient.email ?? 'correo@user.com',
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
              color: AppColors.subscribedClient,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                const SizedBox(width: 25),
                Text(
                  'Suscrito',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
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
                  color: Color(0xFF96BBFF),
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
                  color: Color(0xFF96BBFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    openDialogMessage();
                  },
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
