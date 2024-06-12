import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "pax" field.
  int? _pax;
  int get pax => _pax ?? 0;
  bool hasPax() => _pax != null;

  // "packageDeal" field.
  String? _packageDeal;
  String get packageDeal => _packageDeal ?? '';
  bool hasPackageDeal() => _packageDeal != null;

  // "destination" field.
  DocumentReference? _destination;
  DocumentReference? get destination => _destination;
  bool hasDestination() => _destination != null;

  // "referenceID" field.
  String? _referenceID;
  String get referenceID => _referenceID ?? '';
  bool hasReferenceID() => _referenceID != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _country = snapshotData['country'] as String?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
    _pax = castToType<int>(snapshotData['pax']);
    _packageDeal = snapshotData['packageDeal'] as String?;
    _destination = snapshotData['destination'] as DocumentReference?;
    _referenceID = snapshotData['referenceID'] as String?;
    _status = snapshotData['status'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('orders')
          : FirebaseFirestore.instance.collectionGroup('orders');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('orders').doc(id);

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
  String? country,
  DateTime? startDate,
  DateTime? endDate,
  int? pax,
  String? packageDeal,
  DocumentReference? destination,
  String? referenceID,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'country': country,
      'startDate': startDate,
      'endDate': endDate,
      'pax': pax,
      'packageDeal': packageDeal,
      'destination': destination,
      'referenceID': referenceID,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.country == e2?.country &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.pax == e2?.pax &&
        e1?.packageDeal == e2?.packageDeal &&
        e1?.destination == e2?.destination &&
        e1?.referenceID == e2?.referenceID &&
        e1?.status == e2?.status;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.country,
        e?.startDate,
        e?.endDate,
        e?.pax,
        e?.packageDeal,
        e?.destination,
        e?.referenceID,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
