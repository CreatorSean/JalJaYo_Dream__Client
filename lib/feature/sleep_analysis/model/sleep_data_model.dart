class SleepDataModel {
  int modelName;
  String sleepDate;
  String startTime;
  String endTime;
  String sleepFile;
  int sleepWaso;
  SleepDataModel({
    required this.modelName,
    required this.sleepDate,
    required this.startTime,
    required this.endTime,
    required this.sleepFile,
    required this.sleepWaso,
  });

  SleepDataModel.fromJson(Map<String, dynamic> json)
      : modelName = json["modelName"],
        sleepDate = json["sleepDate"],
        startTime = json["startTime"],
        endTime = json["endTime"],
        sleepFile = json["sleepFile"],
        sleepWaso = json["sleepWaso"];

  Map<String, dynamic> toMap() {
    return {
      "modelName": modelName,
      "sleepDate": sleepDate,
      "startTime": startTime,
      "endTime": endTime,
      "sleepFile": sleepFile,
      "sleepWaso": sleepWaso,
    };
  }

  // String jsonString = await rootBundle.loadString('json/sleepdatas.json');
  // final jsonResponse = json.decode(jsonString);
}
