import 'package:backbase/data/books/endpoint/books_endpoint.dart';
import 'package:backbase/data/books/model/books_response_model.dart';
import 'package:backbase/domain/entity/books_response_entity.dart';
import 'package:backbase/domain/repository/books_repository.dart';

class BooksRepositoryImpl extends BooksRepository {
   final BooksEndpoint _booksEndpoint;

    BooksRepositoryImpl(this._booksEndpoint);

  @override
  Future<BooksResponseEntity> getBooks(String param) async {
     try {
      final BooksModel response = await _booksEndpoint.getBooks(title: param);
      return toConvertBooksEntity(response);
    } catch(e) {
      // return Result.error(Failure.from(error));
    }

    return BooksResponseEntity(numFound: 4, start: 3, numFoundExact: true, booksModelNumFound: 8, documentationUrl: '', q: '', offset: null, docs: []);
  }

  Future<BooksResponseEntity> toConvertBooksEntity(BooksModel res) async {

    List<DocsEntity> docEntity = [];

    for(var doc in res.docs){
      List<String>?  authors = doc.authorName;
      docEntity.add(DocsEntity(title: doc.title,authorName: authors,key:doc.key,
      coverEditionKey: doc.coverEditionKey,
      subtitle:doc.subtitle,
      coverI: doc.coverI));
    }

    return BooksResponseEntity(numFound: res.numFound, 
    start: res.start,
     numFoundExact:
      res.numFoundExact, booksModelNumFound: res.booksModelNumFound, documentationUrl: res.documentationUrl, q: res.documentationUrl, offset: res.offset, docs: docEntity);
  

  }
}