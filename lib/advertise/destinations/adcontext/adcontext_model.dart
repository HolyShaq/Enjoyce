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
import 'adcontext_widget.dart' show AdcontextWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdcontextModel extends FlutterFlowModel<AdcontextWidget> {
  ///  Local state fields for this page.

  int? selectedIndex = 0;

  bool showAvail = false;

  int? adult = 0;

  int? child = 0;

  int? infant = 0;

  DateTime? start;

  DateTime? end;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  List<int>? pax;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  List<DateTime>? range;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
