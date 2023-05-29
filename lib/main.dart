import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/domain/hive/notes_data.dart';
import 'package:notes/ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NotesDataAdapter());
  await Hive.openBox<NotesData>('notes');

  runApp(const NotesApp());
}
