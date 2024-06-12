import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _favoriteDestination = prefs
              .getStringList('ff_favoriteDestination')
              ?.map((path) => path.ref)
              .toList() ??
          _favoriteDestination;
    });
    _safeInit(() {
      _favePackages = prefs
              .getStringList('ff_favePackages')
              ?.map((path) => path.ref)
              .toList() ??
          _favePackages;
    });
    _safeInit(() {
      _recentSearches = prefs
              .getStringList('ff_recentSearches')
              ?.map((path) => path.ref)
              .toList() ??
          _recentSearches;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _favorite = false;
  bool get favorite => _favorite;
  set favorite(bool _value) {
    _favorite = _value;
  }

  List<DocumentReference> _favoriteDestination = [];
  List<DocumentReference> get favoriteDestination => _favoriteDestination;
  set favoriteDestination(List<DocumentReference> _value) {
    _favoriteDestination = _value;
    prefs.setStringList(
        'ff_favoriteDestination', _value.map((x) => x.path).toList());
  }

  void addToFavoriteDestination(DocumentReference _value) {
    _favoriteDestination.add(_value);
    prefs.setStringList('ff_favoriteDestination',
        _favoriteDestination.map((x) => x.path).toList());
  }

  void removeFromFavoriteDestination(DocumentReference _value) {
    _favoriteDestination.remove(_value);
    prefs.setStringList('ff_favoriteDestination',
        _favoriteDestination.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavoriteDestination(int _index) {
    _favoriteDestination.removeAt(_index);
    prefs.setStringList('ff_favoriteDestination',
        _favoriteDestination.map((x) => x.path).toList());
  }

  void updateFavoriteDestinationAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _favoriteDestination[_index] = updateFn(_favoriteDestination[_index]);
    prefs.setStringList('ff_favoriteDestination',
        _favoriteDestination.map((x) => x.path).toList());
  }

  void insertAtIndexInFavoriteDestination(
      int _index, DocumentReference _value) {
    _favoriteDestination.insert(_index, _value);
    prefs.setStringList('ff_favoriteDestination',
        _favoriteDestination.map((x) => x.path).toList());
  }

  List<DocumentReference> _favePackages = [];
  List<DocumentReference> get favePackages => _favePackages;
  set favePackages(List<DocumentReference> _value) {
    _favePackages = _value;
    prefs.setStringList('ff_favePackages', _value.map((x) => x.path).toList());
  }

  void addToFavePackages(DocumentReference _value) {
    _favePackages.add(_value);
    prefs.setStringList(
        'ff_favePackages', _favePackages.map((x) => x.path).toList());
  }

  void removeFromFavePackages(DocumentReference _value) {
    _favePackages.remove(_value);
    prefs.setStringList(
        'ff_favePackages', _favePackages.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavePackages(int _index) {
    _favePackages.removeAt(_index);
    prefs.setStringList(
        'ff_favePackages', _favePackages.map((x) => x.path).toList());
  }

  void updateFavePackagesAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _favePackages[_index] = updateFn(_favePackages[_index]);
    prefs.setStringList(
        'ff_favePackages', _favePackages.map((x) => x.path).toList());
  }

  void insertAtIndexInFavePackages(int _index, DocumentReference _value) {
    _favePackages.insert(_index, _value);
    prefs.setStringList(
        'ff_favePackages', _favePackages.map((x) => x.path).toList());
  }

  bool _selectedFaveDestinations = true;
  bool get selectedFaveDestinations => _selectedFaveDestinations;
  set selectedFaveDestinations(bool _value) {
    _selectedFaveDestinations = _value;
  }

  List<DocumentReference> _recentSearches = [];
  List<DocumentReference> get recentSearches => _recentSearches;
  set recentSearches(List<DocumentReference> _value) {
    _recentSearches = _value;
    prefs.setStringList(
        'ff_recentSearches', _value.map((x) => x.path).toList());
  }

  void addToRecentSearches(DocumentReference _value) {
    _recentSearches.add(_value);
    prefs.setStringList(
        'ff_recentSearches', _recentSearches.map((x) => x.path).toList());
  }

  void removeFromRecentSearches(DocumentReference _value) {
    _recentSearches.remove(_value);
    prefs.setStringList(
        'ff_recentSearches', _recentSearches.map((x) => x.path).toList());
  }

  void removeAtIndexFromRecentSearches(int _index) {
    _recentSearches.removeAt(_index);
    prefs.setStringList(
        'ff_recentSearches', _recentSearches.map((x) => x.path).toList());
  }

  void updateRecentSearchesAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _recentSearches[_index] = updateFn(_recentSearches[_index]);
    prefs.setStringList(
        'ff_recentSearches', _recentSearches.map((x) => x.path).toList());
  }

  void insertAtIndexInRecentSearches(int _index, DocumentReference _value) {
    _recentSearches.insert(_index, _value);
    prefs.setStringList(
        'ff_recentSearches', _recentSearches.map((x) => x.path).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
