import 'package:get_storage/get_storage.dart';

bool hasPermission(String permission) {
  final permissions = GetStorage().read('permissions') as List<dynamic>;
  return permissions.contains('Permission.$permission');
}
