part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class LoadingState extends ProfileState {}

class DataState extends ProfileState {
  final int data;

  DataState({
    this.data = 0,
  });
}
