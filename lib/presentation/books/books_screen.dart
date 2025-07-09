import 'dart:async';
import 'package:backbase/common/extensions/sized_box_extension.dart';
import 'package:backbase/common/extensions/snackbar_extension.dart';
import 'package:backbase/common/theme/app_colors.dart';
import 'package:backbase/common/theme/app_theme.dart';
import 'package:backbase/core/di/service_locator.dart';
import 'package:backbase/presentation/books/books_cubit.dart';
import 'package:backbase/presentation/books/widgets/book_list.dart';
import 'package:backbase/presentation/books/widgets/shimmer_list.dart';
import 'package:backbase/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  late BooksCubit _booksCubit;
  late TextEditingController searchCtrl = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _booksCubit.getBooks(query);
    });
  }

  @override
  void initState() {
    super.initState();
    _booksCubit = locator.get<BooksCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _booksCubit,
      child: BlocListener<BooksCubit, BooksState>(
        listener: (context, state) {
          if(state is FailState){
            context.showSnackbar(
              state.message,
              backgroundColor: AppColors.secondary,
            );
          }
        },
        child: Scaffold(
          drawer: const Drawer(child: DawerWidget()),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: AppColors.primary,
            title: Text("Books", style: TextStyle(color: AppColors.white)),
          ),
          backgroundColor: AppColors.backgroundDarkShadeOrange,
          body: Container(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                TextField(
                  controller: searchCtrl,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        searchCtrl.text = '';
                        _booksCubit.getBooks("");
                      },
                      child: Icon(Icons.cancel),
                    ),
                    hintText: "Search book by title",
                  ),
                  onChanged: _onSearchChanged,
                  keyboardType: TextInputType.text,
                ),
                16.heightBox,
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _booksCubit.onRefresh,
                    child: BlocBuilder<BooksCubit, BooksState>(
                      builder: (context, state) {
                        if (state is BooksFetched) {
                          return BookList(list: state.list,
                          isLoading: false,
                          callback: () {
                              _booksCubit.loadMore();
                          },
                          );
                        } else if (state is ShowShimmer) {
                          return ShimmerList();
                        } else if(state is BooksInitial){
                          return Text("Start typing a book title to search.",style: Theme.of(context).textTheme.appText16Primary(context),);
                        }else{
                          return SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
