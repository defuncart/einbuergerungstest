import 'package:einbuergerungstest/generated/l10n.dart';
import 'package:einbuergerungstest/widgets/home_screen/tabs/dashboard_tab.dart';
import 'package:einbuergerungstest/widgets/home_screen/tabs/favorites_tab.dart';
import 'package:einbuergerungstest/widgets/home_screen/tabs/tips_tab.dart';
import 'package:einbuergerungstest/widgets/quiz_screen/quiz_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MediaQuery.of(context).orientation == Orientation.landscape
            ? Row(
                children: <Widget>[
                  NavigationRail(
                    selectedIndex: _currentIndex,
                    onDestinationSelected: (index) => setState(() => _currentIndex = index),
                    labelType: NavigationRailLabelType.none,
                    extended: MediaQuery.of(context).size.width > 900,
                    destinations: [
                      NavigationRailDestination(
                        icon: const Icon(Icons.dashboard_outlined),
                        selectedIcon: const Icon(Icons.dashboard),
                        label: Text(AppLocalizations.of(context).homeScreenDashboardLabel),
                      ),
                      NavigationRailDestination(
                        icon: const Icon(Icons.favorite_outline),
                        selectedIcon: const Icon(Icons.favorite),
                        label: Text(AppLocalizations.of(context).homeScreenFavoritesLabel),
                      ),
                      NavigationRailDestination(
                        icon: const Icon(Icons.lightbulb_outline),
                        selectedIcon: const Icon(Icons.lightbulb),
                        label: Text(AppLocalizations.of(context).homeScreenTipsLabel),
                      ),
                    ],
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(
                    child: HomeScreenContent(
                      index: _currentIndex,
                    ),
                  )
                ],
              )
            : HomeScreenContent(
                index: _currentIndex,
              ),
      ),
      bottomNavigationBar: MediaQuery.of(context).orientation == Orientation.portrait
          ? BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (newIndex) => setState(() => _currentIndex = newIndex),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(_currentIndex == 0 ? Icons.dashboard : Icons.dashboard_outlined),
                  label: AppLocalizations.of(context).homeScreenDashboardLabel,
                ),
                BottomNavigationBarItem(
                  icon: Icon(_currentIndex == 1 ? Icons.favorite : Icons.favorite_outline),
                  label: AppLocalizations.of(context).homeScreenFavoritesLabel,
                ),
                BottomNavigationBarItem(
                  icon: Icon(_currentIndex == 2 ? Icons.lightbulb : Icons.lightbulb_outline),
                  label: AppLocalizations.of(context).homeScreenTipsLabel,
                ),
              ],
            )
          : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(QuizScreen.routeName),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(AppLocalizations.of(context).homeScreenTestButtonText),
      ),
    );
  }
}

@visibleForTesting
class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        switch (index) {
          case 1:
            return const FavoritesTabConsumer();
          case 2:
            return const TipsTab();
          default:
            return const DashboardTabConsumer();
        }
      },
    );
  }
}
