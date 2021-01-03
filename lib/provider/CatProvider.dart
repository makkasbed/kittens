import 'package:kittens/model/Helper/CatPhotoHelper';
import 'package:kittens/model/glitch/glitch.dart';
import 'package:kittens/model/core/catphoto.dart';
import 'package:provider/provider.dart';

class CatProvider extends ChangeNotifier {
  final _helper = CatPhotoHelper();
  final _streamController = StreamController<Either<Glitch, CatPhoto>>();
  Stream<Either<Glitch, CatPhoto>> get catPhotoStream {
    return _streamController.stream;
  }
  Future<void> getTwentyRandomPhoto() async {
    for (int i = 0; i < 20; i++) {
      final catHelperResult = await _helper.getRandomCatPhoto();
      _streamController.add(catHelperResult);
    }
  }
  void refreshGird() {
    getTwentyRandomPhoto();
  }
}