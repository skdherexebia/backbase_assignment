import 'dart:math';

import 'package:backbase/common/extensions/sized_box_extension.dart';
import 'package:backbase/common/extensions/image_url_extension.dart';
import 'package:backbase/domain/books/entity/books_response_entity.dart';
import 'package:backbase/presentation/book_details/widgets/book_cover.dart';
import 'package:flutter/material.dart';

class BookItem extends StatefulWidget {
  const BookItem({super.key, required this.doc});

  final DocsEntity doc;

  @override
  State<BookItem> createState() => _CoverWidgetState();
}

class _CoverWidgetState extends State<BookItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _showFront = true;

  void _flip() {
    if (_showFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _showFront = !_showFront;
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final frontCover = BookCover(
      imageUrl: widget.doc.coverI.toString().toImageUrl(size: 'L')
    );

    final backCover = BookCover(
      imageUrl: widget.doc.coverI.toString().toImageUrl(size: 'L'),
    );

    return Column(
      children: [
        24.heightBox,
        Center(
          child: GestureDetector(
            onTap: _flip,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final angle = _controller.value * pi;
                final isFront = angle <= pi / 2;

                return Transform(
                  alignment: Alignment.center,
                  transform:
                      Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(angle),
                  child:
                      isFront
                          ? frontCover
                          : Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(pi),
                            child: backCover,
                          ),
                );
              },
            ),
          ),
        ),
        16.heightBox,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            widget.doc.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        10.heightBox,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            widget.doc.authorName?.join(',') ?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
