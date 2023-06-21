part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class AddUser extends UserEvent {
  const AddUser({required this.user});

  final User user;
}

class ShowUser extends UserEvent {
  const ShowUser({required this.userIndex});

  final int userIndex;
}

class ListUsers extends UserEvent {}
