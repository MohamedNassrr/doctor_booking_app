class ClinicsModel {
  int? id;
  String? name;
  String? image;
  String? location;
  double? rating;

  ClinicsModel({this.id, this.name, this.image, this.rating, this.location});

  factory ClinicsModel.fromJson(Map<String, dynamic> json) => ClinicsModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    image: json['image'] as String?,
    location: json['location'] as String?,
    rating: (json['rating'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'rating': rating,
    'location': location,
  };
}
