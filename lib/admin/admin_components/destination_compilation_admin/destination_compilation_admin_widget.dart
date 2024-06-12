import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'destination_compilation_admin_model.dart';
export 'destination_compilation_admin_model.dart';

class DestinationCompilationAdminWidget extends StatefulWidget {
  const DestinationCompilationAdminWidget({
    super.key,
    required this.compilation,
  });

  final DocumentReference? compilation;

  @override
  State<DestinationCompilationAdminWidget> createState() =>
      _DestinationCompilationAdminWidgetState();
}

class _DestinationCompilationAdminWidgetState
    extends State<DestinationCompilationAdminWidget> {
  late DestinationCompilationAdminModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DestinationCompilationAdminModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 316.0,
      decoration: BoxDecoration(),
      child: StreamBuilder<CompilationsRecord>(
        stream: CompilationsRecord.getDocument(widget.compilation!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          final columnCompilationsRecord = snapshot.data!;
          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'viewall_admin',
                queryParameters: {
                  'compilation': serializeParam(
                    columnCompilationsRecord.reference,
                    ParamType.DocumentReference,
                  ),
                }.withoutNulls,
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(25.0, 31.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        columnCompilationsRecord.name,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito',
                              color: Color(0xFF333333),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        'See All',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito',
                              color: Color(0xFF4D8BC3),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25.0, 18.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final destinations =
                          columnCompilationsRecord.destinations.toList();
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(destinations.length,
                              (destinationsIndex) {
                            final destinationsItem =
                                destinations[destinationsIndex];
                            return Stack(
                              children: [
                                StreamBuilder<DestinationsRecord>(
                                  stream: DestinationsRecord.getDocument(
                                      destinationsItem),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final containerDestinationsRecord =
                                        snapshot.data!;
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'adcontext_admin',
                                          queryParameters: {
                                            'destination': serializeParam(
                                              destinationsItem,
                                              ParamType.DocumentReference,
                                            ),
                                            'compilation': serializeParam(
                                              widget.compilation,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: Image.network(
                                            containerDestinationsRecord
                                                .images.first,
                                            width: 180.0,
                                            height: 240.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          }).divide(SizedBox(width: 16.0)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
