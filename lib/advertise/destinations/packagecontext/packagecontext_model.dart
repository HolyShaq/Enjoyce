import '/backend/backend.dart';
import '/components/age/age_widget.dart';
import '/components/date_range/date_range_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'packagecontext_widget.dart' show PackagecontextWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PackagecontextModel extends FlutterFlowModel<PackagecontextWidget> {
  ///  Local state fields for this page.

  int? selectedIndex = 0;

  bool expanded = false;

  bool showAvail = false;

  int? adult = 0;

  int? child = 0;

  int? infant = 0;

  DateTime? start;

  DateTime? end;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for MainColumn widget.
  ScrollController? mainColumn;
  // State field(s) for Row widget.
  ScrollController? rowController;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  List<int>? pax;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  List<DateTime>? range;

  @override
  void initState(BuildContext context) {
    mainColumn = ScrollController();
    rowController = ScrollController();
    columnController = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainColumn?.dispose();
    rowController?.dispose();
    columnController?.dispose();
  }
}
