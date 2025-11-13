class Speciality {
  final int id;
  final String name;
  final String icon;

  Speciality({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory Speciality.fromJsonApi(Map<String, dynamic> json) {
    return Speciality(
      id: json['id'],
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
    );
  }
}
