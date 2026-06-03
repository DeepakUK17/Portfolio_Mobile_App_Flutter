class Project {
  const Project({
    required this.title,
    required this.year,
    required this.description,
    required this.imagePath,
    required this.skills,
    required this.githubUrl,
    this.liveDemoUrl,
  });

  final String title;
  final String year;
  final String description;
  final String imagePath;
  final List<String> skills;
  final String githubUrl;
  final String? liveDemoUrl;
}
