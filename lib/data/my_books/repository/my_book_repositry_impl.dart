import 'package:backbase/core/database/database_helper.dart';
import 'package:backbase/domain/my_books/entity/my_book_entity.dart';
import 'package:backbase/domain/my_books/repository/my_book_repository.dart';

class MyBookRepositryImpl extends MyBookRepository {


  
  @override
  Future<List<MyBookEntity>> getBooks() async {
    final dbHelper = DatabaseHelper.instance;
    final db = await dbHelper.database;
    List<MyBookEntity> list = [];

    List<Map> results = await db.rawQuery('SELECT * FROM books');
    for(var result in results){
      list.add(MyBookEntity(title: result['title'], key: result['key'],coverI:result['cover_i'] ,coverEditionKey:result['cover_edition_key'] ,authorName: result['author'].toString().split(',')));
    }
    return list;
  }
}