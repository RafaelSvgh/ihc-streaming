import 'package:streaming/src/models/client_model.dart';

List<NewClient> newClientsList = [
  NewClient(
    name: 'María López',
    email: 'mlopez@gmail.com',
    origin: 'Instagram',
    campaign: 'Promoción de verano',
    category: 'Tecnología',
  ),
  NewClient(
    name: 'Carlos García',
    email: 'cgarcia@gmail.com',
    origin: 'LinkedIn',
    campaign: 'Descuentos de invierno',
    category: 'Finanzas',
  ),
  NewClient(
    name: 'Ana Torres',
    email: 'atorres@gmail.com',
    origin: 'Twitter',
    campaign: 'Ofertas de primavera',
    category: 'Moda',
  ),
  NewClient(
    name: 'Luis Fernández',
    email: 'lfernandez@gmail.com',
    origin: 'Google Ads',
    campaign: 'Black Friday',
    category: 'Electrónica',
  ),
  NewClient(
    name: 'Laura Martínez',
    email: 'lmartinez@gmail.com',
    origin: 'TikTok',
    campaign: 'Cyber Monday',
    category: 'Hogar',
  ),
];

List<ContactedClient> contactedClientsList = [
  ContactedClient(
    name: 'Juan Pérez',
    email: 'jperez@gmail.com',
    channel: 'Facebook Ads',
    interests: 'Tecnología',
    level: 'Avanzado',
    lastContact: '14/05/2025',
    origin: 'Facebook',
  ),
  ContactedClient(
    name: 'Pedro Sánchez',
    email: 'psanchez@gmail.com',
    channel: 'Email',
    interests: 'Tecnología',
    level: 'Alto',
    lastContact: '14/05/2025',
    origin: 'Facebook',
  ),
  ContactedClient(
    name: 'Lucía Gómez',
    email: 'lgomez@gmail.com',
    channel: 'Chat',
    interests: 'Moda',
    level: 'Medio',
    lastContact: '14/05/2025',
    origin: 'Facebook',
  ),
  ContactedClient(
    name: 'Roberto Díaz',
    email: 'rdiaz@gmail.com',
    channel: 'Llamada',
    interests: 'Deportes',
    level: 'Bajo',
    lastContact: '14/05/2025',
    origin: 'Facebook',
  ),
  ContactedClient(
    name: 'Elena Martínez',
    email: 'emartinez@gmail.com',
    channel: 'WhatsApp',
    interests: 'Viajes',
    level: 'Alto',
    lastContact: '14/05/2025',
    origin: 'Facebook',
  ),
  ContactedClient(
    name: 'Javier Torres',
    email: 'jtorres@gmail.com',
    channel: 'Email',
    interests: 'Música',
    level: 'Medio',
  ),
  ContactedClient(
    name: 'Ana López',
    email: 'alopez@gmail.com',
    channel: 'Chat',
    interests: 'Cine',
    level: 'Bajo',
    lastContact: '14/05/2025',
    origin: 'Facebook',
  ),
  ContactedClient(
    name: 'Carlos Ruiz',
    email: 'cruiz@gmail.com',
    channel: 'Llamada',
    interests: 'Tecnología',
    level: 'Alto',
    lastContact: '14/05/2025',
    origin: 'Facebook',
  ),
];

List<TrialClient> trialClientsList = [
  TrialClient(
    name: 'Ana Gómez',
    email: 'agomez@gmail.com',
    platform: 'Netflix',
    duration: '1 mes',
    startDate: '01/05/2025',
    lastContact: '10/05/2025',
    origin: 'Google Ads',
  ),
  TrialClient(
    name: 'Andrés Ramírez',
    email: 'aramirez@gmail.com',
    platform: 'Amazon Prime',
    duration: '1 Mes',
    startDate: '01/06/2025',
  ),
  TrialClient(
    name: 'Sofía Torres',
    email: 'storres@gmail.com',
    platform: 'HBO Max',
    duration: '3 Semanas',
    startDate: '10/06/2025',
  ),
  TrialClient(
    name: 'Miguel Fernández',
    email: 'mfernandez@gmail.com',
    platform: 'Netflix',
    duration: '2 Semanas',
    startDate: '15/06/2025',
  ),
  TrialClient(
    name: 'Laura García',
    email: 'lgarcia@gmail.com',
    platform: 'Disney+',
    duration: '1 Mes',
    startDate: '20/06/2025',
  ),
  TrialClient(
    name: 'Daniel Pérez',
    email: 'dperez@gmail.com',
    platform: 'Apple TV+',
    duration: '3 Semanas',
    startDate: '25/06/2025',
  ),
  TrialClient(
    name: 'Marta Sánchez',
    email: 'msanchez@gmail.com',
    platform: 'Hulu',
    duration: '2 Semanas',
    startDate: '30/06/2025',
  ),
  TrialClient(
    name: 'Luis Moreno',
    email: 'lmoreno@gmail.com',
    platform: 'Amazon Prime',
    duration: '1 Mes',
    startDate: '05/07/2025',
  ),
];

List<SubscribedClient> subscribedClientsList = [
  SubscribedClient(
    name: 'Carlos Ruiz',
    email: 'cruiz@gmail.com',
    platform: 'Spotify',
    plan: 'Premium',
    startDate: '01/01/2025',
    endDate: '01/01/2026',
    lastContact: '15/05/2025',
    origin: 'Instagram',
  ),
  SubscribedClient(
    name: 'Javier López',
    email: 'jlopez@gmail.com',
    platform: 'Hulu',
    plan: 'Premium',
    startDate: '01/07/2025',
    endDate: '01/07/2026',
  ),
  SubscribedClient(
    name: 'Marta Díaz',
    email: 'mdiaz@gmail.com',
    platform: 'Apple TV+',
    plan: 'Básico',
    startDate: '15/07/2025',
    endDate: '15/07/2026',
  ),
  SubscribedClient(
    name: 'Fernando Ruiz',
    email: 'fruiz@gmail.com',
    platform: 'Netflix',
    plan: 'Estandar',
    startDate: '01/08/2025',
    endDate: '01/08/2026',
  ),
  SubscribedClient(
    name: 'Isabel Fernández',
    email: 'ifernandez@gmail.com',
    platform: 'Disney+',
    plan: 'Premium',
    startDate: '15/08/2025',
    endDate: '15/08/2026',
  ),
  SubscribedClient(
    name: 'Clara Moreno',
    email: 'cmoreno@gmail.com',
    platform: 'HBO Max',
    plan: 'Básico',
    startDate: '01/09/2025',
    endDate: '01/09/2026',
  ),
  SubscribedClient(
    name: 'Roberto Díaz',
    email: 'rdiaz@gmail.com',
    platform: 'Amazon Prime',
    plan: 'Estandar',
    startDate: '15/09/2025',
    endDate: '15/09/2026',
  ),
  SubscribedClient(
    name: 'Elena Martínez',
    email: 'emartinez@gmail.com',
    platform: 'Hulu',
    plan: 'Premium',
    startDate: '01/10/2025',
    endDate: '01/10/2026',
  ),
];

List<DiscardedClient> discardedClientsList = [
  DiscardedClient(
    name: 'Lucía Fernández',
    email: 'lfernandez@gmail.com',
    origin: 'LinkedIn',
    channel: 'Email',
    reason: 'No interesado',
    lastContact: '05/05/2025',
  ),
  DiscardedClient(
    name: 'Fernando Ruiz',
    email: 'fruiz@gmail.com',
    origin: 'Facebook Ads',
    channel: 'Mensaje',
    reason: 'No tiene tiempo',
  ),
  DiscardedClient(
    name: 'Isabel Fernández',
    email: 'ifernandez@gmail.com',
    origin: 'Instagram Ads',
    channel: 'Llamada',
    reason: 'No le interesa',
  ),
  DiscardedClient(
    name: 'Clara Moreno',
    email: 'cmoreno@gmail.com',
    origin: 'Google Ads',
    channel: 'Email',
    reason: 'No está interesado',
  ),
  DiscardedClient(
    name: 'Roberto Díaz',
    email: 'rdiaz@gmail.com',
    origin: 'LinkedIn Ads',
    channel: 'Chat',
    reason: 'No tiene presupuesto',
  ),
  DiscardedClient(
    name: 'Elena Martínez',
    email: 'emartinez@gmail.com',
    origin: 'Twitter Ads',
    channel: 'Llamada',
    reason: 'No es el momento adecuado',
  ),
  DiscardedClient(
    name: 'Javier Torres',
    email: 'jtorres@gmail.com',
    origin: 'TikTok Ads',
    channel: 'Mensaje',
    reason: 'No le interesa',
  ),
  DiscardedClient(
    name: 'Ana López',
    email: 'alopez@gmail.com',
    origin: 'YouTube Ads',
    channel: 'Email',
    reason: 'No tiene tiempo',
  ),
];

List<EventClient> eventClientsList = [
  EventClient(
    title: 'Reunión de seguimiento',
    date: '20/06/2025 - 10:00',
    description: 'Revisar progreso de la suscripción',
    link: 'https://www.example.com/evento2',
    duration: '30 minutos',
  ),
];

List<NoteClient> noteClientsList = [
  NoteClient(content: 'Enviar recordatorio de pago', date: '20/06/2025'),
  NoteClient(content: 'Revisar feedback del cliente', date: '21/06/2025'),
];

List<MessageClient> messageClientsList = [
  MessageClient(
    name: 'Clara Moreno',
    email: 'cmoreno@gmail.com',
    subject: 'Duda sobre facturación',
    content:
        'Hola Clara, gracias por contactarnos. Te ayudaremos con tu consulta.',
    date: '20/06/2025',
  ),
];
