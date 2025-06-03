import 'package:flutter/material.dart';

Widget buildPlantillaDropdown(
  String tipoUsuario,
  void Function(String?) onChanged,
) {
  final plantillas = plantillasPorTipo[tipoUsuario];

  if (plantillas == null || plantillas.isEmpty) return const SizedBox.shrink();

  return Row(
    children: [
      const Text('Plantilla: ', style: TextStyle(fontSize: 15)),
      const SizedBox(width: 10),
      Expanded(
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFd9d9d9)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6B6A6A)),
            ),
            border: OutlineInputBorder(),
          ),
          dropdownColor: Colors.white,
          style: const TextStyle(fontSize: 13),
          items: plantillas,
          onChanged: onChanged,
          validator: (value) {
            if (value != null && !RegExp(r'^[a-zA-Z0-9 ]+').hasMatch(value)) {
              return 'Caracteres no válidos en la plantilla';
            }
            return null;
          },
        ),
      ),
    ],
  );
}

// Mapa de plantillas por tipo de usuario
final Map<String, List<DropdownMenuItem<String>>> plantillasPorTipo = {
  'Contactado': [
    DropdownMenuItem(
      value: 'Plantilla 1',
      child: Text('Beneficios de la suscripción'),
    ),
    DropdownMenuItem(
      value: 'Plantilla 2',
      child: Text('Promoción nuevos suscriptores'),
    ),
  ],
  'Prueba': [
    DropdownMenuItem(
      value: 'Plantilla 3',
      child: Text('Beneficios de la suscripción'),
    ),
    DropdownMenuItem(
      value: 'Plantilla 4',
      child: Text('Promoción para nuevos suscriptores'),
    ),
    DropdownMenuItem(
      value: 'Plantilla 5',
      child: Text('Recordatorio de fin de prueba gratis'),
    ),
  ],
  'Suscrito': [
    DropdownMenuItem(value: 'Plantilla 6', child: Text('Estrenos del mes')),
    DropdownMenuItem(value: 'Plantilla 7', child: Text('Promoción del mes')),
    DropdownMenuItem(
      value: 'Plantilla 8',
      child: Text('Recordatorio de renovación'),
    ),
  ],
};

// Asunto por plantilla
final Map<String, String> asuntoPorPlantilla = {
  'Plantilla 1': 'Conoce los beneficios de tu suscripción',
  'Plantilla 2': '¡Oferta exclusiva para nuevos suscriptores!',
  'Plantilla 3': 'Descubre los beneficios que te esperan',
  'Plantilla 4': 'Bienvenido a una nueva forma de ver contenido',
  'Plantilla 5': 'Tu prueba gratis está por finalizar',
  'Plantilla 6': 'No te pierdas los estrenos de este mes',
  'Plantilla 7': '¡Aprovecha la promoción del mes!',
  'Plantilla 8': 'Recuerda renovar tu suscripción a tiempo',
};

// Contenido por plantilla
final Map<String, String> contenidoPorPlantilla = {
  'Plantilla 1': '''¿Sabías que con una suscripción puedes disfrutar de:
• Acceso ilimitado a miles de películas, series y documentales.
• Contenido exclusivo que no encontrarás en ningún otro lugar.
• Ver en múltiples dispositivos sin interrupciones.
• Descargas para ver offline cuando quieras.
  
No esperes más para sumergirte en un mundo de entretenimiento a tu alcance. ¡Únete hoy y empieza a disfrutar!''',

  'Plantilla 2': '''Queremos darte la bienvenida con una oferta exclusiva:

Disfruta de tu primer mes de suscripción con un 50% de descuento.

Miles de series y películas esperan por ti, desde los últimos estrenos hasta los clásicos favoritos.

No pierdas esta oportunidad única. ¡Activa tu suscripción ahora y vive la experiencia Premium!''',

  'Plantilla 3':
      '''Estás disfrutando tu prueba gratis, pero queremos contarte por qué ser suscriptor es aún mejor:
• Acceso ilimitado a todos nuestros títulos sin interrupciones.
• Contenido exclusivo solo para miembros.
• Funcionalidad para descargar y ver offline.
• Acceso desde todos tus dispositivos favoritos.

No dejes que termine tu prueba sin aprovechar todo lo que tenemos para ofrecerte. ''',

  'Plantilla 4':
      '''Tu prueba gratuita está a punto de terminar y tenemos una promoción especial para ti:

Suscríbete ahora y recibe un 30% de descuento en tu primer mes.

Sigue disfrutando tus series y películas favoritas sin interrupciones y con todos los beneficios exclusivos.''',

  'Plantilla 5':
      '''Queremos recordarte que tu prueba gratuita termina en pocos días.

Para seguir disfrutando de todas las series, películas y documentales sin interrupciones, suscríbete hoy y aprovecha nuestra oferta especial.

No te quedes sin entretenimiento.''',

  'Plantilla 6': '''Prepárate para disfrutar los nuevos lanzamientos:

• Secrets we keep: una historia que te atrapará desde el primer episodio.

• O Agente Secreto: no te pierdas este éxito internacional.

• Seven: para los amantes del suspenso y la acción.

Con tu suscripción, accede a estos y muchos otros títulos nuevos. ¡Que no te los cuenten, vívelos!''',

  'Plantilla 7':
      '''Porque valoramos que seas parte de nuestra plataforma, tenemos una promoción exclusiva para ti:

Renueva tu suscripción ahora y recibe un mes gratis para seguir disfrutando de tu contenido favorito sin interrupciones.

No esperes más, tu entretenimiento continúa.''',

  'Plantilla 8':
      '''Te informamos que tu suscripción se renovará automáticamente en los próximos días.
  
Si deseas mantener el acceso ilimitado a series, películas y documentales, no tienes que hacer nada.

Gracias por elegirnos para tus momentos de entretenimiento.''',
};
