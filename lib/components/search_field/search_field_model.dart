import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_field_widget.dart' show SearchFieldWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchFieldModel extends FlutterFlowModel<SearchFieldWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> results = [];
  void addToResults(DocumentReference item) => results.add(item);
  void removeFromResults(DocumentReference item) => results.remove(item);
  void removeAtIndexFromResults(int index) => results.removeAt(index);
  void insertAtIndexInResults(int index, DocumentReference item) =>
      results.insert(index, item);
  void updateResultsAtIndex(int index, Function(DocumentReference) updateFn) =>
      results[index] = updateFn(results[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
