import 'package:flutter/material.dart';
import 'package:notes/domain/providers/notes_provider.dart';
import 'package:notes/ui/app_navigator/app_routes.dart';
import 'package:notes/ui/themes/app_colors.dart';
import 'package:notes/ui/themes/app_styles.dart';
import 'package:provider/provider.dart';

class DialogWindowWidget extends StatelessWidget {
  const DialogWindowWidget({
    super.key,
    required this.index,
    required this.title,
    required this.text,
  });

  final String title, text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: AppStyles.fontStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: AppStyles.fontStyle.copyWith(
              fontSize: 14,
              color: AppColors.textColor,
            ),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.popAndPushNamed(
                context,
                AppRoutes.changeNotes,
                arguments: index,
              );
            },
            icon: const Icon(
              Icons.edit,
              color: AppColors.textColor,
            ),
            label: Text(
              'Редактировать',
              style: AppStyles.fontStyle.copyWith(fontSize: 16),
            ),
          ),
          DeleteNoteButton(index: index),
        ],
      ),
    );
  }
}

class DeleteNoteButton extends StatelessWidget {
  const DeleteNoteButton({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NotesProvider>(context);
    return TextButton.icon(
      onPressed: () {
        model.onDeleteNote(context, index);
      },
      icon: const Icon(
        Icons.backspace,
        color: AppColors.textColor,
      ),
      label: Text(
        'Удалить',
        style: AppStyles.fontStyle.copyWith(
          fontSize: 16,
        ),
      ),
    );
  }
}
