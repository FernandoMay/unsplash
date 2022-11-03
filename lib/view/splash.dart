import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/constants.dart';
import 'package:unsplash/presenter/providers.dart';
import 'package:unsplash/view/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<Timer> loadData() async {
    final futureData = Provider.of<ResultsProvider>(context, listen: false);
    await futureData.fetchData();
    return Timer(
        const Duration(seconds: 0, milliseconds: 618, microseconds: 0339),
        onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.pushAndRemoveUntil(context,
        CupertinoPageRoute<Widget>(builder: (BuildContext context) {
      return const Home();
    }), (route) => false);
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: secondaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              CupertinoIcons.check_mark_circled,
              size: 111,
              color: CupertinoColors.white,
            ),
            SizedBox(
              height: 18.0,
            ),
            Text(
              "unsplash",
              style: tsH3Blue,
            ),
          ],
        ),
      ),
    );
  }
}
