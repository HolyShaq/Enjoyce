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
import 'edit_dest_widget.dart' show EditDestWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditDestModel extends FlutterFlowModel<EditDestWidget> {
  ///  Local state fields for this component.

  int? createIndex = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for NameDestination widget.
  FocusNode? nameDestinationFocusNode;
  TextEditingController? nameDestinationTextController;
  String? Function(BuildContext, String?)?
      nameDestinationTextControllerValidator;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for Country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryTextController;
  String? Function(BuildContext, String?)? countryTextControllerValidator;
  // State field(s) for Categories widget.
  List<String>? categoriesValue;
  FormFieldController<List<String>>? categoriesValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameDestinationFocusNode?.dispose();
    nameDestinationTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    countryFocusNode?.dispose();
    countryTextController?.dispose();
  }
}
