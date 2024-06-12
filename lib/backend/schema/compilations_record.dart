import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompilationsRecord extends FirestoreRecord {
  CompilationsRecord._(
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

  // "destinations" field.
  List<DocumentReference>? _destinations;
  List<DocumentReference> get destinations => _destinations ?? const [];
  bool hasDestinations() => _destinations != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _destinations = getDataList(snapshotData['destinations']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('compilations');

  static Stream<CompilationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompilationsRecord.fromSnapshot(s));

  static Future<CompilationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompilationsRecord.fromSnapshot(s));

  static CompilationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompilationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompilationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompilationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompilationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompilationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompilationsRecordData({
  String? name,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompilationsRecordDocumentEquality
    implements Equality<CompilationsRecord> {
  const CompilationsRecordDocumentEquality();

  @override
  bool equals(CompilationsRecord? e1, CompilationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.destinations, e2?.destinations);
  }

  @override
  int hash(CompilationsRecord? e) =>
      const ListEquality().hash([e?.name, e?.description, e?.destinations]);

  @override
  bool isValidKey(Object? o) => o is CompilationsRecord;
}
