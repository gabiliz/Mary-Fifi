import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final _questionsCollection = _firestore.collection('questions');
final _answersCollection = _firestore.collection('answers');

class MaryFifiService {
  static Stream<QuerySnapshot<Map<String, dynamic>>> getQuestions() {
    return _questionsCollection.snapshots();
  }

  static Future<void> updateQuestion({
    required String id,
    required String title,
  }) async {
    DocumentReference question = _questionsCollection.doc(id);

    Map<String, dynamic> data = {
      'title': title,
    };

    await question
        .update(data)
        .whenComplete(() => print('Pergunta atualizada'))
        .catchError((e) => print(e));
  }

  static Future<void> addQuestion({
    required String title,
    required String? personName,
    required String? personImageURL,
  }) async {
    DocumentReference question = _questionsCollection.doc();

    Map<String, dynamic> data = {
      'title': title,
      'person_name': personName,
      'person_imageURL': personImageURL,
    };

    await question
        .set(data)
        .whenComplete(() => print('Pergunta criada!'))
        .catchError((e) => print(e));
  }

  static Future<void> deleteQuestion({required String id}) async {
    DocumentReference question = _questionsCollection.doc(id);
    await question
        .delete()
        .whenComplete(() => print('Pergunta removida'))
        .catchError((e) => print(e));
  }
}
