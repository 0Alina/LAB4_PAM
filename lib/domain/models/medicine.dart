class Medicine {
  final String name;
  final String image;
  final String price;
  final String unit;
  final String dosage;

  Medicine({
    required this.name,
    required this.image,
    required this.price,
    required this.unit,
    required this.dosage,
  });

  factory Medicine.fromJsonApi(Map<String, dynamic> json) {
    return Medicine(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] ?? '',
      unit: json['unit'] ?? '',
      dosage: json['dosage'] ?? '',
    );
  }
}
