import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/domain/providers/notes_provider.dart';
import 'package:notes/ui/app_navigator/app_routes.dart';
import 'package:notes/ui/themes/app_colors.dart';
import 'package:notes/ui/themes/app_styles.dart';
import 'package:provider/provider.dart';

import '../../widgets/notes_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoSwitch(
          activeColor: AppColors.purpleColor,
          onChanged: (bool val) {
            model.changeTheme();
          },
          value: model.isLightTheme,
        ),
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Заметки',
          style: AppStyles.fontStyle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.searchNotes);
            },
            icon: const Icon(
              Icons.search,
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 56,
        height: 56,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.addNotes);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: AppColors.backgroundColor,
          label: const Icon(
            Icons.create_outlined,
            color: AppColors.purpleColor,
          ),
        ),
      ),
      body: NotesBody(),
    );
  }
}
