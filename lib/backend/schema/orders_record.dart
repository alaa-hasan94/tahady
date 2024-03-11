import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "buyer_email" field.
  String? _buyerEmail;
  String get buyerEmail => _buyerEmail ?? '';
  bool hasBuyerEmail() => _buyerEmail != null;

  // "buyer_name" field.
  String? _buyerName;
  String get buyerName => _buyerName ?? '';
  bool hasBuyerName() => _buyerName != null;

  // "ordered" field.
  bool? _ordered;
  bool get ordered => _ordered ?? false;
  bool hasOrdered() => _ordered != null;

  // "courseCompleted" field.
  bool? _courseCompleted;
  bool get courseCompleted => _courseCompleted ?? false;
  bool hasCourseCompleted() => _courseCompleted != null;

  // "lessonsRef" field.
  DocumentReference? _lessonsRef;
  DocumentReference? get lessonsRef => _lessonsRef;
  bool hasLessonsRef() => _lessonsRef != null;

  // "courseRef" field.
  DocumentReference? _courseRef;
  DocumentReference? get courseRef => _courseRef;
  bool hasCourseRef() => _courseRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _buyerEmail = snapshotData['buyer_email'] as String?;
    _buyerName = snapshotData['buyer_name'] as String?;
    _ordered = snapshotData['ordered'] as bool?;
    _courseCompleted = snapshotData['courseCompleted'] as bool?;
    _lessonsRef = snapshotData['lessonsRef'] as DocumentReference?;
    _courseRef = snapshotData['courseRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? buyerEmail,
  String? buyerName,
  bool? ordered,
  bool? courseCompleted,
  DocumentReference? lessonsRef,
  DocumentReference? courseRef,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'buyer_email': buyerEmail,
      'buyer_name': buyerName,
      'ordered': ordered,
      'courseCompleted': courseCompleted,
      'lessonsRef': lessonsRef,
      'courseRef': courseRef,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.buyerEmail == e2?.buyerEmail &&
        e1?.buyerName == e2?.buyerName &&
        e1?.ordered == e2?.ordered &&
        e1?.courseCompleted == e2?.courseCompleted &&
        e1?.lessonsRef == e2?.lessonsRef &&
        e1?.courseRef == e2?.courseRef &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.buyerEmail,
        e?.buyerName,
        e?.ordered,
        e?.courseCompleted,
        e?.lessonsRef,
        e?.courseRef,
        e?.userRef
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
