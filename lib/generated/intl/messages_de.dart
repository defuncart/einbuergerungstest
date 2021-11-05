// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'de';

  static String m0(numCorrect, total) =>
      "Du hast nur ${numCorrect} von ${total} Fragen richtig geantwortet. Leider hast du den Einbürgerungstest nicht bestanden.";

  static String m1(numCorrect, total) =>
      "Du hast ${numCorrect} von ${total} Fragen richtig geantwortet und den Einbürgerungstest bestanden!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "favoritesTabEmptyStateLabel": MessageLookupByLibrary.simpleMessage(
            "Füge Fragen zu der Merkliste hinzu!"),
        "generalContinue": MessageLookupByLibrary.simpleMessage("Fortfahren"),
        "generalNo": MessageLookupByLibrary.simpleMessage("Nein"),
        "generalYes": MessageLookupByLibrary.simpleMessage("Ja"),
        "historyTabEmptyStateLabel": MessageLookupByLibrary.simpleMessage(
            "Keine abgeschlossene Tests gefunden."),
        "homeScreenDashboardLabel":
            MessageLookupByLibrary.simpleMessage("Dashboard"),
        "homeScreenFavoritesLabel":
            MessageLookupByLibrary.simpleMessage("Merkliste"),
        "homeScreenHistoryLabel":
            MessageLookupByLibrary.simpleMessage("Verlauf"),
        "homeScreenTestButtonText":
            MessageLookupByLibrary.simpleMessage("Test"),
        "homeScreenTipsLabel": MessageLookupByLibrary.simpleMessage("Tipps"),
        "quitQuizConfirmationDialogDescription":
            MessageLookupByLibrary.simpleMessage(
                "Alle Fortschritte gehen verloren."),
        "quitQuizConfirmationDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Bist du sicher, dass du den Test beeneden möchten?"),
        "resultsScreenFailedText": m0,
        "resultsScreenPassedText": m1,
        "tipsTabEmptyStateLabel": MessageLookupByLibrary.simpleMessage(
            "Keine falsche beantwortete Fragen gefunden.")
      };
}
