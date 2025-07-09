import 'package:backbase/common/extensions/sized_box_extension.dart';
import 'package:backbase/domain/books/entity/books_response_entity.dart';
import 'package:backbase/presentation/books/widgets/book_item.dart';
import 'package:flutter/material.dart';

class BookList extends StatefulWidget {
  const BookList({
    super.key,
    required this.list,
    this.callback,
    required this.isLoading,
  });

  final List<DocsEntity> list;
  final VoidCallback? callback;
  final bool isLoading;

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading) {
      _isLoading = true;
      widget.callback?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    _isLoading = false;
    return widget.list.isNotEmpty
        ? ListView.separated(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            DocsEntity item = widget.list[index];
            return BookItem(doc: item);
          },
          itemCount: widget.list.length,
          separatorBuilder: (context, index) => 10.heightBox,
        )
        : const Center(
          child: Text(
            "No Books Found",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        );
  }
}
