import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonsRecord extends FirestoreRecord {
  LessonsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "vedioUrl" field.
  String? _vedioUrl;
  String get vedioUrl => _vedioUrl ?? '';
  bool hasVedioUrl() => _vedioUrl != null;

  // "courseRef" field.
  DocumentReference? _courseRef;
  DocumentReference? get courseRef => _courseRef;
  bool hasCourseRef() => _courseRef != null;

  // "lessonNumber" field.
  int? _lessonNumber;
  int get lessonNumber => _lessonNumber ?? 0;
  bool hasLessonNumber() => _lessonNumber != null;

  // "youtube" field.
  String? _youtube;
  String get youtube => _youtube ?? '';
  bool hasYoutube() => _youtube != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _vedioUrl = snapshotData['vedioUrl'] as String?;
    _courseRef = snapshotData['courseRef'] as DocumentReference?;
    _lessonNumber = castToType<int>(snapshotData['lessonNumber']);
    _youtube = snapshotData['youtube'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lessons');

  static Stream<LessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonsRecord.fromSnapshot(s));

  static Future<LessonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonsRecord.fromSnapshot(s));

  static LessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonsRecordData({
  String? name,
  String? description,
  String? vedioUrl,
  DocumentReference? courseRef,
  int? lessonNumber,
  String? youtube,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'vedioUrl': vedioUrl,
      'courseRef': courseRef,
      'lessonNumber': lessonNumber,
      'youtube': youtube,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonsRecordDocumentEquality implements Equality<LessonsRecord> {
  const LessonsRecordDocumentEquality();

  @override
  bool equals(LessonsRecord? e1, LessonsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.vedioUrl == e2?.vedioUrl &&
        e1?.courseRef == e2?.courseRef &&
        e1?.lessonNumber == e2?.lessonNumber &&
        e1?.youtube == e2?.youtube;
  }

  @override
  int hash(LessonsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.vedioUrl,
        e?.courseRef,
        e?.lessonNumber,
        e?.youtube
      ]);

  @override
  bool isValidKey(Object? o) => o is LessonsRecord;
}
