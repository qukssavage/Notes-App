import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/domain/hive/hive_box.dart';
import 'package:notes/domain/hive/notes_data.dart';
import 'package:notes/ui/themes/app_colors.dart';
import 'package:notes/ui/themes/app_styles.dart';
import 'package:notes/ui/widgets/card_widget.dart';

class SearchNotesPage extends StatefulWidget {
  const SearchNotesPage({super.key});

  @override
  State<SearchNotesPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchNotesPage> {
  final searchController = TextEditingController();
  var filterNotes = <NotesData>[];
  final _notes = HiveBoxes.notes.values.toList();

  Future<void> deleteText() async {
    searchController.clear();
  }

  void searchNotes() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filterNotes = _notes.where((NotesData notesList) {
        return notesList.title.toLowerCase().contains(query.toLowerCase()) ||
            notesList.text.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filterNotes = _notes;
    }
    setState(() {});
  }

  @override
  void initState() {
    filterNotes = _notes;
    searchController.addListener(searchNotes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.backgroundColor,
        title: TextField(
          controller: searchController,
          cursorColor: AppColors.backgroundColor,
          style: AppStyles.fontStyle,
          decoration: const InputDecoration(
            hintText: 'Поиск...',
            hintStyle: AppStyles.fontStyle,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: deleteText,
            icon: const Icon(
              Icons.close,
              color: AppColors.textColor,
            ),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.notes.listenable(),
        builder: (context, Box<NotesData> box, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemCount: filterNotes.length,
            itemBuilder: (context, index) {
              final note = filterNotes[index];
              return CardWidget(
                title: note.title,
                date: note.date ?? '0',
                text: note.text,
              );
            },
          );
        },
      ),
    );
  }
}
