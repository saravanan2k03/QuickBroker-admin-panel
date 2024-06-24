// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Usermodel {
  final String UID;
  final String AVATAR;
  final String Name;
  final String Email;
  final String MOBILENO;

  Usermodel({
    required this.UID,
    required this.AVATAR,
    required this.Name,
    required this.Email,
    required this.MOBILENO,
  });

  Usermodel copyWith({
    String? UID,
    String? AVATAR,
    String? Name,
    String? Email,
    String? MOBILENO,
  }) {
    return Usermodel(
      UID: UID ?? this.UID,
      AVATAR: AVATAR ?? this.AVATAR,
      Name: Name ?? this.Name,
      Email: Email ?? this.Email,
      MOBILENO: MOBILENO ?? this.MOBILENO,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'UID': UID,
      'AVATAR': AVATAR,
      'Name': Name,
      'Email': Email,
      'MOBILENO': MOBILENO,
    };
  }

  factory Usermodel.fromMap(Map<String, dynamic> map) {
    return Usermodel(
      UID: map['UID'] as String,
      AVATAR: map['AVATAR'] as String,
      Name: map['Name'] as String,
      Email: map['Email'] as String,
      MOBILENO: map['MOBILENO'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Usermodel.fromJson(String source) =>
      Usermodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Usermodel(UID: $UID, AVATAR: $AVATAR, Name: $Name, Email: $Email, MOBILENO: $MOBILENO)';
  }

  @override
  bool operator ==(covariant Usermodel other) {
    if (identical(this, other)) return true;

    return other.UID == UID &&
        other.AVATAR == AVATAR &&
        other.Name == Name &&
        other.Email == Email &&
        other.MOBILENO == MOBILENO;
  }

  @override
  int get hashCode {
    return UID.hashCode ^
        AVATAR.hashCode ^
        Name.hashCode ^
        Email.hashCode ^
        MOBILENO.hashCode;
  }
}
