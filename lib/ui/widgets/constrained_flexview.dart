import 'package:flutter/material.dart';
import 'package:smart_pos/ui/widgets/scroll_view.dart';

class ConstrainedFlexView extends StatelessWidget {
  final Widget child;
  final double minSize;
  final Axis axis;
  final EdgeInsets scrollPadding;

  const ConstrainedFlexView(this.minSize,
      {Key key, this.child, this.axis, this.scrollPadding})
      : super(key: key);

  bool get isHz => axis == Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        double viewSize = isHz ? constraints.maxWidth : constraints.maxHeight;
        if (viewSize > minSize) return child;
        return Padding(
          padding: scrollPadding,
          child: StyledScrollView(
            axis: axis ?? Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: isHz ? double.infinity : minSize,
                  maxWidth: isHz ? minSize : double.infinity),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
