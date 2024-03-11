import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CompletedLessonsRecord extends FirestoreRecord {
  CompletedLessonsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "completedLessons" field.
  DocumentReference? _completedLessons;
  DocumentReference? get completedLessons => _completedLessons;
  bool hasCompletedLessons() => _completedLessons != null;

  // "checked" field.
  bool? _checked;
  bool get checked => _checked ?? false;
  bool hasChecked() => _checked != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _completedLessons = snapshotData['completedLessons'] as DocumentReference?;
    _checked = snapshotData['checked'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('completedLessons')
          : FirebaseFirestore.instance.collectionGroup('completedLessons');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('completedLessons').doc(id);

  static Stream<CompletedLessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompletedLessonsRecord.fromSnapshot(s));

  static Future<CompletedLessonsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompletedLessonsRecord.fromSnapshot(s));

  static CompletedLessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompletedLessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompletedLessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompletedLessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompletedLessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompletedLessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompletedLessonsRecordData({
  DocumentReference? completedLessons,
  bool? checked,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'completedLessons': completedLessons,
      'checked': checked,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompletedLessonsRecordDocumentEquality
    implements Equality<CompletedLessonsRecord> {
  const CompletedLessonsRecordDocumentEquality();

  @override
  bool equals(CompletedLessonsRecord? e1, CompletedLessonsRecord? e2) {
    return e1?.completedLessons == e2?.completedLessons &&
        e1?.checked == e2?.checked;
  }

  @override
  int hash(CompletedLessonsRecord? e) =>
      const ListEquality().hash([e?.completedLessons, e?.checked]);

  @override
  bool isValidKey(Object? o) => o is CompletedLessonsRecord;
}
