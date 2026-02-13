import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> signUp({required String email, required String password}) async {
    emit(AuthLoading());

    try {
      var auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    try {
      var auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
