import 'package:backbase/common/extensions/sized_box_extension.dart';
import 'package:backbase/domain/my_books/entity/my_book_entity.dart';
import 'package:backbase/presentation/my_books/widgets/my_book_item.dart';
import 'package:flutter/material.dart';

class MyBookList extends StatelessWidget {
  const MyBookList({super.key, required this.list});
  final List<MyBookEntity> list;

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty? ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        MyBookEntity item = list[index];
        return MyBookItem(book: item);
      },
      itemCount: list.length, separatorBuilder: (BuildContext context, int index) { 
        return 10.heightBox;
       },
    ):Text("No Books found");
    
  }
}
