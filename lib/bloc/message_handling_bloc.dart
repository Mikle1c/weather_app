import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'message_handling_event.dart';
part 'message_handling_state.dart';

class MessageHandlingBloc
    extends Bloc<MessageHandlingBlocEvent, MessageHandlingBlocState> {
  bool transitionFromProfile;

  MessageHandlingBloc({
    this.transitionFromProfile = false,
  }) : super(MessageHandlingBlocInitial()) {
    on<MessageHandlingBlocEvent>((event, emit) async {
      if (event is MessageHandlingBlocShowError) {
        var errorMessage = '';
        final _error = event.error;
        if (_error is DioError) {
          if (_error.response?.statusCode == 401 ||
              _error.response?.statusCode == 403 ||
              _error.response?.statusCode == 404 ||
              _error.response?.statusCode == 405) {
            errorMessage = _error.response?.data['text'];
          }

          emit.call(MessageHandlingBlocError(error: errorMessage));
        }
      } else if (event is MessageHandlingBlocShowSuccess) {
        emit.call(MessageHandlingBlocSuccess(message: event.message));
      }
    });
  }
}
