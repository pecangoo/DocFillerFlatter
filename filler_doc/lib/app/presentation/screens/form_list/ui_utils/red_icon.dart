import 'package:flutter/material.dart';

import '../../../constans/style_colors.dart';

class RedIcon extends StatefulWidget {
  final Function action;
  final IconData icon;
  final String hint;
  final Color color;

  const RedIcon(
      {required this.action,
      super.key,
      this.icon = Icons.delete,
      this.hint = "",
      this.color = Colors.red});

  @override
  State<RedIcon> createState() => _RedIconState();
}

class _RedIconState extends State<RedIcon> {
  bool isMouse = false;

  _RedIconState();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) {
          setState(() {
            isMouse = true;
          });
        },
        onExit: (event) {
          setState(() {
            isMouse = false;
          });
        },
        child: Tooltip(
          message: widget.hint,
          child: IconButton(
            onPressed: () => widget.action(),
            icon: Icon(widget.icon),
            color: isMouse ? widget.color : colorOfDeleteBox,
          ),
        ));
  }
}
