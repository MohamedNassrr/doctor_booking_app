import 'package:clinic_booking_app/features/home/presentation/controller/home_cubit/home_cubit.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var bottomNavCubit = context.read<HomeCubit>();
        return Scaffold(
          body: SafeArea(
            child: bottomNavCubit.screens[bottomNavCubit.currentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomNavCubit.currentIndex,
            onTap: (index) {
              bottomNavCubit.changeBotNavBarIndex(index);
            },
            elevation: 1,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidHouse),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidCalendarDays),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidUser),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
