// -------------------- DATA MODEL --------------------
class A1Data {
  final String message;
  A1Data({required this.message});

  factory A1Data.fromJson(Map<String, dynamic> json) {
    return A1Data(message: json['message']);
  }

  Map<String, dynamic> toJson() => {'message': message};
}