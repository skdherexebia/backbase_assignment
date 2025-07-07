import 'package:flutter_bloc/flutter_bloc.dart';
part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit()
      : super(BooksInitial());

  goToHome() async{
    await  Future.delayed(Duration(seconds: 1));
  }
}