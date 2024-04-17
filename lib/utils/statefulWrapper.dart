library StatefulWrapper;

import 'package:flutter/cupertino.dart';

class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Function? onDispose;
  final Function? didChangeDependencies;
  final Widget child;

  const StatefulWrapper({super.key, required this.onInit, required this.child, this.onDispose, this.didChangeDependencies});

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!();
    }
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (widget.didChangeDependencies != null) {
      widget.didChangeDependencies!();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
