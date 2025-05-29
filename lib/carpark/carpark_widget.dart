import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'carpark_model.dart';
export 'carpark_model.dart';

class CarparkWidget extends StatefulWidget {
  const CarparkWidget({super.key});

  static String routeName = 'Carpark';
  static String routePath = '/carpark';

  @override
  State<CarparkWidget> createState() => _CarparkWidgetState();
}

class _CarparkWidgetState extends State<CarparkWidget> {
  late CarparkModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarparkModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
      ),
    );
  }
}
