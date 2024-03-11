import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "usernameA" field.
  String? _usernameA;
  String get usernameA => _usernameA ?? '';
  bool hasUsernameA() => _usernameA != null;

  // "userphotoA" field.
  String? _userphotoA;
  String get userphotoA => _userphotoA ?? '';
  bool hasUserphotoA() => _userphotoA != null;

  // "commentA" field.
  String? _commentA;
  String get commentA => _commentA ?? '';
  bool hasCommentA() => _commentA != null;

  // "usernameB" field.
  String? _usernameB;
  String get usernameB => _usernameB ?? '';
  bool hasUsernameB() => _usernameB != null;

  // "userphotoB" field.
  String? _userphotoB;
  String get userphotoB => _userphotoB ?? '';
  bool hasUserphotoB() => _userphotoB != null;

  // "commentB" field.
  String? _commentB;
  String get commentB => _commentB ?? '';
  bool hasCommentB() => _commentB != null;

  // "course" field.
  DocumentReference? _course;
  DocumentReference? get course => _course;
  bool hasCourse() => _course != null;

  void _initializeFields() {
    _usernameA = snapshotData['usernameA'] as String?;
    _userphotoA = snapshotData['userphotoA'] as String?;
    _commentA = snapshotData['commentA'] as String?;
    _usernameB = snapshotData['usernameB'] as String?;
    _userphotoB = snapshotData['userphotoB'] as String?;
    _commentB = snapshotData['commentB'] as String?;
    _course = snapshotData['course'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  String? usernameA,
  String? userphotoA,
  String? commentA,
  String? usernameB,
  String? userphotoB,
  String? commentB,
  DocumentReference? course,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usernameA': usernameA,
      'userphotoA': userphotoA,
      'commentA': commentA,
      'usernameB': usernameB,
      'userphotoB': userphotoB,
      'commentB': commentB,
      'course': course,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    return e1?.usernameA == e2?.usernameA &&
        e1?.userphotoA == e2?.userphotoA &&
        e1?.commentA == e2?.commentA &&
        e1?.usernameB == e2?.usernameB &&
        e1?.userphotoB == e2?.userphotoB &&
        e1?.commentB == e2?.commentB &&
        e1?.course == e2?.course;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.usernameA,
        e?.userphotoA,
        e?.commentA,
        e?.usernameB,
        e?.userphotoB,
        e?.commentB,
        e?.course
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
