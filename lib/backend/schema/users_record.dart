import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "middle_name" field.
  String? _middleName;
  String get middleName => _middleName ?? '';
  bool hasMiddleName() => _middleName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "suffix" field.
  String? _suffix;
  String get suffix => _suffix ?? '';
  bool hasSuffix() => _suffix != null;

  // "birthdate" field.
  DateTime? _birthdate;
  DateTime? get birthdate => _birthdate;
  bool hasBirthdate() => _birthdate != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "is_onboarded" field.
  bool? _isOnboarded;
  bool get isOnboarded => _isOnboarded ?? false;
  bool hasIsOnboarded() => _isOnboarded != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _middleName = snapshotData['middle_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _suffix = snapshotData['suffix'] as String?;
    _birthdate = snapshotData['birthdate'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _isOnboarded = snapshotData['is_onboarded'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? firstName,
  String? middleName,
  String? lastName,
  String? suffix,
  DateTime? birthdate,
  String? phoneNumber,
  String? photoUrl,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  bool? isOnboarded,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'first_name': firstName,
      'middle_name': middleName,
      'last_name': lastName,
      'suffix': suffix,
      'birthdate': birthdate,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'is_onboarded': isOnboarded,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.firstName == e2?.firstName &&
        e1?.middleName == e2?.middleName &&
        e1?.lastName == e2?.lastName &&
        e1?.suffix == e2?.suffix &&
        e1?.birthdate == e2?.birthdate &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isOnboarded == e2?.isOnboarded;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.firstName,
        e?.middleName,
        e?.lastName,
        e?.suffix,
        e?.birthdate,
        e?.phoneNumber,
        e?.photoUrl,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.isOnboarded
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
