import 'package:flutter/material.dart';

import '../routes.dart';
import '../theme.dart';
import 'books_screen.dart';
import 'index_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _selectedIndex = 0;

  void _selectTab(int index) {
    Navigator.of(context).pop();
    setState(() => _selectedIndex = index);
  }

  Future<void> _confirmLogout() async {
    final confirmado = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Cerrar sesión'),
          content: const Text('¿Seguro que deseas cerrar sesión?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Cerrar sesión'),
            ),
          ],
        );
      },
    );

    if (confirmado != true || !mounted) {
      return;
    }

    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final esHome = _selectedIndex == 0;

    return Scaffold(
      appBar: AppBar(
        title: esHome
            ? const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'LIBROTRACK  ',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.menu_book_outlined, size: 34),
                ],
              )
            : const Text(
                'Libros',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.primary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.menu_book_outlined,
                    color: AppColors.foreground,
                    size: 44,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'LIBROTRACK',
                    style: TextStyle(
                      color: AppColors.foreground,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Biblioteca digital',
                    style: TextStyle(
                      color: AppColors.foreground.withValues(alpha: 0.8),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              selectedColor: AppColors.primary,
              onTap: () => _selectTab(0),
            ),
            ListTile(
              leading: const Icon(Icons.menu_book_outlined),
              title: const Text('Libros'),
              selected: _selectedIndex == 1,
              selectedColor: AppColors.primary,
              onTap: () => _selectTab(1),
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.error,
              ),
              title: Text(
                'Cerrar sesión',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              onTap: () {
                Navigator.of(context).pop();
                _confirmLogout();
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [IndexScreen(), BooksScreen()],
      ),
    );
  }
}
