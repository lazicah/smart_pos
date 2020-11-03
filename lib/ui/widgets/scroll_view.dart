import 'package:flutter/material.dart';
import 'package:smart_pos/ui/widgets/scroll_bar.dart';

class StyledScrollView extends StatefulWidget {
  final double contentSize;
  final Axis axis;
  final Color trackColor;
  final Color handleColor;
  final EdgeInsets scrollBarPadding;

  final Widget child;

  StyledScrollView({
    Key key,
    @required this.child,
    this.contentSize,
    this.axis = Axis.vertical,
    this.trackColor,
    this.handleColor,
    this.scrollBarPadding,
  }) : super(key: key) {}

  @override
  _StyledScrollViewState createState() => _StyledScrollViewState();
}

class _StyledScrollViewState extends State<StyledScrollView> {
  ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(StyledScrollView oldWidget) {
    if (oldWidget.child != widget.child) {
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollbarListStack(
      contentSize: widget.contentSize,
      axis: widget.axis,
      controller: scrollController,
      barSize: 12,
      trackColor: widget.trackColor,
      handleColor: widget.handleColor,
      scrollbarPadding: widget.scrollBarPadding,
      child: SingleChildScrollView(
        scrollDirection: widget.axis,
        physics: AlwaysScrollableScrollPhysics(),
        controller: scrollController,
        child: widget.child,
      ),
    );
  }
}
