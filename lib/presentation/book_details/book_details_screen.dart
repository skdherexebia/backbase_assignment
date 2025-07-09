import 'package:backbase/common/extensions/sized_box_extension.dart';
import 'package:backbase/common/extensions/snackbar_extension.dart';
import 'package:backbase/common/theme/app_colors.dart';
import 'package:backbase/core/di/service_locator.dart';
import 'package:backbase/domain/entity/books_response_entity.dart';
import 'package:backbase/presentation/book_details/book_details_cubit.dart';
import 'package:backbase/presentation/book_details/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksDetailsScreen extends StatefulWidget {
  const BooksDetailsScreen({super.key, required this.doc});

  final DocsEntity doc;

  @override
  State<BooksDetailsScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksDetailsScreen> {
  late BookDetailsCubit _bookDetailsCubit;

  @override
  void initState() {
    super.initState();

    _bookDetailsCubit = locator.get<BookDetailsCubit>();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _bookDetailsCubit.setBookDetails(widget.doc),
    );
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            child: BlocBuilder<BookDetailsCubit, BooksDetailsState>(
              builder: (context, state) {
                if (state is BookExistInMyBookState) {
                  return InkWell(
                    onTap:() {
                      _bookDetailsCubit.removeBook();
                    },
                    child: Icon(Icons.favorite, size: 50,color: AppColors.primary,),
                  );
                } else {
                  return InkWell(
                     onTap:() {
                      _bookDetailsCubit.saveBook();
                    },
                    child: Icon(Icons.favorite, size: 50,color: AppColors.textMuted,),
                  );
                }
              },
            ),
          ),
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
                    return BookItem(doc: _bookDetailsCubit.book);
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              30.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
