// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "charName": MessageLookupByLibrary.simpleMessage("Character Name"),
        "detailsAppBar": MessageLookupByLibrary.simpleMessage("Details"),
        "detailsTab1": MessageLookupByLibrary.simpleMessage("About Movie"),
        "detailsTab2": MessageLookupByLibrary.simpleMessage("Reviews"),
        "detailsTab3": MessageLookupByLibrary.simpleMessage("Cast"),
        "hintSearch":
            MessageLookupByLibrary.simpleMessage("Search for  your movie"),
        "homeTab1": MessageLookupByLibrary.simpleMessage("Now Playing"),
        "homeTab2": MessageLookupByLibrary.simpleMessage("UpComing"),
        "homeTab3": MessageLookupByLibrary.simpleMessage("Top Rated"),
        "homeTab4": MessageLookupByLibrary.simpleMessage("Popular"),
        "main": MessageLookupByLibrary.simpleMessage("Home"),
        "noImage": MessageLookupByLibrary.simpleMessage(" no image"),
        "noRate": MessageLookupByLibrary.simpleMessage("No Rate"),
        "noReviews":
            MessageLookupByLibrary.simpleMessage("There are No Reviews Yet"),
        "noSearchResult":
            MessageLookupByLibrary.simpleMessage("No items Found"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "title":
            MessageLookupByLibrary.simpleMessage("Y O  U R    M O V I E S  "),
        "validateSearch":
            MessageLookupByLibrary.simpleMessage("Please enter your movie "),
        "watchNow": MessageLookupByLibrary.simpleMessage("Watch Now")
      };
}
