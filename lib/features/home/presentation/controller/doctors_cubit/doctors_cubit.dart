import 'package:bloc/bloc.dart';
import 'package:clinic_booking_app/features/home/data/models/doctors_details_model.dart';
import 'package:clinic_booking_app/features/home/data/repos/home_repos/home_repo.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/doctors_cubit/doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsStates> {
  DoctorsCubit(this.homeRepo) : super(DoctorsInitialStates());

  final HomeRepo homeRepo;
  Map<int, List<DoctorsDetailsModel>> doctorsByClinic = {};
  Map<int, List<DoctorsDetailsModel>> doctorsBySpec = {};

  Future<void> getDoctors() async {
    emit(DoctorsLoadingStates());
    final doctors = await homeRepo.fetchDoctors();
    final clinics = await homeRepo.fetchClinics();
    final categories = await homeRepo.fetchCategories();

    if (doctors.isLeft()) {
      emit(
        DoctorsFailureStates(
          doctors.swap().getOrElse(() => throw Exception()).errMessage,
        ),
      );
    }
    if (clinics.isLeft()) {
      emit(
        DoctorsFailureStates(
          clinics.swap().getOrElse(() => throw Exception()).errMessage,
        ),
      );
    }
    if (categories.isLeft()) {
      emit(
        DoctorsFailureStates(
          categories.swap().getOrElse(() => throw Exception()).errMessage,
        ),
      );
    }

    final mappedDoctors = await homeRepo.mapDoctorsDetails(
      doctors.getOrElse(() => []),
      clinics.getOrElse(() => []),
      categories.getOrElse(() => []),
    );
    mappedDoctors.fold(
      (failure) => emit(DoctorsFailureStates(failure.errMessage)),
      (mappedDoctors) {
        groupedDoctorsByClinic(mappedDoctors);
        emit(DoctorsSuccessStates(mappedDoctors));
      },
    );
  }

  void groupedDoctorsByClinic(List<DoctorsDetailsModel> doctors) {
    doctorsByClinic.clear();

    for (var doctor in doctors) {
      final clinicId = doctor.clinic.id;
      if (!doctorsByClinic.containsKey(clinicId)) {
        doctorsByClinic[clinicId!] = [];
      }
      doctorsByClinic[clinicId]!.add(doctor);
    }
  }

  List<DoctorsDetailsModel> getDoctorsByClinic(int clinicId) {
    return doctorsByClinic[clinicId] ?? [];
  }
}
