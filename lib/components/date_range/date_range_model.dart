import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'date_range_widget.dart' show DateRangeWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DateRangeModel extends FlutterFlowModel<DateRangeWidget> {
  ///  Local state fields for this component.

  DateTime? start;

  DateTime? end;

  List<DateTime> range = [];
  void addToRange(DateTime item) => range.add(item);
  void removeFromRange(DateTime item) => range.remove(item);
  void removeAtIndexFromRange(int index) => range.removeAt(index);
  void insertAtIndexInRange(int index, DateTime item) =>
      range.insert(index, item);
  void updateRangeAtIndex(int index, Function(DateTime) updateFn) =>
      range[index] = updateFn(range[index]);

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
