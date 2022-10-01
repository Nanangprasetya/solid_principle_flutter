part of 'app_pages.dart';

abstract class AppRoutes {
  static const String home = _Routes.home;
  static const String articleDetail = _Routes.articleDetail;
  static const String photosDetail = _Routes.photosDetail;
  static const String usersDetail = _Routes.usersDetail;
  static const String articleForm = _Routes.articleForm;
  static const String photosForm = _Routes.photosForm;
  static const String usersForm = _Routes.usersForm;
}

// ignore: unused_element
class _Routes {
  static const String home = '/';
  static const String articleDetail = '/article_detail';
  static const String photosDetail = '/photos_detail';
  static const String usersDetail = '/users_detail';
  static const String articleForm = '/article_form';
  static const String photosForm = '/photos_form';
  static const String usersForm = '/users_form';
}
