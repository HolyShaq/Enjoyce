import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DestinationsRecord extends FirestoreRecord {
  DestinationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "categories" field.
  List<String>? _categories;
  List<String> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _images = getDataList(snapshotData['images']);
    _country = snapshotData['country'] as String?;
    _categories = getDataList(snapshotData['categories']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('destinations');

  static Stream<DestinationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DestinationsRecord.fromSnapshot(s));

  static Future<DestinationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DestinationsRecord.fromSnapshot(s));

  static DestinationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DestinationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DestinationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DestinationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DestinationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DestinationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDestinationsRecordData({
  String? name,
  String? description,
  String? country,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'country': country,
    }.withoutNulls,
  );

  return firestoreData;
}

class DestinationsRecordDocumentEquality
    implements Equality<DestinationsRecord> {
  const DestinationsRecordDocumentEquality();

  @override
  bool equals(DestinationsRecord? e1, DestinationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.country == e2?.country &&
        listEquality.equals(e1?.categories, e2?.categories);
  }

  @override
  int hash(DestinationsRecord? e) => const ListEquality()
      .hash([e?.name, e?.description, e?.images, e?.country, e?.categories]);

  @override
  bool isValidKey(Object? o) => o is DestinationsRecord;
}
