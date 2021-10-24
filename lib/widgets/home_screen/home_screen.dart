import 'package:einbuergerungstest/generated/l10n.dart';
import 'package:einbuergerungstest/widgets/home_screen/tabs/dashboard_tab.dart';
import 'package:einbuergerungstest/widgets/home_screen/tabs/favorites_tab.dart';
import 'package:einbuergerungstest/widgets/home_screen/tabs/info_tab.dart';
import 'package:einbuergerungstest/widgets/home_screen/tabs/tips_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
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
      body: Builder(
        builder: (context) {
          switch (_currentIndex) {
            case 1:
              return const FavoritesTab();
            case 2:
              return const TipsTab();
            case 3:
              return const InfoTab();
            default:
              return const DashboardTabConsumer();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (newIndex) => setState(() => _currentIndex = newIndex),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard),
            label: AppLocalizations.of(context).homeScreenDashboardLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: AppLocalizations.of(context).homeScreenFavoritesLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.lightbulb),
            label: AppLocalizations.of(context).homeScreenTipsLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.info),
            label: AppLocalizations.of(context).homeScreenInfoLabel,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(AppLocalizations.of(context).homeScreenTestButtonText),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
