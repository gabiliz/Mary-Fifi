import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final _questionsCollection = _firestore.collection('questions');
final _answersCollection = _firestore.collection('answers');

class MaryFifiService {
  static Stream<QuerySnapshot<Map<String, dynamic>>> getQuestions() {
    return _questionsCollection.snapshots();
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

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAnswers({
    required String questionId,
  }) {
      return _answersCollection.where('question_id', isEqualTo: questionId).snapshots();
  }

  static Future<void> addAnswer({
    required String questionId,
    required String title,
    required String? personName,
    required String? personImageURL,
  }) async {
    DocumentReference question = _answersCollection.doc();

    Map<String, dynamic> data = {
      'question_id': questionId,
      'title': title,
      'person_name': personName,
      'person_imageURL': personImageURL,
    };

    await question
        .set(data)
        .whenComplete(() => print('Resposta criada!'))
        .catchError((e) => print(e));
  }

  static Future<void> deleteAnswer({required String id}) async {
    DocumentReference answer = _answersCollection.doc(id);
    await answer
        .delete()
        .whenComplete(() => print('Resposta removida'))
        .catchError((e) => print(e));
  }
}
