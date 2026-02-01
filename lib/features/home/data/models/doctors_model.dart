class DoctorsModel {
  int? id;
  String? name;
  int? categoryId;
  int? clinicId;
  String? image;
  double? rating;
  int? experience;

  DoctorsModel({
    this.id,
    this.name,
    this.categoryId,
    this.clinicId,
    this.image,
    this.rating,
    this.experience,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> json) => DoctorsModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    categoryId: json['categoryId'] as int?,
    clinicId: json['clinicId'] as int?,
    image: json['image'] as String?,
    rating: (json['rating'] as num?)?.toDouble(),
    experience: json['experience'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'categoryId': categoryId,
    'clinicId': clinicId,
    'image': image,
    'rating': rating,
    'experience': experience,
  };
}
