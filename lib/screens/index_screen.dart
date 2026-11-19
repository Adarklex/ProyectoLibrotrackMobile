import 'package:flutter/material.dart';

import '../theme.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  static const String _avatarUrl =
      'https://png.pngtree.com/background/20250120/original/pngtree-virtual-library-with-floating-screens-and-icons-for-ai-coding-science-picture-image_16067683.jpg';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bienvenido a Librotrack',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: const Text(
              'El software es una aplicación para la administración de una biblioteca usando 3 roles (Administrador, Bibliotecario y Usuario). El software permitirá que los tres roles desempeñen su función para el correcto funcionamiento de la biblioteca. El administrador podrá registrar o eliminar libros y, a su vez, gestionar el registro de los bibliotecarios que ingresen. El bibliotecario podrá registrar préstamos y devoluciones de libros, así como sancionar o exonerar a los usuarios que incumplan con la entrega. Finalmente, el usuario/cliente podrá registrarse en el sistema para solicitar libros de la biblioteca y pagar multas.',
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Desarrollado por: Brayan Alexander Sarmiento Reyes',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 28),
          Center(
            child: ClipOval(
              child: Image.network(
                _avatarUrl,
                width: 180,
                height: 180,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 180,
                    height: 180,
                    color: AppColors.accent,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.menu_book_outlined,
                      size: 72,
                      color: AppColors.foreground,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
