import 'package:backbase/core/database/database_helper.dart';
import 'package:backbase/domain/my_books/entity/my_book_entity.dart';
import 'package:backbase/domain/my_books/repository/my_book_repository.dart';

class MyBookRepositryImpl extends MyBookRepository {
  final dbHelper = DatabaseHelper.instance;
  
  @override
  Future<List<MyBookEntity>> getBooks() async {
    final db = await dbHelper.database;
    List<MyBookEntity> list = [];

    List<Map> results = await db.rawQuery('SELECT * FROM books');
    for(var result in results){
      list.add(MyBookEntity(title: result['title'], key: result['key'],coverI:result['cover_i'] ,authorName: result['author'].toString().split(',')));
    }
    return list;
  }
}