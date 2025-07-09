import 'package:backbase/common/extensions/sized_box_extension.dart';
import 'package:backbase/common/theme/app_colors.dart';
import 'package:backbase/core/app_router/route_constant.dart';
import 'package:backbase/domain/my_books/entity/my_book_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyBookItem extends StatelessWidget {
  const MyBookItem({super.key, required this.book});

  final MyBookEntity book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRouteConstants.bookDetailsRouteName, extra: book);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://covers.openlibrary.org/b/id/${book.coverI}-M.jpg', // fallback image
                  width: 80,
                  height: 80,
                  placeholder:
                      (context, url) =>
                          Center(child: CircularProgressIndicator()),
                  errorWidget:
                      (context, url, error) =>
                          Icon(Icons.broken_image, color: Colors.red),
                  fit: BoxFit.cover,
                ),
              ),
              15.widthBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                    ),
                    5.heightBox,
                    Text(book.authorName?.join(',') ?? ''),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
