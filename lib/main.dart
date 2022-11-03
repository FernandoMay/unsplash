import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/constants.dart';
import 'package:unsplash/presenter/providers.dart';
import 'package:unsplash/view/home.dart';
import 'package:unsplash/view/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ResultsProvider>(
      create: (_) => ResultsProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Unsplash',
      theme: CupertinoThemeData(
        primaryColor: primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: (settings) => generateRoute(settings),
      home: Home(),
    );
  }
}
