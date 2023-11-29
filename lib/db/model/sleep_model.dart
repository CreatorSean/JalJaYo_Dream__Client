class SleepModel {
  int id;
  String sleepDate;
  int sleepTime;
  int hrAvg;
  int waso;
  SleepModel({
    required this.id,
    required this.sleepDate,
    required this.sleepTime,
    required this.hrAvg,
    required this.waso,
  });

  SleepModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        sleepDate = json["sleepDate"],
        sleepTime = json["sleepTime"],
        hrAvg = json["hrAvg"],
        waso = json["waso"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "sleepDate": sleepDate,
      "sleepTime": sleepTime,
      "hrAvg": hrAvg,
      "waso": waso,
    };
  }
}
