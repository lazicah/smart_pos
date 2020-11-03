import 'package:flutter/material.dart';

class FadingIndexedStack extends StatefulWidget {
  final int index;
  final List<Widget> children;
  final Duration duration;

  const FadingIndexedStack({
    Key key,
    this.index,
    this.children,
    this.duration = const Duration(
      milliseconds: 250,
    ),
  }) : super(key: key);

  @override
  _FadingIndexedStackState createState() => _FadingIndexedStackState();
}

class _FadingIndexedStackState extends State<FadingIndexedStack> {
  double _targetOpacity = 1;

  @override
  void didUpdateWidget(FadingIndexedStack oldWidget) {
    if (oldWidget.index == widget.index) return;
    setState(() => _targetOpacity = 0);
    Future.delayed(
        Duration(milliseconds: 1000), () => setState(() => _targetOpacity = 1));
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration:
          _targetOpacity > 0 ? widget.duration : Duration(milliseconds: 0),
      tween: Tween(begin: 0, end: _targetOpacity),
      builder: (_, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: IndexedStack(index: widget.index, children: widget.children),
    );
  }
}
