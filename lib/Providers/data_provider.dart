
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_fakeapi/Servies/service.dart';

final userDataProvider=FutureProvider((ref) async{
  return ref.watch(userProvider).getUsers();
});