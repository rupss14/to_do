import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_doo/app_router.dart';
import 'package:to_doo/screens/tabs_screen.dart';
import 'package:to_doo/screens/pending_screen.dart';
import 'package:to_doo/blocs/bloc_exports.dart';
import 'package:to_doo/models/task.dart';


void main() {
  BlocOverrides.runZoned(() =>  runApp( MyApp(
    appRouter: AppRouter(),
  )),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({required this.appRouter,super.key});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TasksBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title:'Flutter Tasks App',
          theme:ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: TabsScreen(),
          onGenerateRoute: appRouter.onGenerateRoute,
        ),

    );
  }
}
