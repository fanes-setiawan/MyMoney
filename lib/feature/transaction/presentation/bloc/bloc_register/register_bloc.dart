import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_money/feature/transaction/data/datasources/local/user_local_datasource.dart';
import 'package:my_money/feature/transaction/data/models/user_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserLocalDatasource localDatasource;
  RegisterBloc(this.localDatasource) : super(RegisterInitial()) {
    on<RegisterSubmitted>((event, emit) async{
      emit(RegisterLoading());
      try {
        final user = UserModel(
          name: event.name,
          email: event.email,
          password: event.password,
        );
        await localDatasource.insertUser(user);
        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterFailure('error, save user to local'));
      }
    });
  }
}
