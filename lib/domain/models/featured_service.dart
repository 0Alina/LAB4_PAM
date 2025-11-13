class FeaturedService {
  final String title;
  final String image;

  FeaturedService({
    required this.title,
    required this.image,
  });

  factory FeaturedService.fromJsonApi(Map<String, dynamic> json) {
    return FeaturedService(
      title: json['title'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
