
import 'dart:convert';

import 'package:contact_app/models/model.dart';
import 'package:firebase_database/firebase_database.dart';

import '../auth/auth_class.dart';

class RealtimeDatabase {
  static final database = FirebaseDatabase.instance.ref();

  //for Posts
  static Future<Stream<DatabaseEvent>?> addPost(Contact contact) async {
    database.child(Auth.currentUserId()).child('contacts').push().set(
        contact.toJson());
  }

  static Future<List<Contact>?> getPost() async {
    List<Contact> item = [];
    Query query = database.ref.child(Auth.currentUserId()).child('contacts');
    DatabaseEvent event = await query.once();
    var snapshot = event.snapshot;
    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var contacts = Contact(name: map['name'], number: map['number']);
      item.add(contacts);
    }
    return item;
  }
}