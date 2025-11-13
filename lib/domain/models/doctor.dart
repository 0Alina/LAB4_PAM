class Doctor {
  final int id;
  final String name;
  final String speciality;
  final double rating;
  final String image;

  Doctor({
    required this.id,
    required this.name,
    required this.speciality,
    required this.rating,
    required this.image,
  });

  factory Doctor.fromJsonApi(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'] ?? '',
      speciality: json['speciality'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      image: json['image'] ?? '',
    );
  }
}
