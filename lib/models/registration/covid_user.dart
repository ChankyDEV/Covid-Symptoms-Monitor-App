import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CovidUser {
   String id;
   String name;
   String mail;
 
  CovidUser({
    @required this.id,
    @required this.name,
    @required this.mail,
  });

  factory CovidUser.fromFirestore(DocumentSnapshot doc) {
    return CovidUser.fromMap(doc.data());
  }


  CovidUser copyWith({
    String id,
    String name,
    String mail,
  }) {
    return CovidUser(
      id: id ?? this.id,
      name: name ?? this.name,
      mail: mail ?? this.mail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mail': mail,
    };
  }

  factory CovidUser.fromMap(Map<String, dynamic> map) {
    return CovidUser(
      id: map['id'],
      name: map['name'],
      mail: map['mail'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CovidUser.fromJson(String source) => CovidUser.fromMap(json.decode(source));

  @override
  String toString() => 'CovidUser(id: $id, name: $name, mail: $mail)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CovidUser &&
      other.id == id &&
      other.name == name &&
      other.mail == mail;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ mail.hashCode;
}
