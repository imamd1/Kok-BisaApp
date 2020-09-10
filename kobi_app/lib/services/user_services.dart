part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(User user) async {
    _userCollection.doc(user.id).set({
      'name': user.name,
      'email': user.email,
      'profilePicture': user.profilePicture ?? ""
    });
  }

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return User(id, snapshot.data()['email'],
        profilePicture: snapshot.data()['profilePicture'],
        name: snapshot.data()['name']);
  }
}
