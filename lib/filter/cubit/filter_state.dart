part of 'filter_cubit.dart';

@freezed
class FilterState with _$FilterState {
  const factory FilterState({
    required bool isFiltered,
    required String startDate,
    required String endDate,
    required bool topup,
    required bool payment,
  }) = _FilterState;

  factory FilterState.initial() => const FilterState(
        isFiltered: false,
        startDate: '',
        endDate: '',
        topup: false,
        payment: false,
      );
  const FilterState._();
}
