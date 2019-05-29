import 'package:flutter_web/material.dart';

enum TaBarPageColor { Default, Sleep, Music, Kids }

final Map<TaBarPageColor, Color> tabBarColors = {
  TaBarPageColor.Default: Colors.transparent,
  TaBarPageColor.Sleep: Color(0xff20222B),
  TaBarPageColor.Music: Color(0xff192936),
  TaBarPageColor.Kids: Color(0xff133A5B),
};

class NavigatorTheme extends InheritedWidget {
  final String theme;
  final Function changeToLightTheme;
  final Function changeToDarkTheme;
  TaBarPageColor taBarPageColor = TaBarPageColor.Default;
  bool isNewHome = false;

  NavigatorTheme(
      {Key key,
      Widget child,
      this.theme,
      this.changeToDarkTheme,
      this.changeToLightTheme})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(NavigatorTheme oldWidget) => oldWidget.theme != theme;

  static NavigatorTheme of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(NavigatorTheme);
}
