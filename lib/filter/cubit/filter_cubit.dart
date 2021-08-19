import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_cubit.freezed.dart';
part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState.initial());

  void changeIsFiltered({required bool changeTo}) {
    emit(
      state.copyWith(
        isFiltered: changeTo,
      ),
    );
  }

  void changeStartDate(String date) {
    emit(
      state.copyWith(
        startDate: date,
      ),
    );
  }

  void changeEndDate(String date) {
    emit(
      state.copyWith(
        endDate: date,
      ),
    );
  }

  void changeTopup() {
    emit(
      state.copyWith(
        topup: !state.topup,
      ),
    );
  }

  void changePayment() {
    emit(
      state.copyWith(
        payment: !state.payment,
      ),
    );
  }

  void reset() {
    emit(
      state.copyWith(
        startDate: '',
        endDate: '',
        topup: false,
        payment: false,
      ),
    );
  }
}
