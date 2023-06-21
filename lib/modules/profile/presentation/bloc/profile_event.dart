part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class InitialEvent extends ProfileEvent{}

class AddEvent extends ProfileEvent{}

class RemoveEvent extends ProfileEvent{}