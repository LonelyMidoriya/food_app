part of 'bloc.dart';

abstract class AdminControlPanelEvent {}

class AdminControlPanelInitEvent implements AdminControlPanelEvent {}

class GiveAdminRightsEvent implements AdminControlPanelEvent {
  final UserModel user;

  GiveAdminRightsEvent({
    required this.user,
  });
}

class TakeAdminRightsEvent implements AdminControlPanelEvent {
  final UserModel user;

  TakeAdminRightsEvent({
    required this.user,
  });
}

class SetInternetAdminEvent implements AdminControlPanelEvent {
  final bool hasInternet;

  SetInternetAdminEvent({
    required this.hasInternet,
  });
}

class GetSearchedUsersEvent implements AdminControlPanelEvent {
  final String searchQuery;

  GetSearchedUsersEvent({
    required this.searchQuery,
  });
}
