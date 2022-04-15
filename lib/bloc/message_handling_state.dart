part of 'message_handling_bloc.dart';

@immutable
abstract class MessageHandlingBlocState {}

class MessageHandlingBlocInitial extends MessageHandlingBlocState {}

class MessageHandlingBlocError extends MessageHandlingBlocState {
  final String error;

  MessageHandlingBlocError({required this.error});
}

class MessageHandlingBlocSuccess extends MessageHandlingBlocState {
  final String message;

  MessageHandlingBlocSuccess({required this.message});
}
