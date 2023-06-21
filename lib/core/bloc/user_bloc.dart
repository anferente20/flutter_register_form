import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_form/core/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserState userState) : super(UserState(users: [])) {
    on<UserEvent>(mapEventToState);
  }

  void mapEventToState(UserEvent event, Emitter<UserState> emit) async {
    if (event is AddUser) {
      List<User> users = state.users;
      users.add(event.user);
      UserState(users: users);
    }
  }
}
