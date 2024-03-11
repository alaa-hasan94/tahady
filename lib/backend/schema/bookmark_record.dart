import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class BookmarkRecord extends FirestoreRecord {
  BookmarkRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "courseRef" field.
  DocumentReference? _courseRef;
  DocumentReference? get courseRef => _courseRef;
  bool hasCourseRef() => _courseRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _courseRef = snapshotData['courseRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookmark');

  static Stream<BookmarkRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookmarkRecord.fromSnapshot(s));

  static Future<BookmarkRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookmarkRecord.fromSnapshot(s));

  static BookmarkRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookmarkRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookmarkRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookmarkRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookmarkRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookmarkRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookmarkRecordData({
  DocumentReference? courseRef,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'courseRef': courseRef,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookmarkRecordDocumentEquality implements Equality<BookmarkRecord> {
  const BookmarkRecordDocumentEquality();

  @override
  bool equals(BookmarkRecord? e1, BookmarkRecord? e2) {
    return e1?.courseRef == e2?.courseRef && e1?.userRef == e2?.userRef;
  }

  @override
  int hash(BookmarkRecord? e) =>
      const ListEquality().hash([e?.courseRef, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is BookmarkRecord;
}
