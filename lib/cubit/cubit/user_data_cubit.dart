import 'package:bloc/bloc.dart';
import 'package:chat_app/models/userdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());
  final CollectionReference users = FirebaseFirestore.instance.collection(
    'users',
  );
  Future<void> senduserdata(
    String name,
    String bio,
    String age,
    String gender,
    String id,
    String imgeurl,
  ) async {
    try {
      await users.doc(id).set({
        'name': name,
        'bio': bio,
        'age': age,
        'gender': gender,
        'imgeurl': imgeurl,
      });
      emit(UserDataSuccess());
    } catch (e) {
      emit(UserDataError(e.toString()));
    }
  }

  Future<void> getUserData() async {
    try {
      emit(UserDataLoading());

      final uid = FirebaseAuth.instance.currentUser!.uid;

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (doc.exists) {
        final userModel = Userdata.fromJson(doc.data()!);
        emit(UserDataLoaded(userModel));
      } else {
        emit(UserDataError("User not found"));
      }
    } catch (e) {
      emit(UserDataError("Something went wrong"));
    }
  }
}
