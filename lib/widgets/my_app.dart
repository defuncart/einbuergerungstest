import 'package:einbuergerungstest/generated/l10n.dart';
import 'package:einbuergerungstest/state/state.dart';
import 'package:einbuergerungstest/widgets/home_screen/home_screen.dart';
import 'package:einbuergerungstest/widgets/quiz_screen/quiz_screen.dart';
import 'package:einbuergerungstest/widgets/results_screen/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  var _isInitialized = false;

  @override
  void initState() {
    super.initState();

    _initApp();
  }

  Future<void> _initApp() async {
    final dir = (await getApplicationDocumentsDirectory()).path;
    Hive.init(dir);

    await ref.read(questionDatabaseProvider).initialize();
    await ref.read(resultsDatabaseProvider).initialize();

    setState(() => _isInitialized = true);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: _isInitialized ? const MyAppContent() : const SizedBox.shrink(),
    );
  }
}

class MyAppContent extends StatelessWidget {
  const MyAppContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.delegate.supportedLocales,
        theme: ThemeData.light().copyWith(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hintColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black54,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black54,
          ),
          navigationRailTheme: const NavigationRailThemeData(
            backgroundColor: Colors.transparent,
            selectedIconTheme: IconThemeData(
              color: Colors.black54,
            ),
            selectedLabelTextStyle: TextStyle(
              color: Colors.black87,
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.black54,
            ),
            unselectedLabelTextStyle: TextStyle(
              color: Colors.black54,
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            showSelectedLabels: false,
            selectedItemColor: Colors.black54,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.black26,
            type: BottomNavigationBarType.fixed,
          ),
          colorScheme: const ColorScheme.light().copyWith(
            secondary: Colors.black26,
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black87),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black87),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
          ),
        ),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (_) => const HomeScreen(),
          QuizScreen.routeName: (_) => const QuizScreen(),
          ResultsScreen.routeName: (_) => const ResultsScreen(),
        },
      ),
    );
  }
}
