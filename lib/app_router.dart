import 'package:flutter/material.dart';
import 'package:to_doo/screens/recycle_bin.dart';
import 'package:to_doo/screens/tabs_screen.dart';
import 'package:to_doo/screens/pending_screen.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_)=> RecycleBin());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) => TabsScreen());

      default:
        return null;
    }
  }
}