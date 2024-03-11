import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class SocialmediaRecord extends FirestoreRecord {
  SocialmediaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "telegram" field.
  String? _telegram;
  String get telegram => _telegram ?? '';
  bool hasTelegram() => _telegram != null;

  // "site" field.
  String? _site;
  String get site => _site ?? '';
  bool hasSite() => _site != null;

  // "showCoupon" field.
  bool? _showCoupon;
  bool get showCoupon => _showCoupon ?? false;
  bool hasShowCoupon() => _showCoupon != null;

  // "whatsapp" field.
  String? _whatsapp;
  String get whatsapp => _whatsapp ?? '';
  bool hasWhatsapp() => _whatsapp != null;

  // "viber" field.
  String? _viber;
  String get viber => _viber ?? '';
  bool hasViber() => _viber != null;

  // "messenger" field.
  String? _messenger;
  String get messenger => _messenger ?? '';
  bool hasMessenger() => _messenger != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "facebook" field.
  String? _facebook;
  String get facebook => _facebook ?? '';
  bool hasFacebook() => _facebook != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  void _initializeFields() {
    _telegram = snapshotData['telegram'] as String?;
    _site = snapshotData['site'] as String?;
    _showCoupon = snapshotData['showCoupon'] as bool?;
    _whatsapp = snapshotData['whatsapp'] as String?;
    _viber = snapshotData['viber'] as String?;
    _messenger = snapshotData['messenger'] as String?;
    _instagram = snapshotData['instagram'] as String?;
    _facebook = snapshotData['facebook'] as String?;
    _phone = snapshotData['phone'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('socialmedia');

  static Stream<SocialmediaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SocialmediaRecord.fromSnapshot(s));

  static Future<SocialmediaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SocialmediaRecord.fromSnapshot(s));

  static SocialmediaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SocialmediaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SocialmediaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SocialmediaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SocialmediaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SocialmediaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSocialmediaRecordData({
  String? telegram,
  String? site,
  bool? showCoupon,
  String? whatsapp,
  String? viber,
  String? messenger,
  String? instagram,
  String? facebook,
  String? phone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'telegram': telegram,
      'site': site,
      'showCoupon': showCoupon,
      'whatsapp': whatsapp,
      'viber': viber,
      'messenger': messenger,
      'instagram': instagram,
      'facebook': facebook,
      'phone': phone,
    }.withoutNulls,
  );

  return firestoreData;
}

class SocialmediaRecordDocumentEquality implements Equality<SocialmediaRecord> {
  const SocialmediaRecordDocumentEquality();

  @override
  bool equals(SocialmediaRecord? e1, SocialmediaRecord? e2) {
    return e1?.telegram == e2?.telegram &&
        e1?.site == e2?.site &&
        e1?.showCoupon == e2?.showCoupon &&
        e1?.whatsapp == e2?.whatsapp &&
        e1?.viber == e2?.viber &&
        e1?.messenger == e2?.messenger &&
        e1?.instagram == e2?.instagram &&
        e1?.facebook == e2?.facebook &&
        e1?.phone == e2?.phone;
  }

  @override
  int hash(SocialmediaRecord? e) => const ListEquality().hash([
        e?.telegram,
        e?.site,
        e?.showCoupon,
        e?.whatsapp,
        e?.viber,
        e?.messenger,
        e?.instagram,
        e?.facebook,
        e?.phone
      ]);

  @override
  bool isValidKey(Object? o) => o is SocialmediaRecord;
}
