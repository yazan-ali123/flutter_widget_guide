import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_docs/dep_injections.dart' as di;
import 'package:widget_docs/presentation/bloc/widget_guide_bloc.dart';
import 'package:widget_docs/presentation/pages/widget_list_page.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade800),
        useMaterial3: true,
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        // Create the BLoC and add the initial event to fetch data
        create: (_) => di.sl<WidgetGuideBloc>()..add(FetchWidgetGuides()),
        child: const WidgetListPage(),
      ),
    );
  }
}
