import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icu4x_test/features/features.dart';
import 'package:icu4x_test/ui/ui.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icu4x Test',
      theme: ThemeData(
        splashColor: Colors.blue,
        highlightColor: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ResponsiveBreakpoints.builder(
        child: BlocProvider(
          lazy: false,
          create: (context) => GetUnicodeCharactersBloc()
            ..add(
              const GetUnicodeCharactersEvent.getCharacters(page: 1),
            ),
          child: const UnicodeHomeScreen(),
        ),
        breakpoints: [
          const Breakpoint(
            start: 0,
            end: 390,
            name: MOBILE,
          ), // Mobile devices
          const Breakpoint(
            start: 391,
            end: 600,
            name: TABLET,
          ), // Tablet devices
          const Breakpoint(
            start: 601,
            end: 800,
            name: DESKTOP,
          ), // Desktop devices
        ],
      ),
    );
  }
}
