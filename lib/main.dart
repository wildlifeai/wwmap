import 'package:flutter/material.dart';
import 'package:wildlifemap/screens/map_screen.dart';
import 'package:wildlifemap/wild_life_theme.dart';

void main() => runApp(const WildLifeApp());

/// Initial draft for wild life app
class WildLifeApp extends StatefulWidget {
  const WildLifeApp({Key? key}) : super(key: key);

  @override
  _WildLifeAppState createState() => _WildLifeAppState();
}

class _WildLifeAppState extends State<WildLifeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wild Life AI Map',
      theme: WildLifeTheme.lightTheme,
      darkTheme: WildLifeTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const MapScreen(),
    );
  }
}
