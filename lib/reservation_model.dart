class ReservationModel {
  String? dateFrom;
  String? dateTo;
  String? time;
  String? location;
  String? visitPurpose;
  String? patientName;
  String? patientAge;
  String? medicalHistory;
  String? gender;
  String? notes;
  String? cost;
  String? selectedNurseName;
  String? selectedNurseID;

  ReservationModel({
    this.dateFrom,
    this.dateTo,
    this.time,
    this.location,
    this.visitPurpose,
    this.patientName,
    this.patientAge,
    this.medicalHistory,
    this.gender,
    this.notes,
    this.selectedNurseName,
    this.selectedNurseID,
    this.cost,
  });

  ReservationModel.fromJson(Map<String, dynamic> json) {
    dateFrom = json['dateFrom'];
    dateTo = json['dateTo'];
    time = json['time'];
    location = json['location'];
    visitPurpose = json['visitPurpose'];
    patientName = json['patientName'];
    patientAge = json['patientAge'];
    medicalHistory = json['medicalHistory'];
    gender = json['gender'];
    notes = json['notes'];
    selectedNurseName = json['selectedNurseName'];
    selectedNurseID = json['selectedNurseID'];
    cost = json['cost'];
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'dateFrom': dateFrom,
      'dateTo': dateTo,
      'location': location,
      'visitPurpose': visitPurpose,
      'patientName': patientName,
      'patientAge': patientAge,
      'medicalHistory': medicalHistory,
      'gender': gender,
      'notes': notes,
      'selectedNurseName': selectedNurseName,
      'selectedNurseID': selectedNurseID,
      'cost': cost,
    };
  }
}
