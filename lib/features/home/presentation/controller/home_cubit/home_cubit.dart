import 'package:bloc/bloc.dart';
import 'package:clinic_booking_app/core/utils/assets_data.dart';
import 'package:clinic_booking_app/features/doctor_booking/presentation/views/doctor_booking_view.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/home_cubit/home_states.dart';
import 'package:clinic_booking_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:clinic_booking_app/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/widgets.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialStates());

  List<Widget> screens = const [
    HomeViewBody(),
    DoctorBookingView(),
    ProfileView(),
  ];

  List<String> banners =[
    AssetsData.sliderImageOne,
    AssetsData.sliderImageTwo,
    AssetsData.sliderImageThree,
  ];
  int currentIndex = 0;
  void changeBotNavBarIndex(int index){
    currentIndex = index;
    if(index == 1){
       const DoctorBookingView();
       
    }
    if(index == 2){
      const ProfileView();
    }
    emit(BottomNavChangeIndexStates());
  }


  int currentBanner = 0;
  void changeBanner(int index){
    currentBanner = index;
    emit(BannerChangeIndexStates());
  }
}
