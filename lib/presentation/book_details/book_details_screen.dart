import 'package:backbase/common/extensions/sized_box_extension.dart';
import 'package:backbase/common/extensions/snackbar_extension.dart';
import 'package:backbase/common/theme/app_colors.dart';
import 'package:backbase/core/di/service_locator.dart';
import 'package:backbase/domain/entity/books_response_entity.dart';
import 'package:backbase/presentation/book_details/book_details_cubit.dart';
import 'package:backbase/presentation/book_details/widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class BooksDetailsScreen extends StatefulWidget {
  const BooksDetailsScreen({super.key, required this.doc});

  final DocsEntity doc;

  @override
  State<BooksDetailsScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _showFront = true;
  late BookDetailsCubit _bookDetailsCubit;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _bookDetailsCubit = locator.get<BookDetailsCubit>();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _bookDetailsCubit.setBookDetails(widget.doc),
    );
  }

  void _flip() {
    if (_showFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _showFront = !_showFront;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bookDetailsCubit,
      child: BlocListener<BookDetailsCubit, BooksDetailsState>(
        listener: (context, state) {
          if (state is AddToMyBookSuccessState) {
            context.showSnackbar(state.message);
          }
          if (state is AddToMyBookSFailState) {
            context.showSnackbar(
              state.message,
              backgroundColor: AppColors.secondary,
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.backgroundDarkShadeOrange,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: AppColors.primary,
            title: Text(
              "Book Details",
              style: TextStyle(color: AppColors.white),
            ),
          ),
          body: Column(
            children: [
              BlocBuilder<BookDetailsCubit, BooksDetailsState>(
                buildWhen:
                    (previous, current) =>
                        previous != current && current is DataSet,
                builder: (context, state) {
                  if (state is DataSet) {
                    final frontCover = BookCover(
                      imageUrl:
                          'https://covers.openlibrary.org/b/id/${_bookDetailsCubit.book.coverI}-L.jpg',
                    );
                    final backCover = BookCover(
                      imageUrl:
                          'https://covers.openlibrary.org/b/id/${_bookDetailsCubit.book.coverI}-L.jpg',
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
                                            transform:
                                                Matrix4.identity()..rotateY(pi),
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
                            _bookDetailsCubit.book.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        10.heightBox,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            _bookDetailsCubit.book.authorName?.join(',') ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              30.heightBox,
              BlocBuilder<BookDetailsCubit, BooksDetailsState>(
                builder: (context, state) {
                  if (state is BookExistInMyBookState) {
                    return SizedBox(
                      width: 200,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          _bookDetailsCubit.removeBook();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          backgroundColor: AppColors.primary,
                          shadowColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Remove from my book")],
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      width: 200,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          _bookDetailsCubit.saveBook();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          backgroundColor: AppColors.primary,
                          shadowColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Add to My Book")],
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
