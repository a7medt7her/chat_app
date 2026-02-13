import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());
  CollectionReference Message = FirebaseFirestore.instance.collection(
    'Message',
  );
  Future<void> sendMessage(String message) async {
    try {
      emit(MessageLoading());

      await Message.add({'text': message});

      emit(MessageSuccess());
    } catch (e) {
      emit(MessageError(e.toString()));
    }
  }
}
