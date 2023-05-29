import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/domain/providers/notes_provider.dart';
import 'package:notes/ui/app_navigator/app_navigator.dart';
import 'package:provider/provider.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: const MaterialAppWidget(),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NotesProvider>(context);
    return MaterialApp(
      theme: model.isLightTheme ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppNavigator.initRoute,
      routes: AppNavigator.routes,
      onGenerateRoute: AppNavigator.generate,
    );
  }
}
