import 'package:backbase/core/di/service_locator.dart';
import 'package:backbase/presentation/books/books_cubit.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
 late TextEditingController searchCtrl = TextEditingController();

 @override
  void initState() {
    super.initState();
     searchCtrl.addListener(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return TextField(
      // controller: searchCtrl,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          // onTap: () {
          //   searchCtrl.text = '';
          // },
          child: Icon(Icons.cancel)),
        hintText: "Search book by title",
      ),
      onChanged: (value) {
        locator.get<BooksCubit>().getBooks(value);
      },
      keyboardType: TextInputType.text,
    );
  }
}
