import 'package:flutter/material.dart';
import 'package:notes/ui/app_navigator/app_routes.dart';
import 'package:notes/ui/pages/addnotespage/add_notes_page.dart';
import 'package:notes/ui/pages/changenotespage/change_notes_page.dart';
import 'package:notes/ui/pages/error404page/error_404_page.dart';
import 'package:notes/ui/pages/homepage/home_page.dart';
import 'package:notes/ui/pages/searchpage/search_page.dart';

class AppNavigator {
  static String initRoute = AppRoutes.home;

  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.home: (_) => const HomePage(),
      AppRoutes.addNotes: (_) => const AddNotesPage(),
      AppRoutes.changeNotes: (_) => const ChangeNotesPage(),
      AppRoutes.searchNotes: (_) => const SearchNotesPage(),
    };
  }

  static Route generate(RouteSettings settings) {
    final _settings = RouteSettings(
      name: '/404',
      arguments: settings.arguments,
    );
    return MaterialPageRoute(
      settings: _settings,
      builder: (_) => const Error404Page(),
    );
  }
}
