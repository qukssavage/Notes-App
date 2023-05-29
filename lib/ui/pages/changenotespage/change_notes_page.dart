import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/domain/providers/notes_provider.dart';
import 'package:provider/provider.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_styles.dart';
import '../addnotespage/add_notes_page.dart';

class ChangeNotesPage extends StatelessWidget {
  const ChangeNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Изменить заметку',
          style: AppStyles.fontStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: const ChangeNotesBody(),
    );
  }
}

class ChangeNotesBody extends StatelessWidget {
  const ChangeNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NotesProvider>(context);
    final arg = ModalRoute.of(context)?.settings.arguments;
    final int index = arg is int ? arg : 0;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        children: [
          TextFormFieldWidget(
            labelText: 'Заголовок',
            hinText: 'Заголовок',
            textEditingController: model.titleController,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            labelText: 'Заметка',
            hinText: 'Заметка',
            textEditingController: model.textController,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FloatingActionButton.extended(
              heroTag: 'notes_change_btn',
              backgroundColor: AppColors.backgroundColor,
              elevation: 2,
              onPressed: () {
                model.changeNotes(context, index);
              },
              label: Text(
                'Изменить',
                style: AppStyles.fontStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.purpleColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
