part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState{}
class RegisterSuccess extends RegisterState{}
class RegisterFailure extends RegisterState{
  final String message;
  RegisterFailure(this.message);
}
