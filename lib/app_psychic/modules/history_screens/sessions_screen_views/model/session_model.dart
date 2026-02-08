// Model (tomader existing model ta thik ache)
class SessionModel {
  String? name;
  String? imageUrl;
  String? time;
  String? image;
  String? taka;

  SessionModel({
    this.name,
    this.imageUrl,
    this.time,
    this.image,
    this.taka,
  });

  // API response theke parse korar jonno (optional)
  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
      time: json['time'],
      image: json['image'],
      taka: json['taka'],
    );
  }

  // API te pathanor jonno (optional)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'time': time,
      'image': image,
      'taka': taka,
    };
  }
}