part of 'user_data_cubit.dart';

sealed class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

final class UserDataInitial extends UserDataState {}

final class UserDataLoading extends UserDataState {}

final class UserDataLoaded extends UserDataState {
  final Userdata userdata;
  UserDataLoaded(this.userdata);
}

final class UserDataSuccess extends UserDataState {}

final class UserDataError extends UserDataState {
  final String error;

  const UserDataError(this.error);

  @override
  List<Object> get props => [error];
}
