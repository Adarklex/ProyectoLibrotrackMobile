class Book {
  const Book({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.anio,
    required this.genero,
    required this.portadaUrl,
    required this.sinopsis,
  });

  final String id;
  final String titulo;
  final String autor;
  final int anio;
  final String genero;
  final String portadaUrl;
  final String sinopsis;
}
