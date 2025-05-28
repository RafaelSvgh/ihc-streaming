import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:streaming/src/router/go_router.dart';

class HomeLayout extends StatefulWidget {
  final Widget child;

  const HomeLayout({super.key, required this.child});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool isExpanded = true;

  void toggleSidebar() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  // int _getSelectedIndex(String location) {
  //   if (location.startsWith('/inicio')) return 0;
  //   if (location.startsWith('/prueba')) return 1;
  //   return -1;
  // }

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();
    print(currentRoute);
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isExpanded ? 260 : 80,
            color: Color(0xff34538C),
            child: Column(
              children: [
                const SizedBox(height: 4),
                IconButton(
                  icon: Icon(
                    isExpanded ? Icons.monitor : Icons.monitor,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: toggleSidebar,
                ),
                const SizedBox(height: 20),
                ...menuItems.map(
                  (item) => _buildMenuItem(
                    icon: item['icon'] as IconData,
                    label: item['label'] as String,
                    route: item['route'] as String,
                    isSelected: currentRoute.startsWith(
                      item['route'] as String,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Main Content
          Expanded(child: widget.child),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required String route,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () => context.go(route),
      child: Container(
        color: isSelected ? Color(0x40d9d9d9) : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            if (isExpanded) ...[
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
