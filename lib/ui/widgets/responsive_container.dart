import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, Size size) mobileView;
  final Widget Function(BuildContext context, Size size) smallWebView;
  final Widget Function(BuildContext context, Size size) mediumWebView;
  final Widget Function(BuildContext context, Size size) largeWebView;

  const ResponsiveBuilder(
      {Key key,
      this.mobileView,
      this.smallWebView,
      this.mediumWebView,
      this.largeWebView})
      : super(key: key);

  bool _isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200.0;
  }

  bool _isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800.0;
  }

  bool _isLowMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 600.0;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (_isLargeScreen(context)) {
          return largeWebView(context, constraints.biggest);
        } else if (_isMediumScreen(context)) {
          return mediumWebView(context, constraints.biggest);
        }
        if (_isLowMediumScreen(context)) {
          return smallWebView(context, constraints.biggest);
        } else
          return mobileView(context, constraints.biggest);
      },
    );
  }
}
