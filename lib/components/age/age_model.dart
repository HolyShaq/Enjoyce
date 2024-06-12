import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'age_widget.dart' show AgeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AgeModel extends FlutterFlowModel<AgeWidget> {
  ///  Local state fields for this component.

  int? adult;

  int? child;

  int? infant;

  List<int> pax = [];
  void addToPax(int item) => pax.add(item);
  void removeFromPax(int item) => pax.remove(item);
  void removeAtIndexFromPax(int index) => pax.removeAt(index);
  void insertAtIndexInPax(int index, int item) => pax.insert(index, item);
  void updatePaxAtIndex(int index, Function(int) updateFn) =>
      pax[index] = updateFn(pax[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for CountController widget.
  int? countControllerValue1;
  // State field(s) for CountController widget.
  int? countControllerValue2;
  // State field(s) for CountController widget.
  int? countControllerValue3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
