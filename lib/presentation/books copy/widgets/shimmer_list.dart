import 'package:backbase/common/extensions/sized_box_extension.dart';
import 'package:backbase/presentation/books/widgets/shimmer_ite.dart';
import 'package:flutter/material.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key,});
  

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ShimmerItem();
      },
      itemCount: 20, separatorBuilder: (BuildContext context, int index) { 
        return 20.heightBox;
       },
    );
    
  }
}
