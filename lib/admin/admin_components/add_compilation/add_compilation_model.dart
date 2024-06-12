import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_compilation_widget.dart' show AddCompilationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCompilationModel extends FlutterFlowModel<AddCompilationWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for NameDestination widget.
  FocusNode? nameDestinationFocusNode;
  TextEditingController? nameDestinationTextController;
  String? Function(BuildContext, String?)?
      nameDestinationTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameDestinationFocusNode?.dispose();
    nameDestinationTextController?.dispose();
  }
}
