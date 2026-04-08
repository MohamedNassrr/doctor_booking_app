class AppointmentsInputModel {
  DateTime? pickedDate;
  String? selectedHour;
  String? docName;
  String? docImage;
  String? docSpec;
  String? clinicLocation;

  AppointmentsInputModel({
    required this.pickedDate,
    required this.selectedHour,
    required this.docName,
    required this.docImage,
    required this.docSpec,
    required this.clinicLocation,
  });
  AppointmentsInputModel.fromJson(Map<String, dynamic> json) {
    pickedDate = json['pickedDate'];
    selectedHour = json['selectedHour'];
    docName = json['docName'];
    docImage = json['docImage'];
    docSpec = json['docSpec'];
    clinicLocation = json['clinicLocation'];
  }

  Map<String, dynamic> toMap() {
    return {
      'pickedDate': pickedDate,
      'selectedHour': selectedHour,
      'docName': docName,
      'docImage': docImage,
      'docSpec': docSpec,
      'clinicLocation': clinicLocation,
    };
  }
}
