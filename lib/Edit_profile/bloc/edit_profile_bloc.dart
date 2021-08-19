import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bill/packages/core_handler/form_submission_status.dart';
import 'package:bill/packages/user/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'edit_profile_bloc.freezed.dart';
part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(
    this.authRepo,
  ) : super(EditProfileState.initial());
  final AuthRepository authRepo;
  @override
  Stream<EditProfileState> mapEventToState(
    EditProfileEvent event,
  ) async* {
    yield* event.map(
      initial: (event) async* {
        var data = event.data;
        try {
          if (data['merchant_image'] != null) {
            yield state.copyWith(
              name: data['customer_name'] ?? '',
              bornPlace: data['born_place'] ?? '',
              bornDate: new DateFormat('yyyy-MM-dd')
                  .parse(data['born_date'] ?? '2020/04/03'),
              imageBytes: base64Decode(data['merchant_image']!),
            );
          } else {
            yield state.copyWith(
              name: data['customer_name'] ?? '',
              bornPlace: data['born_place'] ?? '',
              bornDate: new DateFormat('yyyy-MM-dd')
                  .parse(data['born_date'] ?? '2020/04/03'),
            );
          }
        } catch (e) {
          print(e);
        }
      },
      nameFormChanged: (event) async* {
        yield state.copyWith(
          name: event.name,
        );
      },
      bornPlaceFormChanged: (event) async* {
        yield state.copyWith(
          bornPlace: event.bornPlace,
        );
      },
      bornDateFormChanged: (event) async* {
        yield state.copyWith(
          bornDate: event.bornDate,
        );
      },
      knowUsFromChanged: (event) async* {
        yield state.copyWith(
          knowUsFrom: event.knowUsFrom,
        );
      },
      imageChanged: (event) async* {
        var img64 = base64Decode(event.image);
        yield state.copyWith(
          image: event.image,
          imageBytes: img64,
        );
      },
      formSubmitted: (event) async* {
        try {
          yield state.copyWith(
            formStatus: FormSubmitting(),
          );
          String _bornDate = DateFormat('yyyy-MM-dd').format(state.bornDate);
          await authRepo.editProfile(
            id: event.password,
            customerName: state.name,
            bornPlace: state.bornPlace,
            bornDate: _bornDate,
            image: state.image,
          );
          yield state.copyWith(
            showErrorMessages: true,
            formStatus: SubmissionSuccess(),
          );
        } catch (e) {
          print(e);
          yield state.copyWith(
            showErrorMessages: true,
            formStatus: SubmissionError(
              Exception(e),
            ),
          );
        }
      },
    );
  }
}
