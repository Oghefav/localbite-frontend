class Meal {
  String? id;
  String? title;
  String? description;
  int? units;
  bool? availabilityStatus;
  String? chef;
  double? price;
  String? image;

  Meal({
    this.id,
    required this.title,
    required this.description,
    required this.units,
    required this.availabilityStatus,
    required this.chef,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'units': units,
      'availabitity_status': availabilityStatus,
      'chef': chef,
      'price': price,
      'image': image,
    };
  }
}
