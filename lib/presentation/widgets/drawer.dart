import 'package:backbase/common/theme/app_colors.dart';
import 'package:backbase/core/app_router/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DawerWidget extends StatefulWidget {
  const DawerWidget({super.key});

  @override
  State<DawerWidget> createState() => _DawerWidgetState();
}

class _DawerWidgetState extends State<DawerWidget> {
  @override
  void initState() {
    super.initState();

    getBuildInfo();
  }

  Future<void> getBuildInfo() async {}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
               ListTile(
                leading: Container(
                  width: 25,
                  height: 25,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.book,
                    color: AppColors.primary,
                  ),
                ),
                title: Text("My Books"),
                onTap: () {
                  context.pop();
                  context.push(AppRouteConstants.myBooksRouteName);
                },
              ),
              
              ListTile(
                leading: Container(
                  width: 25,
                  height: 25,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(Icons.info, color: AppColors.primary),
                ),
                title: Text("Device Information"),
                onTap: () {
                  context.pop();
                  context.push(AppRouteConstants.dashboardRouteName);
                },
              ),
              ListTile(
                leading: Container(
                  width: 25,
                  height: 25,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.flash_auto,
                    color: AppColors.primary,
                  ),
                ),
                title: Text("Flashlight"),
                onTap: () {
                  context.pop();
                  context.push(AppRouteConstants.flashlightRouteName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
