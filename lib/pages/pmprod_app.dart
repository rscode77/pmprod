import 'package:flutter/material.dart';
import 'package:pmprod/pages/app_page.dart';
import 'package:pmprod/routing/routing.dart';

class PmProdApp extends StatefulWidget {
  const PmProdApp({super.key});

  @override
  State<PmProdApp> createState() => _PmProdAppState();
}

class _PmProdAppState extends State<PmProdApp> {

  @override
  Widget build(BuildContext context) {
    return AppPage(
      initialRoute: _initialRoute(),
    );
  }

  String _initialRoute() {
    return Routing.login;
  }
}
