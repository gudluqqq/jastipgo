class UserLogin {
  final int? id; // Make id optional
  final String nama;
  final String email;

  UserLogin({this.id, required this.nama, required this.email});

  Map<String, dynamic> toMap() {
    return {'nama': nama, 'email': email};
  }

  factory UserLogin.fromMap(Map<String, dynamic> map) {
    return UserLogin(
      id: map['id'] as int?,
      nama: map['nama'] as String,
      email: map['email'] as String,
    );
  }
}
