import 'package:bloc_example/second/second_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'first/first_bloc.dart';
import 'first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => FirstBloc()..add(FirstInitialEvent()),
),
    BlocProvider(
      create: (context) => SecondBloc()..add(InitialSecondEvent()),
    ),
  ],
  child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Example',
        initialRoute: '/',
        onGenerateRoute: (routeSettings) {
          switch (routeSettings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (context) => const FirstScreen(), settings: routeSettings);
            default:
              return MaterialPageRoute(
                  builder: (context) => const FirstScreen(), settings: routeSettings);
              break;
          }
        },
      ),
);
  }
}
