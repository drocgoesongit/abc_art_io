import 'package:flutter/material.dart';

class OnHoverText extends StatefulWidget {
  final Widget child;
  final TextStyle _hoveringStyle;
  final TextStyle _nonHoveringStyle;
  const OnHoverText({
    Key? key,
    required this.child,
    required TextStyle hoveringStyle,
    required TextStyle nonHoveringStyle,
  })  : _hoveringStyle = hoveringStyle,
        _nonHoveringStyle = nonHoveringStyle,
        super(key: key);
  @override
  State<OnHoverText> createState() => _OnHoverTextState();
}

class _OnHoverTextState extends State<OnHoverText> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onHover: (event) {
          setState(() {
            _isHovering = true;
          });
        },
        onExit: (event) {
          setState(() {
            _isHovering = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          style: _isHovering ? widget._hoveringStyle : widget._nonHoveringStyle,
          duration: const Duration(milliseconds: 200),
          child: widget.child,
        ));
  }
}
