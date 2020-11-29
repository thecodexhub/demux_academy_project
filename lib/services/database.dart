import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<Stream> getQuestions() async {
    return await FirebaseFirestore.instance.collection('Questions').snapshots();
  }

  Future<Stream> getQuestionsByFilter({String key, String value}) async {
    return FirebaseFirestore.instance
        .collection('Questions')
        .where(key, isEqualTo: value)
        .snapshots();
  }

  Future<Stream> getQuestionsByFilterArray(
      {String key, String arrayValue}) async {
    return FirebaseFirestore.instance
        .collection('Questions')
        .where(key, arrayContains: arrayValue)
        .snapshots();
  }
}
