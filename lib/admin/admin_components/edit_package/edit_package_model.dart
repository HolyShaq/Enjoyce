import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_package_widget.dart' show EditPackageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPackageModel extends FlutterFlowModel<EditPackageWidget> {
  ///  Local state fields for this component.

  int? createIndex = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Destination widget.
  String? destinationValue;
  FormFieldController<String>? destinationValueController;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for Pax widget.
  FocusNode? paxFocusNode;
  TextEditingController? paxTextController;
  String? Function(BuildContext, String?)? paxTextControllerValidator;
  // State field(s) for Price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  // State field(s) for Details widget.
  FocusNode? detailsFocusNode;
  TextEditingController? detailsTextController;
  String? Function(BuildContext, String?)? detailsTextControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for StayPeriod widget.
  FocusNode? stayPeriodFocusNode;
  TextEditingController? stayPeriodTextController;
  String? Function(BuildContext, String?)? stayPeriodTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    paxFocusNode?.dispose();
    paxTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    detailsFocusNode?.dispose();
    detailsTextController?.dispose();

    stayPeriodFocusNode?.dispose();
    stayPeriodTextController?.dispose();
  }
}
