class Capsule {
  int? id;
  int userId;
  String status;
  String? openDate;

  Capsule({this.id, required this.userId, required this.status, this.openDate});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'status': status,
      'open_date': openDate,
    };
  }

  factory Capsule.fromMap(Map<String, dynamic> map) {
    return Capsule(
      id: map['id'],
      userId: map['user_id'],
      status: map['status'],
      openDate: map['open_date'],
    );
  }
}
