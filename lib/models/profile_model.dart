class Profile {
  final int? id; // Make id nullable since it might not always be provided
  final String name;
  final String email;
  final String preferences; // Stored as a JSON-like string

  Profile({
    this.id,
    required this.name,
    required this.email,
    required this.preferences,
  });

  // Convert a Map to a Profile object
  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      preferences: map['preferences'],
    );
  }

  // Convert a Profile object to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'preferences': preferences,
    };
  }
}
