import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:streaming/src/models/client_model.dart';
import 'package:streaming/src/widgets/dropdown.dart';

Future<MessageClient?> messageForm(
  BuildContext context,
  String clientName,
  String clientEmail,
  GlobalKey<FormState> globalKey,
) {
  final TextEditingController destinatarioController = TextEditingController(
    text: clientEmail,
  );
  final TextEditingController asuntoController = TextEditingController();
  final TextEditingController contenidoController = TextEditingController();

  final String tipoCliente = 'Contactado';

  String? plantillaSeleccionada;

  return showDialog<MessageClient>(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.2),
    builder: (context) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80, right: 40),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                elevation: 12,
                child: Container(
                  width: 400,
                  padding: const EdgeInsets.all(16),
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Encabezado
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xFFDAE3F4),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Nuevo mensaje',
                                  style: TextStyle(fontSize: 15),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Contenido del formulario
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Campo Para:
                                Row(
                                  children: [
                                    const Text(
                                      'Para:',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: TextFormField(
                                        controller: destinatarioController,
                                        style: const TextStyle(fontSize: 14),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 5,
                                            vertical: 8,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),

                                // Campo Asunto:
                                Row(
                                  children: [
                                    const Text(
                                      'Asunto:',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: TextFormField(
                                        controller: asuntoController,
                                        style: const TextStyle(fontSize: 14),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 5,
                                            vertical: 8,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),

                                // Widget plantilla
                                buildPlantillaDropdown(tipoCliente, (value) {
                                  setState(() {
                                    plantillaSeleccionada = value;
                                    final asunto =
                                        asuntoPorPlantilla[value] ?? '';
                                    final contenido =
                                        'Hola, $clientName\n\n${contenidoPorPlantilla[value] ?? ''}';

                                    if (RegExp(
                                      r'^[a-zA-Z0-9 \n]+',
                                    ).hasMatch(asunto)) {
                                      asuntoController.text = asunto;
                                    } else {
                                      asuntoController.text =
                                          'Caracteres no válidos en el asunto';
                                    }

                                    if (RegExp(
                                      r'^[a-zA-Z0-9 \n]+',
                                    ).hasMatch(contenido)) {
                                      contenidoController.text = contenido;
                                    } else {
                                      contenidoController.text =
                                          'Caracteres no válidos en el contenido';
                                    }
                                  });
                                }),

                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: contenidoController,

                                  decoration: const InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFd9d9d9),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF6B6A6A),
                                      ),
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                                  maxLines: 8,
                                  style: const TextStyle(fontSize: 13),
                                ),

                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        final String destinatario =
                                            destinatarioController.text.trim();
                                        final String asunto =
                                            asuntoController.text.trim();
                                        final String contenidoCorreo =
                                            contenidoController.text.trim();
                                        final DateTime now = DateTime.now();
                                        final formato = DateFormat(
                                          'dd/MM/yyyy - HH:mm',
                                        );
                                        final String fechaHoraFormateada =
                                            formato.format(now);
                                        print('--- Nuevo mensaje guardado ---');
                                        print('Para: $destinatario');
                                        print('Asunto: $asunto');
                                        print('Contenido: $contenidoCorreo');
                                        print('Fecha: $now');
                                        MessageClient messageClient =
                                            MessageClient(
                                              name: clientName,
                                              email: clientEmail,
                                              subject: asunto,
                                              content: contenidoCorreo,
                                              date: fechaHoraFormateada,
                                            );
                                        Navigator.pop(context, messageClient);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xff34538C,
                                        ),
                                        foregroundColor: Colors.white,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),

                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 12,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.send,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
