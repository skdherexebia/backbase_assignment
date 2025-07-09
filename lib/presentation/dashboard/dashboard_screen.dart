
import 'package:backbase/common/theme/app_colors.dart';
import 'package:backbase/core/di/service_locator.dart';
import 'package:backbase/presentation/dashboard/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DashboardCubit _dashboardCubit;

  @override
  void initState() {
    super.initState();
    _dashboardCubit = locator.get<DashboardCubit>();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _dashboardCubit.getBatteryLevel(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _dashboardCubit,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: AppColors.primary,
          title: Text(
            "Device Information",
            style: TextStyle(color: AppColors.white),
          ),
        ),
        backgroundColor: AppColors.backgroundDarkShadeOrange,
        body: Container(
          padding: EdgeInsets.all(14),
          child: Column(
            children: [
              BlocBuilder<DashboardCubit, DashboardState>(
                buildWhen:
                    (previous, current) =>
                        previous != current && current is BatteryPercentage,
                builder: (context, state) {
                  if (state is BatteryPercentage) {
                    return Text(state.percentage);
                  } else {
                    return Lottie.asset(
                      'assets/json/loader.json',
                      backgroundLoading: false,
                      addRepaintBoundary: true,
                      animate: true,
                    );
                  }
                },
              ),
              BlocBuilder<DashboardCubit, DashboardState>(
                buildWhen:
                    (previous, current) =>
                        previous != current && current is DeviceName,
                builder: (context, state) {
                  if (state is DeviceName) {
                    return Text(state.deviceName);
                  } else {
                    return Lottie.asset(
                      'assets/json/loader.json',
                      backgroundLoading: false,
                      addRepaintBoundary: true,
                      animate: true,
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
