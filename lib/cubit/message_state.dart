part of 'message_cubit.dart';

sealed class MessageState extends Equatable {
  const MessageState();
}

class MessageInitial extends MessageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MessageLoading extends MessageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MessageSuccess extends MessageState {
  final List<Messagemodel> messages;
  MessageSuccess(this.messages);
  @override
  List<Object?> get props => [messages];
}

class MessageError extends MessageState {
  final String error;
  MessageError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
