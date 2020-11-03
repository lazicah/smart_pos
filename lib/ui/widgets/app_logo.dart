import 'package:flutter/material.dart';
import 'package:smart_pos/ui/utils/styles.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColoredContainerBG(
          child: Icon(
            Icons.shop,
            color: Color(0xffC8161D),
          ),
        ),
        HSpace(15),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Smart',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            TextSpan(
              text: 'POS',
              style: TextStyle(
                  color: Color(0xffC8161D),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ]),
        )
      ],
    );
  }
}

class ColoredContainerBG extends StatelessWidget {
  final Widget child;

  const ColoredContainerBG({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xffF8F8F7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
