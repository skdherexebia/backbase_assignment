import 'package:backbase/common/extensions/sized_box_extension.dart';
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
    return BlocProvider.value(
      value: _dashboardCubit,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.primary,
          title: const Text(
            "Device Information",
            style: TextStyle(color: AppColors.white),
          ),
        ),
        backgroundColor: AppColors.backgroundDarkShadeOrange,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Battery Level Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Battery Level:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  10.widthBox,
                  BlocBuilder<DashboardCubit, DashboardState>(
                    buildWhen: (previous, current) =>
                        current is BatteryPercentage,
                    builder: (context, state) {
                      if (state is BatteryPercentage) {
                        return Text(
                          state.percentage,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else {
                        return _buildLoader();
                      }
                    },
                  ),
                ],
              ),

              40.heightBox,

              // Device Information Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Device Information:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  10.widthBox,
                  Expanded(
                    child: BlocBuilder<DashboardCubit, DashboardState>(
                      buildWhen: (previous, current) => current is DeviceName,
                      builder: (context, state) {
                        if (state is DeviceName) {
                          return Text(
                            state.deviceName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else {
                          return _buildLoader();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return SizedBox(
      height: 60,
      width: 80,
      child: Lottie.asset(
        'assets/json/loader.json',
        animate: true,
      ),
    );
  }
}
