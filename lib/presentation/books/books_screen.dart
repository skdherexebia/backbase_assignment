import 'package:demo/core/di/service_locator.dart';
import 'package:demo/presentation/books/books_cubit.dart';
import 'package:demo/presentation/splash_screen/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  late BooksCubit _booksCubit;

  @override
  void initState() {
   
    super.initState();
     _booksCubit = locator.get<BooksCubit>();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _booksCubit.goToHome(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _booksCubit,
      child: BlocListener<BooksCubit, BooksState>(
        listener: (context, state) {
          if(state is NavigateToHome){
            
          }
        },
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Text(""),
          ),
        ),
      ),
    );
  }
}
