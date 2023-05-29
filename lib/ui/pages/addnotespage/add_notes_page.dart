import 'package:flutter/material.dart';
import 'package:notes/domain/providers/notes_provider.dart';
import 'package:notes/ui/themes/app_colors.dart';
import 'package:notes/ui/themes/app_styles.dart';
import 'package:provider/provider.dart';

class AddNotesPage extends StatelessWidget {
  const AddNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Добавить заметку',
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
      body: const AddNotesBody(),
    );
  }
}

class AddNotesBody extends StatelessWidget {
  const AddNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NotesProvider>(context);
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
              heroTag: 'notes_add_btn',
              backgroundColor: AppColors.backgroundColor,
              elevation: 2,
              onPressed: () {
                model.onAddNotes(context);
              },
              label: Text(
                'Добавить',
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

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.labelText,
    required this.hinText,
    required this.textEditingController,
  });

  final String labelText, hinText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppStyles.fontStyle.copyWith(
          fontSize: 12,
          color: AppColors.textColor,
        ),
        hintText: hinText,
        hintStyle: AppStyles.fontStyle.copyWith(
          fontSize: 16,
          color: AppColors.blackColor,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.formColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
