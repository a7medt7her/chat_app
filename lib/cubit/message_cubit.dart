import 'package:bloc/bloc.dart';
import 'package:chat_app/models/MessageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());

  final CollectionReference messages = FirebaseFirestore.instance.collection(
    'message',
  );

  Future<void> sendMessage(String message) async {
    try {
      await messages.add({'text': message, 'createdAt': DateTime.now()});
    } catch (e) {
      emit(MessageError(e.toString()));
    }
  }

  void getMessages() {
    messages.orderBy('createdAt', descending: true).snapshots().listen((
      snapshot,
    ) {
      final messageList = snapshot.docs
          .map(
            (doc) => Messagemodel.fromJson(doc.data() as Map<String, dynamic>),
          )
          .toList();

      emit(MessageSuccess(messageList));
    });
  }
}
