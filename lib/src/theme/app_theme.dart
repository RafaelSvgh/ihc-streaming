import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF34538C);
  static const secondary = Color(0xFF7490C4);
  static const newClient = Color(0xFFE8E8E8);
  static const contactedClient = Color(0xFFDAE3F4);
  static const trialClient = Color(0xFFFBBF24);
  static const subscribedClient = Color(0xFF22C55E);
  static const discardedClient = Color(0xFFEF4545);
}

class TextStylesFull {
  static const title = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Color(0xff34538C),
  );
  static const subtitle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  static const titleProspect = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const clientName = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static const clientEmail = TextStyle(
    fontSize: 12,
    overflow: TextOverflow.ellipsis,
  );
  static const clientBody = TextStyle();
}

class TextStylesMedium {
  static const title = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Color(0xff34538C),
  );
  static const subtitle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  static const titleProspect = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const clientName = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  static const clientEmail = TextStyle(
    fontSize: 10,
    overflow: TextOverflow.ellipsis,
  );
  static const clientBody = TextStyle();
}

class AppDimensions {
  static const double sidebarWidthExpanded = 260.0;
  static const double sidebarWidthCollapsed = 80.0;
  static const double appBarHeight = 80.0;
}
