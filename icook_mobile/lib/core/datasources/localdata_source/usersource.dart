import 'package:hive/hive.dart';
import 'package:icook_mobile/core/utils/file_helper.dart';
import 'package:icook_mobile/models/serializers.dart';
import 'package:icook_mobile/models/user/user.dart';
import 'package:icook_mobile/models/user/user_h.dart';

import '../../../locator.dart';

abstract class UsersLocalDataSource {
  Future<void> init();

  Future<UserData> fetchUser();

  Future<void> cacheUser(UserData user);
}

class UsersLocalDataSourceImpl implements UsersLocalDataSource {
  final _fileHelper = locator<FileHelper>();
  final _hiveService = locator<HiveInterface>();

  bool get _isBoxOpen => _hiveService.isBoxOpen('user');
  Box<LocalUser> get _usersBox => _hiveService.box<LocalUser>('user');

  @override
  Future<void> init() async {
    final path = await _fileHelper.getApplicationDocumentsDirectoryPath();
    _hiveService.init(path);
    _hiveService.registerAdapter<LocalUser>(LocalUserAdapter());

    if (!_isBoxOpen) {
      await _hiveService.openBox<LocalUser>('user');
    }
  }

  @override
  Future<void> cacheUser(UserData user) async {
    return _usersBox.put(1, LocalUser.fromUserData(user));
  }

  @override
  Future<UserData> fetchUser() async {
    final userH = _usersBox.get(1);

    if (userH == null) {
      throw ('No user with 1 found in cache');
    }

    UserData data = serializers.deserializeWith(UserData.serializer, userH);
    print(data);

    return data;
  }
}
