import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qoute_app/controllers/quotes_provider.dart';
import 'package:qoute_app/pages/main_page/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider
    (providers: [
      ChangeNotifierProvider(create: (context) => QuotesNotifier(),),
  ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const MainPage()
          );
        },);
  }
}

