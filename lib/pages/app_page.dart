import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/routing/routing.dart';
import 'package:pmprod/styles/app_colors.dart';

class AppPage extends StatefulWidget {
  final String initialRoute;

  const AppPage({
    super.key,
    required this.initialRoute,
  });

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(
          labelColor: AppColors.grey1000,
          unselectedLabelColor: AppColors.grey200,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: AppColors.grey1000,
              width: 2.0,
            ),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.grey600,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.grey1000,
        ),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          buttonColor: AppColors.grey1000,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: AppColors.whiteMaterialColor,
          accentColor: AppColors.grey1000,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: widget.initialRoute,
      onGenerateRoute: Routing.getMainRoute,
      onGenerateTitle: (context) => S.of(context).appName,
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        S.delegate,
      ],
    );
  }
}
