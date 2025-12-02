class ClinicsModel {
  int? id;
  String? name;
  String? image;
  int? rating;

  ClinicsModel({this.id, this.name, this.image, this.rating});

  factory ClinicsModel.fromJson(Map<String, dynamic> json) => ClinicsModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    image: json['image'] as String?,
    rating: json['rating'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'rating': rating,
  };
}
