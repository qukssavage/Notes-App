import 'package:flutter/material.dart';
import 'package:notes/domain/hive/hive_box.dart';
import 'package:notes/domain/hive/notes_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesProvider extends ChangeNotifier {
  NotesProvider() {
    getTheme();
  }

  // controllers
  final titleController = TextEditingController();
  final textController = TextEditingController();

  bool isLightTheme = false;

  // change theme
  changeTheme() async {
    isLightTheme =
        !isLightTheme; // !isLightTheme - переопределяет переменную на противоположное значение
    final pref = await SharedPreferences
        .getInstance(); // Загружает и анализирует [SharedPreferences] для этого приложения с диска.
    await pref.setBool('theme', isLightTheme);
    notifyListeners();
  }

  // get saved data from SharedPreferences
  getTheme() async {
    final pref = await SharedPreferences.getInstance();
    isLightTheme = pref.getBool('theme') ?? isLightTheme;
    notifyListeners();
  }

  // add notes
  Future<void> onAddNotes(BuildContext context) async {
    await HiveBoxes.notes
        .add(
          NotesData(
            title: titleController.text.isNotEmpty
                ? titleController.text
                : 'Заголовок',
            text: textController.text.isNotEmpty
                ? textController.text
                : 'Заметка',
          ),
        )
        .then((value) => controllerClear())
        .then((value) => Navigator.pop(context));
  }

  // clear controller
  controllerClear() {
    titleController.clear();
    textController.clear();
  }

  // delete notes
  Future<void> onDeleteNote(BuildContext context, int index) async {
    await HiveBoxes.notes.deleteAt(index).then(
          (value) => Navigator.pop(context),
        );
  }

  // change notes
  Future<void> changeNotes(BuildContext context, int index) async {
    await HiveBoxes.notes
        .putAt(
          index,
          NotesData(
            title: titleController.text,
            text: textController.text,
          ),
        )
        .then(
          (value) => Navigator.pop(context),
        );
  }

  // set notes
  void setControllers(int index) async {
    titleController.text = HiveBoxes.notes.getAt(index)?.title ?? 'Заголовок';
    textController.text = HiveBoxes.notes.getAt(index)?.text ?? 'Заметка';
  }
}
