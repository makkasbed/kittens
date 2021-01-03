import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:kittens/model/Services/CatPhotoApi.dart';
import 'package:kittens/model/Core/CatPhoto.dart';
import 'package:kittens/model/Glitch/NoInternetGlitch.dart';
import 'package:kittens/model/Glitch/Glitch.dart';

class CatPhotoHelper {
  final api = CatPhotoApi();
  Future<Either<Glitch, CatPhoto>> getRandomCatPhoto() async {
    final apiResult = await api.getRandomCatPhoto();
    return apiResult.fold((l) {
      // There can be many types of error but, for simplicity, we are going
      // to assume only NoInternetGlitch
      return Left(NoInternetGlitch());
    }, (r) {
      // the API returns breed, id, url, width, height, category, details etc
      // but we will take only the information we need in our app and ignore
      // the rest
      // here we will decode API result to CatPhoto
      final photo = CatPhoto.fromMap(jsonDecode(r)[0]);
      return Right(photo);
    });
  }
}