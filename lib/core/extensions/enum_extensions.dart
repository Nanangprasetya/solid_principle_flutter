import '../core.dart';

extension TypePageEnum on TypePage {
  bool get isForm => this == TypePage.form;
  bool get isDetail => this == TypePage.detail;
}

extension TypeFormEnum on TypeForm {
  bool get isEdit => this == TypeForm.edit;
  bool get isAdd => this == TypeForm.add;
}

extension MainTabEnum on MainTab {
  bool get isArticle => this == MainTab.article;
  bool get isPhotos => this == MainTab.photos;
  bool get isUsers => this == MainTab.users;
}

extension TypeButtonEnum on TypeButton {
  bool get isElevatedButton => this == TypeButton.elevatedButton;
  bool get isTextButton => this == TypeButton.textButton;
  bool get isOutlinedButton => this == TypeButton.outlinedButton;
  bool get isDisableButton => this == TypeButton.disableButton;
}
