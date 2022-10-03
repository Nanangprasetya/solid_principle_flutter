import 'package:equatable/equatable.dart';

class PhotosEntity extends Equatable {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  const PhotosEntity({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  static const empty = PhotosEntity(albumId: 0, id: 0, title: '', url: '', thumbnailUrl: '');

  bool get isEmpty => this == PhotosEntity.empty;

  bool get isNotEmpty => this != PhotosEntity.empty;

  @override
  List<Object?> get props => [albumId, id, title, url, thumbnailUrl];
}
