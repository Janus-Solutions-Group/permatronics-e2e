import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manlift_app/feature/Home/pages/homepage.dart';
import 'package:manlift_app/provider/selection_ref_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SelectionRefProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          )),
      home: HomePage(),
    );
  }
}
