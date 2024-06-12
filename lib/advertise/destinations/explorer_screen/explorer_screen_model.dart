import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/destionation_compilation/destionation_compilation_widget.dart';
import '/components/package_card/package_card_widget.dart';
import '/components/search_field_copy/search_field_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'explorer_screen_widget.dart' show ExplorerScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExplorerScreenModel extends FlutterFlowModel<ExplorerScreenWidget> {
  ///  Local state fields for this page.

  int explorerIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for searchFieldCopy component.
  late SearchFieldCopyModel searchFieldCopyModel;

  @override
  void initState(BuildContext context) {
    searchFieldCopyModel = createModel(context, () => SearchFieldCopyModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFieldCopyModel.dispose();
  }
}
