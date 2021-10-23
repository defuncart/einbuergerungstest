import 'package:einbuergerungstest/generated/l10n.dart';
import 'package:flutter/material.dart';

class TipsTab extends StatelessWidget {
  const TipsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context).homeScreenTipsLabel),
    );
  }
}
