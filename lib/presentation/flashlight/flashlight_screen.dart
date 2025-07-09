import 'package:backbase/common/theme/app_colors.dart';
import 'package:backbase/core/di/service_locator.dart';
import 'package:backbase/presentation/flashlight/flashlight_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlashlightScreen extends StatefulWidget {
  const FlashlightScreen({super.key});

  @override
  State<FlashlightScreen> createState() => _FlashlightScreenState();
}

class _FlashlightScreenState extends State<FlashlightScreen> {
  late FlashlightCubit _flashlightCubit;

  @override
  void initState() {
    super.initState();
    _flashlightCubit = locator.get<FlashlightCubit>();
  }

  @override
  void dispose() {
    _flashlightCubit.turnOffFlashlight();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _flashlightCubit,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: AppColors.primary,
          title: Text("Flashlight", style: TextStyle(color: AppColors.white)),
        ),
        backgroundColor: AppColors.backgroundDarkShadeOrange,
        body: Container(
          padding: EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<FlashlightCubit, FlashlightState>(
                builder: (context, state) {
                  if (state is TurnOffFlashlight) {
                   return Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _flashlightCubit.turnOnFlashlight();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          backgroundColor: AppColors.primary,
                          shadowColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Turn On")],
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _flashlightCubit.turnOffFlashlight();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          backgroundColor: AppColors.secondary,
                          shadowColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Turn Off")],
                        ),
                      ),
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
