import 'package:flutter/material.dart';

import '../theme.dart';

class BookCover extends StatelessWidget {
  const BookCover({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    this.borderRadius = 12,
  });

  final String url;
  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) {
            return child;
          }
          return _placeholder(
            child: const SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return _placeholder(
            child: Icon(
              Icons.menu_book_outlined,
              size: width * 0.35,
              color: AppColors.primary,
            ),
          );
        },
      ),
    );
  }

  Widget _placeholder({required Widget child}) {
    return Container(
      width: width,
      height: height,
      color: AppColors.border,
      alignment: Alignment.center,
      child: child,
    );
  }
}
