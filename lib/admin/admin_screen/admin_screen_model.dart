import '/admin/admin_components/add_compilation/add_compilation_widget.dart';
import '/admin/admin_components/create_dest/create_dest_widget.dart';
import '/admin/admin_components/create_pack/create_pack_widget.dart';
import '/admin/admin_components/destination_compilation_admin/destination_compilation_admin_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/package_card/package_card_widget.dart';
import '/components/search_field_copy/search_field_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admin_screen_widget.dart' show AdminScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminScreenModel extends FlutterFlowModel<AdminScreenWidget> {
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
