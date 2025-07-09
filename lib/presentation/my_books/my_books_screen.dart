import 'package:backbase/common/theme/app_colors.dart';
import 'package:backbase/core/app_router/route_constant.dart';
import 'package:backbase/core/di/service_locator.dart';
import 'package:backbase/presentation/books/widgets/shimmer_list.dart';
import 'package:backbase/presentation/my_books/my_books_cubit.dart';
import 'package:backbase/presentation/my_books/widgets/my_book_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyBooksScreen extends StatefulWidget {
  const MyBooksScreen({super.key});

  @override
  State<MyBooksScreen> createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends State<MyBooksScreen> {
  late MyBooksCubit _myBooksCubit;
  late TextEditingController searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _myBooksCubit = locator.get<MyBooksCubit>();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _myBooksCubit.getBooks(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _myBooksCubit,
      child: BlocListener<MyBooksCubit, MyBooksState>(
        listener: (context, state) {
          if(state is GoToBookDetail){
            context.pushNamed(AppRouteConstants.bookDetailsRouteName, extra: state.doc);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: AppColors.primary,
            title: Text("My Books", style: TextStyle(color: AppColors.white)),
          ),
          backgroundColor: AppColors.backgroundDarkShadeOrange,
          body: Container(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _myBooksCubit.onRefresh,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          BlocBuilder<MyBooksCubit, MyBooksState>(
                            builder: (context, state) {
                              if (state is BooksFetched) {
                                return MyBookList(list: state.list);
                              } else if (state is ShowShimmer) {
                                return ShimmerList();
                              } else {
                                return Center(
                                  child: SizedBox(
                                    height: 300,
                                    child: Text("No Books found!"),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
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
