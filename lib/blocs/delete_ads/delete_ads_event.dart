part of 'delete_ads_bloc.dart';

@immutable
abstract class DeleteAdsEvent {}

class AdDeleted extends DeleteAdsEvent {
  final Ad ad;
  AdDeleted({this.ad});
}
