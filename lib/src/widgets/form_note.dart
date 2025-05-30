import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:streaming/src/models/client_model.dart';

Future<NoteClient?> noteForm(
  BuildContext context,
  GlobalKey<FormState> globalKey,
) {
  TextEditingController notaController = TextEditingController();

  return showDialog<NoteClient>(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.2),
    builder: (context) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Form(
              key: globalKey,
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
                            Container(
                              height: 50,
                              //margin: const EdgeInsets.all(16.0),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Nueva nota',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.close),
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed:
                                        () => Navigator.of(context).pop(),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    //const Text('Nota',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15) , ),
                                    TextFormField(
                                      controller: notaController,
                                      decoration: const InputDecoration(
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
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().length < 5) {
                                          return 'Debe contener al menos 5 caracteres';
                                        }
                                        return null;
                                      },
                                    ),

                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Guardar evento
                                            // Obtener valores del formulario
                                            final String nota =
                                                notaController.text.trim();
                                            final DateTime now = DateTime.now();
                                            final formato = DateFormat(
                                              'dd/MM/yyyy - HH:mm',
                                            );
                                            final String fechaHoraFormateada =
                                                formato.format(now);
                                            // Ejemplo: imprimir todo en consola
                                            print(
                                              '--- Nueva nota guardada ---',
                                            );
                                            print('Nota: $nota');
                                            print('Fecha: $now');
                                            NoteClient noteClient = NoteClient(
                                              content: nota,
                                              date: fechaHoraFormateada,
                                            );
                                            if (!globalKey.currentState!
                                                .validate()) {
                                              return;
                                            }
                                            Navigator.pop(context, noteClient);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(
                                              0xff34538C,
                                            ), // fondo
                                            foregroundColor:
                                                Colors.white, // texto e íconos
                                            elevation: 3, // sombra
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    8,
                                                  ), // bordes redondeados
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 12,
                                            ),
                                          ),
                                          // child: const Text('Guardar', ),
                                          child: Icon(
                                            Icons.save,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
          ),
        ],
      );
    },
  );
}
