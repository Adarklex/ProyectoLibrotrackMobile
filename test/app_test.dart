import 'package:app3/app.dart';
import 'package:app3/data/mock_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('los datos mock incluyen 5 libros completos', () {
    expect(mockBooks, hasLength(5));

    for (final book in mockBooks) {
      expect(book.titulo, isNotEmpty);
      expect(book.autor, isNotEmpty);
      expect(book.genero, isNotEmpty);
      expect(book.anio, greaterThan(0));
      expect(book.portadaUrl, startsWith('https://'));
      expect(book.sinopsis, isNotEmpty);
    }
  });

  testWidgets('el login muestra un error con credenciales incorrectas', (
    tester,
  ) async {
    await tester.pumpWidget(const LibroTrackApp());

    final campos = find.byType(TextFormField);
    expect(campos, findsNWidgets(2));

    await tester.enterText(campos.at(0), 'persona@librotrack.com');
    await tester.enterText(campos.at(1), 'incorrecta');
    await tester.tap(find.widgetWithText(FilledButton, 'Iniciar sesión'));
    await tester.pumpAndSettle();

    expect(find.textContaining('incorrectos'), findsOneWidget);
  });
}
