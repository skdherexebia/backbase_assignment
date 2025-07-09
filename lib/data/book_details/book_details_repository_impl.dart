import 'package:backbase/core/database/database_helper.dart';
import 'package:backbase/domain/entity/books_response_entity.dart';
import 'package:backbase/domain/repository/book_details_repository.dart';

class BookDetailsRepositoryImpl extends BookDetailsRepository {
  

  @override
  Future<bool> getBook(DocsEntity book) async {
    final dbHelper = DatabaseHelper.instance;
    final db = await dbHelper.database;
    var res = await db.rawQuery(
      "SELECT * FROM  books WHERE  cover_edition_key = ? ",
      [book.coverEditionKey],
    );
    if (res.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> saveBook(DocsEntity book) async {
    final dbHelper = DatabaseHelper.instance;
    final db = await dbHelper.database;

    var res = await db.rawQuery(
      "SELECT * FROM  books WHERE  cover_edition_key = ? ",
      [book.coverEditionKey],
    );
    if (res.isNotEmpty) {
      return false;
    } else {
      var data = [
        book.title,
        book.authorName?.join(','),
        book.coverEditionKey,
        book.key,
        book.coverI,
        book.subtitle,
        DateTime.now().toString(),
      ];

      await db.rawQuery(
        "INSERT into books (title,author,cover_edition_key,key,cover_i,description,created_date) VALUES (?,?,?,?,?,?,?)",
        data,
      );
      return true;

    }
  }
  
  @override
  Future<bool> removeBook(DocsEntity book) async {
    final dbHelper = DatabaseHelper.instance;
    final db = await dbHelper.database;
     await db.rawQuery(
      "DELETE FROM  books WHERE  cover_edition_key = ? ",
      [book.coverEditionKey],
    );
    return true;
  }
}
