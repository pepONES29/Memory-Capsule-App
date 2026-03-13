class Content {
  int? id;
  int capsuleId;
  String type;
  String data;

  Content({this.id, required this.capsuleId, required this.type, required this.data});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'capsule_id': capsuleId,
      'type': type,
      'data': data,
    };
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      id: map['id'],
      capsuleId: map['capsule_id'],
      type: map['type'],
      data: map['data'],
    );
  }
}
