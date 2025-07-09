import 'package:backbase/common/extensions/sized_box_extension.dart';
import 'package:backbase/domain/entity/books_response_entity.dart';
import 'package:backbase/presentation/books/widgets/book_item.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  const BookList({super.key, required this.list});
  final List<DocsEntity> list;

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty
        ? ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            DocsEntity item = list[index];
            return BookItem(doc: item);
          },
          itemCount: list.length,
          separatorBuilder: (BuildContext context, int index) {
            return 10.heightBox;
          },
        )
        : const Center(
          child: Text(
            "No Books Found",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        );
  }
}
