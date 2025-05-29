import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class NotaPage extends StatelessWidget {
  const NotaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Nota Page'),
          ElevatedButton(
            onPressed: () => showFloatingForm(context),
            child: const Text('Nueva nota'),
          ),
        ],
      ),
    );
  }
}

void showFloatingForm(BuildContext context) {

  TextEditingController notaController = TextEditingController();
  

  showDialog(
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
                          Container(
                            height: 50,
                            //margin: const EdgeInsets.all(16.0),
                            decoration: const BoxDecoration(
                              color: Color(0xFFDAE3F4),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Nueva nota',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  padding: EdgeInsets.zero, 
                                  constraints: const BoxConstraints(),
                                  onPressed: () => Navigator.of(context).pop(),
                                )
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
                                          color: Color(0xFFd9d9d9), // Color del borde cuando está desactivado
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF6B6A6A), // Color del borde cuando está enfocado
                                          //width: 2.0,
                                        ),
                                      ),
                                      border: OutlineInputBorder(),
                                       // Bordes por defecto
                                    ),
                                    maxLines: 8,
                                    style: const TextStyle(
                                      fontSize: 13, 
                                    ),
                                  ),


                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          // Guardar evento
                                          // Obtener valores del formulario
                                          final String nota = notaController.text.trim();
                                          final DateTime now = DateTime.now();


                                          // Ejemplo: imprimir todo en consola
                                          print('--- Nueva nota guardada ---');
                                          print('Nota: $nota');
                                          print('Fecha: $now');


                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xff34538C), // fondo
                                          foregroundColor: Colors.white, // texto e íconos
                                          elevation: 3, // sombra
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8), // bordes redondeados
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                        ),
                                       // child: const Text('Guardar', ),
                                       child: Icon(
                                          Icons.save,
                                          size: 20,
                                          color: Colors.white,)
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
        ],
      );
    },
  );
}