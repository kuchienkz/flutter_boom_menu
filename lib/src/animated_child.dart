import 'package:flutter/material.dart';

class AnimatedChild extends AnimatedWidget {
  final int index;
  final Color backgroundColor;
  final double elevation;
  final Widget child;

  final bool visible;
  final VoidCallback onTap;
  final VoidCallback toggleChildren;
  final String title;
  final String subtitle;
  final Color titleColor;
  final Color subTitleColor;

  AnimatedChild(
      {Key key,
      Animation<double> animation,
      this.index,
      this.backgroundColor,
      this.elevation = 6.0,
      this.child,
      this.title,
      this.subtitle,
      this.visible = false,
      this.onTap,
      this.toggleChildren,
      this.titleColor,
      this.subTitleColor})
      : super(key: key, listenable: animation);

  void _performAction() {
    if (onTap != null) onTap();
    toggleChildren();
  }

  Widget build(BuildContext context) {
    final Widget buttonChild = Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: child ?? Container(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontFamily: "Futura",
                        color: (titleColor == null) ? Colors.black : titleColor,
                        fontSize: 20.0),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: "Futura",
                        color: (subTitleColor == null)
                            ? Colors.black
                            : subTitleColor,
                        fontSize: 14.0),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: 90,
      padding: EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap: _performAction,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          //width: animation.value,
          color: backgroundColor,
          child: buttonChild,
        ),
      ),
    );
  }
}
