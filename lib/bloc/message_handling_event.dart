part of 'message_handling_bloc.dart';

@immutable
abstract class MessageHandlingBlocEvent {}

class MessageHandlingBlocShowError extends MessageHandlingBlocEvent {
  final Exception error;

  MessageHandlingBlocShowError({required this.error});
}

class MessageHandlingBlocShowSuccess extends MessageHandlingBlocEvent {
  final String message;

  MessageHandlingBlocShowSuccess({required this.message});
}
