import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'favorite_toggle_icon_model.dart';
export 'favorite_toggle_icon_model.dart';

class FavoriteToggleIconWidget extends StatefulWidget {
  const FavoriteToggleIconWidget({
    super.key,
    required this.isToggled,
  });

  final bool? isToggled;

  @override
  State<FavoriteToggleIconWidget> createState() =>
      _FavoriteToggleIconWidgetState();
}

class _FavoriteToggleIconWidgetState extends State<FavoriteToggleIconWidget> {
  late FavoriteToggleIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoriteToggleIconModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.isToggled ?? false) {
          return FlutterFlowIconButton(
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.favorite_sharp,
              color: FlutterFlowTheme.of(context).sixthColor,
              size: 25.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          );
        } else {
          return FlutterFlowIconButton(
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.favorite_border_sharp,
              color: FlutterFlowTheme.of(context).sixthColor,
              size: 25.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          );
        }
      },
    );
  }
}
