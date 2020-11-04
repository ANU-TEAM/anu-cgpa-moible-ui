import 'dart:io';
import 'package:moor/moor.dart';
// These imports are only needed to open the database
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'database.g.dart';

@UseMoor(include: {'tables.moor'})
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Semester>> getAllSemesters() => select(semesters).get();
  Stream<List<Semester>> watchAllSemesters() => select(semesters).watch();

  Future insertSemester(Semester semester) => into(semesters).insert(semester);
  Future updateSemester(Semester semester) =>
      update(semesters).replace(semester);
  Future deleteSemester(Semester semester) =>
      delete(semesters).delete(semester);
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}
