import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PackagesRecord extends FirestoreRecord {
  PackagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "destination" field.
  DocumentReference? _destination;
  DocumentReference? get destination => _destination;
  bool hasDestination() => _destination != null;

  // "pax" field.
  int? _pax;
  int get pax => _pax ?? 0;
  bool hasPax() => _pax != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "stay_period" field.
  int? _stayPeriod;
  int get stayPeriod => _stayPeriod ?? 0;
  bool hasStayPeriod() => _stayPeriod != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _destination = snapshotData['destination'] as DocumentReference?;
    _pax = castToType<int>(snapshotData['pax']);
    _price = castToType<double>(snapshotData['price']);
    _details = snapshotData['details'] as String?;
    _images = getDataList(snapshotData['images']);
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _stayPeriod = castToType<int>(snapshotData['stay_period']);
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('packages');

  static Stream<PackagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PackagesRecord.fromSnapshot(s));

  static Future<PackagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PackagesRecord.fromSnapshot(s));

  static PackagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PackagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PackagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PackagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PackagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PackagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPackagesRecordData({
  DocumentReference? destination,
  int? pax,
  double? price,
  String? details,
  DateTime? startDate,
  DateTime? endDate,
  int? stayPeriod,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'destination': destination,
      'pax': pax,
      'price': price,
      'details': details,
      'start_date': startDate,
      'end_date': endDate,
      'stay_period': stayPeriod,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class PackagesRecordDocumentEquality implements Equality<PackagesRecord> {
  const PackagesRecordDocumentEquality();

  @override
  bool equals(PackagesRecord? e1, PackagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.destination == e2?.destination &&
        e1?.pax == e2?.pax &&
        e1?.price == e2?.price &&
        e1?.details == e2?.details &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.stayPeriod == e2?.stayPeriod &&
        e1?.name == e2?.name;
  }

  @override
  int hash(PackagesRecord? e) => const ListEquality().hash([
        e?.destination,
        e?.pax,
        e?.price,
        e?.details,
        e?.images,
        e?.startDate,
        e?.endDate,
        e?.stayPeriod,
        e?.name
      ]);

  @override
  bool isValidKey(Object? o) => o is PackagesRecord;
}
