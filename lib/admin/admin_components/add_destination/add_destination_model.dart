import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_destination_widget.dart' show AddDestinationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddDestinationModel extends FlutterFlowModel<AddDestinationWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Destination widget.
  List<String>? destinationValue;
  FormFieldController<List<String>>? destinationValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
