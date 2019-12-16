import 'package:algolia/algolia.dart';
import '../../models/student.dart';

class AlogoliaService {
  AlogoliaService._privateConstructor();

  static final AlogoliaService instance = AlogoliaService._privateConstructor();
  static final algolisServices = AlogoliaService.instance;

  final Algolia _algolia = Algolia.init(
    applicationId: '3QP67BLU0T',
    apiKey: '5cf4a935655079910682450b8c7b69f2',
  );

  AlgoliaIndexReference get _students => _algolia.instance.index('students');
  Future<List<Student>> performProvinceSearch({text: String}) async {
    final query = _students.search(text);
    final snap = await query.getObjects();
    final students = snap.hits
        .map((students) => Student.fromJSON(students.data))
        .toList();
    return students;
  }
}