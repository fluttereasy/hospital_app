import 'package:bloc/bloc.dart';
import 'package:hospital_app/OTP%20Directories/otp_screen.dart';
import 'package:hospital_app/Screens/Profile%20Screen/profile_details_servcies.dart';
import 'package:hospital_app/Screens/Profile%20Screen/profile_state.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../SHAREDPREFERENCE CONSTANT/shared_preference.dart';
import 'ProfileJsonModel/profileModel.dart';
part 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileDetailsServices profileDetailsServices = ProfileDetailsServices();
  ProfileModel profileModel = ProfileModel();

  ProfileBloc() : super(ProfileInitialState()) {
    on<ProfileLoadingEvent>((event, emit) async {
      try {
        final details = await profileDetailsServices
            .getUserDetails(event.mobileNumber.toString());
        emit(ProfileLoadedState(details));
        SharedPreferences sp = await SharedPreferences.getInstance();


        sp.setString(SharedPreferenceData.userName,
            details.dataInfo!.patientName.toString());
        sp.setString(
            SharedPreferenceData.userMail, details.dataInfo!.email.toString());
        sp.setString(
            SharedPreferenceData.userAge, details.dataInfo!.dob.toString());
        sp.setString(SharedPreferenceData.userGender,
            details.dataInfo!.gender.toString());

      } catch (e) {
        emit(ProfileFailedState(e.toString()));
      }
    });
  }
}
