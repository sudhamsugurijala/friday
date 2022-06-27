import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'packnote:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` packnote is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'notes_database.db'),
    // When the database is first created, create a table to store notes.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, note TEXT)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  // Define a function that inserts notes into the database
  Future<void> insertNote(Note note) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Note into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same Note is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the notes from the notes table.
  Future<List<Note>> getNotes() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The notes.
    final List<Map<String, dynamic>> maps = await db.query('notes');

    // Convert the List<Map<String, dynamic> into a List<Note>.
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        title: maps[i]['title'],
        note: maps[i]['note'],
      );
    });
  }

  Future<void> updateNote(Note note) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Note.
    await db.update(
      'notes',
      note.toMap(),
      // Ensure that the Note has a matching id.
      where: 'id = ?',
      // Pass the Note's id as a whereArg to prevent SQL injection.
      whereArgs: [note.id],
    );
  }

  Future<void> deleteNote(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Note from the database.
    await db.delete(
      'notes',
      // Use a `where` clause to delete a specific Note.
      where: 'id = ?',
      // Pass the Note's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  // Create a Note and add it to the notes table
  var fido = const Note(
    id: 0,
    title: 'Fido',
    note: '35',
  );

  await insertNote(fido);

  // Now, use the method above to retrieve all the notes.
  print(await getNotes()); // Prints a list that include Fido.

  // Update Fido's note and save it to the database.
  fido = Note(
    id: fido.id,
    title: fido.title,
    note: fido.note + '7',
  );
  await updateNote(fido);

  // Print the updated results.
  print(await getNotes()); // Prints Fido with note 42.

  // Delete Fido from the database.
  await deleteNote(fido.id);

  // Print the list of notes (empty).
  print(await getNotes());
}

class Note {
  final int id;
  final String title;
  final String note;

  const Note({
    required this.id,
    required this.title,
    required this.note,
  });

  // Convert a Note into a Map. The keys must correspond to the titles of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'note': note,
    };
  }

  // Implement toString to make it easier to see information about
  // each Note when using the print statement.
  @override
  String toString() {
    return 'Note{id: $id, title: $title, note: $note}';
  }
}
