class Certificate {
  const Certificate({
    required this.title,
    required this.issuer,
    required this.date,
    required this.imagePath,
  });

  final String title;
  final String issuer;
  final String date;
  final String imagePath;
}
