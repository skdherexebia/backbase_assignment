import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: CachedNetworkImage(
          imageUrl: imageUrl, 
          width: 80,
          height: 80,
          placeholder:
              (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget:
              (context, url, error) =>
                  Icon(Icons.broken_image, color: Colors.red),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
