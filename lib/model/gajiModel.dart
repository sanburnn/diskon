class GajiModel {
  final int id;
  final String userId;
  final String title;

  GajiModel({required this.id, required this.userId, required this.title});

  factory GajiModel.fromJson(Map<String, dynamic> json) {
    return GajiModel(
        id: json['id'], userId: json['userId'], title: json['title']);
  }
}
