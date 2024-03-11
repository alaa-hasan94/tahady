import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "course_title" field.
  String? _courseTitle;
  String get courseTitle => _courseTitle ?? '';
  bool hasCourseTitle() => _courseTitle != null;

  // "course_description" field.
  String? _courseDescription;
  String get courseDescription => _courseDescription ?? '';
  bool hasCourseDescription() => _courseDescription != null;

  // "course_image" field.
  String? _courseImage;
  String get courseImage => _courseImage ?? '';
  bool hasCourseImage() => _courseImage != null;

  // "course_price" field.
  double? _coursePrice;
  double get coursePrice => _coursePrice ?? 0.0;
  bool hasCoursePrice() => _coursePrice != null;

  // "course_teacher" field.
  String? _courseTeacher;
  String get courseTeacher => _courseTeacher ?? '';
  bool hasCourseTeacher() => _courseTeacher != null;

  // "authors_email" field.
  String? _authorsEmail;
  String get authorsEmail => _authorsEmail ?? '';
  bool hasAuthorsEmail() => _authorsEmail != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "category" field.
  DocumentReference? _category;
  DocumentReference? get category => _category;
  bool hasCategory() => _category != null;

  // "demoVideo" field.
  String? _demoVideo;
  String get demoVideo => _demoVideo ?? '';
  bool hasDemoVideo() => _demoVideo != null;

  void _initializeFields() {
    _courseTitle = snapshotData['course_title'] as String?;
    _courseDescription = snapshotData['course_description'] as String?;
    _courseImage = snapshotData['course_image'] as String?;
    _coursePrice = castToType<double>(snapshotData['course_price']);
    _courseTeacher = snapshotData['course_teacher'] as String?;
    _authorsEmail = snapshotData['authors_email'] as String?;
    _duration = snapshotData['duration'] as String?;
    _link = snapshotData['link'] as String?;
    _category = snapshotData['category'] as DocumentReference?;
    _demoVideo = snapshotData['demoVideo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  String? courseTitle,
  String? courseDescription,
  String? courseImage,
  double? coursePrice,
  String? courseTeacher,
  String? authorsEmail,
  String? duration,
  String? link,
  DocumentReference? category,
  String? demoVideo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'course_title': courseTitle,
      'course_description': courseDescription,
      'course_image': courseImage,
      'course_price': coursePrice,
      'course_teacher': courseTeacher,
      'authors_email': authorsEmail,
      'duration': duration,
      'link': link,
      'category': category,
      'demoVideo': demoVideo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    return e1?.courseTitle == e2?.courseTitle &&
        e1?.courseDescription == e2?.courseDescription &&
        e1?.courseImage == e2?.courseImage &&
        e1?.coursePrice == e2?.coursePrice &&
        e1?.courseTeacher == e2?.courseTeacher &&
        e1?.authorsEmail == e2?.authorsEmail &&
        e1?.duration == e2?.duration &&
        e1?.link == e2?.link &&
        e1?.category == e2?.category &&
        e1?.demoVideo == e2?.demoVideo;
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality().hash([
        e?.courseTitle,
        e?.courseDescription,
        e?.courseImage,
        e?.coursePrice,
        e?.courseTeacher,
        e?.authorsEmail,
        e?.duration,
        e?.link,
        e?.category,
        e?.demoVideo
      ]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
