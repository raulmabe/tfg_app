part of 'delete_ads_bloc.dart';

@immutable
abstract class DeleteAdsState {}

class DeleteAdsInitial extends DeleteAdsState {}

class DeleteAdsLoading extends DeleteAdsState {}

class DeleteAdsSuccess extends DeleteAdsState {}

class DeleteAdsFailure extends DeleteAdsState {}
