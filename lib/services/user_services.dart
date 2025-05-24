import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  FirebaseFirestore fs = FirebaseFirestore.instance;

  late CollectionReference user;
  UserService() {
    user = fs.collection('user');
  }
  Future<void> addUserWithAutoID(String nama, String pass) {
    return user.add({
      'namaku': nama,
      'passbjirr': pass,
    }).then(
      (value) => print('User berhasil dibuat dengan ID: ${value.id}'),
    );
  }

  Future<void> getAllUserData() async {
    try {
      QuerySnapshot queryResult = await user.get();
      queryResult.docs.forEach(
        (element) {
          print("ID User: ${element.id}");
          print("Nama User: ${element['namaku']}");
          print("Pass User: ${element['passbjirr']}");
        },
      );
    } catch (e) {
      print('gagal get data $e');
    }
  }
  Future<void> updateUser(String uid, String newNama) {
    return user.doc(uid).update({'namaku': newNama});
  }
    Future<void> deleteUser(String uid) {
    return user.doc(uid).delete();
  }
}
