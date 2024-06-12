import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'personal_info_screen_widget.dart' show PersonalInfoScreenWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PersonalInfoScreenModel
    extends FlutterFlowModel<PersonalInfoScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for onboardFirst widget.
  FocusNode? onboardFirstFocusNode;
  TextEditingController? onboardFirstTextController;
  String? Function(BuildContext, String?)? onboardFirstTextControllerValidator;
  String? _onboardFirstTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for onboardMiddle widget.
  FocusNode? onboardMiddleFocusNode;
  TextEditingController? onboardMiddleTextController;
  String? Function(BuildContext, String?)? onboardMiddleTextControllerValidator;
  // State field(s) for onboardLast widget.
  FocusNode? onboardLastFocusNode;
  TextEditingController? onboardLastTextController;
  String? Function(BuildContext, String?)? onboardLastTextControllerValidator;
  String? _onboardLastTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for onboardPhone widget.
  FocusNode? onboardPhoneFocusNode;
  TextEditingController? onboardPhoneTextController;
  final onboardPhoneMask = MaskTextInputFormatter(mask: '+63 ### #### ###');
  String? Function(BuildContext, String?)? onboardPhoneTextControllerValidator;
  String? _onboardPhoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    onboardFirstTextControllerValidator = _onboardFirstTextControllerValidator;
    onboardLastTextControllerValidator = _onboardLastTextControllerValidator;
    onboardPhoneTextControllerValidator = _onboardPhoneTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    onboardFirstFocusNode?.dispose();
    onboardFirstTextController?.dispose();

    onboardMiddleFocusNode?.dispose();
    onboardMiddleTextController?.dispose();

    onboardLastFocusNode?.dispose();
    onboardLastTextController?.dispose();

    onboardPhoneFocusNode?.dispose();
    onboardPhoneTextController?.dispose();
  }
}
