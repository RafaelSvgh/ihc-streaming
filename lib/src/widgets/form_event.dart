import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:streaming/src/models/client_model.dart';

Future<EventClient?> eventForm(
  BuildContext context,
  List<EventClient> events,
  GlobalKey<FormState> globalKey,
) {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String tipoEvento = 'Llamada';
  TextEditingController notaController = TextEditingController();
  TextEditingController duracionMinController = TextEditingController();
  TextEditingController duracionSegController = TextEditingController();
  TextEditingController enlaceReunionController = TextEditingController();
  bool esFuturo() {
    final fechaHoraSeleccionada = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );
    return fechaHoraSeleccionada.isAfter(DateTime.now());
  }

  return showDialog<EventClient>(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.2),
    builder: (context) {
      return Stack(
        children: [
          Form(
            key: globalKey,
            child: Align(
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
                                    'Nuevo evento',
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
                              padding: const EdgeInsets.all(12),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Tipo de evento',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Radio<String>(
                                          value: 'Llamada',
                                          groupValue: tipoEvento,
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFFDAE3F4),
                                          ),
                                          onChanged:
                                              (value) => setState(
                                                () => tipoEvento = value!,
                                              ),
                                        ),
                                        const Text('Llamada'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<String>(
                                          value: 'Reunión',
                                          groupValue: tipoEvento,
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFFDAE3F4),
                                          ),
                                          onChanged:
                                              (value) => setState(
                                                () => tipoEvento = value!,
                                              ),
                                        ),
                                        const Text('Reunión'),
                                      ],
                                    ),

                                    const SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Fecha y Hora',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextButton.icon(
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                          ),
                                          icon: const Icon(
                                            Icons.calendar_today,
                                            color: Color(0xFF434343),
                                          ),
                                          label: Text(
                                            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                                            style: const TextStyle(
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                          onPressed: () async {
                                            DateTime?
                                            picked = await showDatePicker(
                                              context: context,
                                              initialDate: selectedDate,
                                              firstDate: DateTime(2025),
                                              lastDate: DateTime(2030),
                                              builder: (context, child) {
                                                return Theme(
                                                  data: Theme.of(
                                                    context,
                                                  ).copyWith(
                                                    colorScheme: const ColorScheme.light(
                                                      primary: Color(
                                                        0xFFDAE3F4,
                                                      ), // Color del encabezado y selección
                                                      onPrimary:
                                                          Colors
                                                              .black, // Texto sobre el color primario
                                                      surface:
                                                          Colors
                                                              .white, // Fondo del diálogo
                                                      onSurface:
                                                          Colors
                                                              .black, // Texto normal
                                                    ),
                                                    dialogBackgroundColor:
                                                        Colors
                                                            .white, // Fondo del diálogo
                                                    textButtonTheme: TextButtonThemeData(
                                                      style: TextButton.styleFrom(
                                                        foregroundColor: Color(
                                                          0xFF34538C,
                                                        ), // Color de los botones "Cancelar" y "Aceptar"
                                                      ),
                                                    ),
                                                  ),
                                                  child: child!,
                                                );
                                              },
                                            );
                                            if (picked != null) {
                                              setState(() {
                                                selectedDate = picked;
                                              });
                                            }
                                          },
                                        ),
                                        SizedBox(width: 70),
                                        TextButton.icon(
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                          ),
                                          icon: const Icon(
                                            Icons.access_time,
                                            color: Color(0xFF434343),
                                          ),
                                          label: Text(
                                            selectedTime.format(context),
                                            style: const TextStyle(
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                          onPressed: () async {
                                            TimeOfDay?
                                            picked = await showTimePicker(
                                              context: context,
                                              initialTime: selectedTime,
                                              builder: (context, child) {
                                                return Theme(
                                                  data: Theme.of(
                                                    context,
                                                  ).copyWith(
                                                    timePickerTheme:
                                                        const TimePickerThemeData(
                                                          backgroundColor:
                                                              Colors
                                                                  .white, // Fondo celeste
                                                          hourMinuteTextColor:
                                                              Colors.black,
                                                          dayPeriodTextColor:
                                                              Colors.black,
                                                          dialHandColor: Color(
                                                            0xff34538C,
                                                          ),
                                                          entryModeIconColor:
                                                              Colors.black,
                                                          dialBackgroundColor:
                                                              Color(
                                                                0xFFDAE3F4,
                                                              ), // Color del dial
                                                          dayPeriodColor: Color(
                                                            0xFFDAE3F4,
                                                          ), // Color del selector AM/PM
                                                        ),
                                                    colorScheme: const ColorScheme.light(
                                                      primary: Color(
                                                        0xFFDAE3F4,
                                                      ), // Color principal (dial y botones)
                                                      onPrimary:
                                                          Colors
                                                              .black, // Texto sobre el color primario
                                                      surface:
                                                          Colors
                                                              .white, // fondo general del diálogo
                                                      onSurface:
                                                          Colors
                                                              .black, // Texto normal
                                                    ),
                                                  ),
                                                  child: child!,
                                                );
                                              },
                                            );
                                            if (picked != null) {
                                              setState(() {
                                                selectedTime = picked;
                                              });
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Nota',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    TextFormField(
                                      controller: notaController,
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFFd9d9d9,
                                            ), // Color del borde cuando está desactivado
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFF6B6A6A,
                                            ), // Color del borde cuando está enfocado
                                            //width: 2.0,
                                          ),
                                        ),
                                        border:
                                            OutlineInputBorder(), // Bordes por defecto
                                      ),
                                      maxLines: 2,
                                      style: const TextStyle(fontSize: 13),
                                    ),

                                    // Enlace reuniones
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Enlace de la reunión',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.link,
                                          color:
                                              tipoEvento == 'Reunión'
                                                  ? Color(0xFF434343)
                                                  : Color(0xFFd9d9d9),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              minHeight: 48,
                                            ), // Altura mínima fija
                                            child: TextFormField(
                                              controller:
                                                  enlaceReunionController,
                                              enabled: tipoEvento == 'Reunión',
                                              decoration: const InputDecoration(
                                                errorText:
                                                    null, // ⛔️ No pongas aquí el errorText directamente
                                                isDense: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Color(
                                                          0xFFd9d9d9,
                                                        ),
                                                      ),
                                                    ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Color(
                                                          0xFF6B6A6A,
                                                        ),
                                                      ),
                                                    ),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Color(
                                                          0xFFd9d9d9,
                                                        ),
                                                      ),
                                                    ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 12,
                                                    ),
                                              ),
                                              style: const TextStyle(
                                                fontSize: 13,
                                              ),

                                              // ✅ Aquí se valida
                                              validator: (value) {
                                                if (tipoEvento != 'Reunión')
                                                  return null; // Solo valida si aplica

                                                final pattern =
                                                    r'^(https?:\/\/)?(www\.)?([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,}(:\d+)?(\/\S*)?$';
                                                final regex = RegExp(pattern);

                                                if (value == null ||
                                                    value.trim().isEmpty) {
                                                  return 'Ingresa un enlace';
                                                } else if (!regex.hasMatch(
                                                  value.trim(),
                                                )) {
                                                  return 'Ingresa un enlace válido';
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Duración de llamadas/reunioness
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Duración',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.timelapse,
                                          color:
                                              esFuturo()
                                                  ? Color(0xFFd9d9d9)
                                                  : Color(0xFF434343),
                                        ),
                                        const SizedBox(width: 8),

                                        Flexible(
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: 50,
                                            ), // ancho mínimo para 2 números
                                            child: TextFormField(
                                              controller: duracionMinController,
                                              enabled: !esFuturo(),
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 10,
                                                    ),
                                                // Borde normal
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Color(
                                                          0xFFd9d9d9,
                                                        ),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                    ),

                                                // Borde al enfocar
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Color(
                                                          0xFF6B6A6A,
                                                        ),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                    ),
                                              ),
                                              maxLength:
                                                  3, // opcional, para limitar el input a 2 caracteres
                                              buildCounter:
                                                  (
                                                    BuildContext context, {
                                                    required int currentLength,
                                                    required bool isFocused,
                                                    required int? maxLength,
                                                  }) =>
                                                      null, // oculta el contador de caracteres
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          'minutos',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(width: 15),
                                        Flexible(
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: 50,
                                            ),
                                            child: TextFormField(
                                              controller: duracionSegController,
                                              enabled: !esFuturo(),
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                              // Validación para limitar el valor a 59 segundos
                                              onChanged: (value) {
                                                if (value.isNotEmpty) {
                                                  final intValue = int.tryParse(
                                                    value,
                                                  );
                                                  if (intValue != null &&
                                                      intValue > 59) {
                                                    // Limitar el valor a 59
                                                    duracionSegController.text =
                                                        '59';
                                                    duracionSegController
                                                            .selection =
                                                        TextSelection.fromPosition(
                                                          TextPosition(
                                                            offset:
                                                                duracionSegController
                                                                    .text
                                                                    .length,
                                                          ),
                                                        );
                                                  }
                                                }
                                              },

                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 10,
                                                    ),
                                                // Borde normal
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Color(
                                                          0xFFd9d9d9,
                                                        ),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                    ),

                                                // Borde al enfocar
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Color(
                                                          0xFF6B6A6A,
                                                        ),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                    ),
                                              ),
                                              maxLength: 2,
                                              buildCounter:
                                                  (
                                                    BuildContext context, {
                                                    required int currentLength,
                                                    required bool isFocused,
                                                    required int? maxLength,
                                                  }) =>
                                                      null, // oculta el contador de caracteres
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          'segundos',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        //TextButton(
                                        //  onPressed: () => Navigator.pop(context),
                                        //  child: const Text('Cancelar'),
                                        //),
                                        //const SizedBox(width: 8),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Guardar evento
                                            // Obtener valores del formulario
                                            final String nota =
                                                notaController.text.trim();
                                            final String enlaceReunion =
                                                enlaceReunionController.text
                                                    .trim();
                                            final String duracionMin =
                                                duracionMinController.text
                                                    .trim();
                                            final String duracionSeg =
                                                duracionSegController.text
                                                    .trim();

                                            final DateTime fechaHora = DateTime(
                                              selectedDate.year,
                                              selectedDate.month,
                                              selectedDate.day,
                                              selectedTime.hour,
                                              selectedTime.minute,
                                            );

                                            final formato = DateFormat(
                                              'dd/MM/yyyy - HH:mm',
                                            );
                                            final String fechaHoraFormateada =
                                                formato.format(fechaHora);

                                            final String tipo = tipoEvento;
                                            // Determinar si es agendada o realizada
                                            final now = DateTime.now();
                                            final String estado =
                                                fechaHora.isAfter(now)
                                                    ? "agendada"
                                                    : "realizada";
                                            final String tipoConEstado =
                                                "$tipo $estado";
                                            EventClient newEvent = EventClient(
                                              title: tipoConEstado,
                                              date: fechaHoraFormateada,
                                              description: nota,
                                              link: enlaceReunion,
                                              duration:
                                                  '$duracionMin:$duracionSeg',
                                            );
                                            // Ejemplo: imprimir todo en consola
                                            print(
                                              '--- Nuevo evento guardado ---',
                                            );
                                            print('Tipo: $tipoConEstado');
                                            print('Fecha y hora: $fechaHora');
                                            print('Nota: $nota');
                                            print(
                                              'Duración: ${duracionMin}m ${duracionSeg}s',
                                            );
                                            print(
                                              'Enlace de reunión: $enlaceReunion',
                                            );
                                            if (globalKey.currentState!
                                                .validate()) {
                                              Navigator.pop(context, newEvent);
                                            }
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
