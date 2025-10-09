import 'package:clinic_booking_app/core/utils/assets_data.dart';

class OnboardingModel {
  final String imageUrl;
  final String title;
  final String description;

  OnboardingModel({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  static final List<OnboardingModel> onBoardingItems = [
    OnboardingModel(
      imageUrl: AssetsData.onboardingOne,
      title: 'Consult Your Doctor Online',
      description:
          'Connect instantly with qualified doctors from the comfort of your home. Get medical advice, prescriptions, and follow-ups through secure video consultations.',
    ),
    OnboardingModel(
      imageUrl: AssetsData.onboardingTwo,
      title: 'Easy Appointment Scheduling',
      description:
          'Book, reschedule, or cancel your appointments in just a few taps. Choose your preferred doctor, date, and time — morning, afternoon, or evening.',
    ),
    OnboardingModel(
      imageUrl: AssetsData.onboardingThree,
      title: 'Expert Medical Team',
      description:
          'Our trusted team of experienced doctors and specialists is here to provide you with top-quality care and guidance every step of the way.',
    ),
  ];
}
