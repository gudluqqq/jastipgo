import 'package:jastipgo/database/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserLoginDatabase {
  final database = Supabase.instance.client.from('username');

  Future<bool> isDuplicate(String nama, String email) async {
    final response =
        await database
            .select()
            .eq('nama', nama)
            .eq('email', email)
            .maybeSingle();
    return response != null;
  }

  Future<bool> createUser(UserLogin newUser) async {
    bool duplicate = await isDuplicate(newUser.nama, newUser.email);
    if (!duplicate) {
      await database.insert(newUser.toMap());
      return true;
    } else {
      return false;
    }
  }

  final stream = Supabase.instance.client
      .from('username')
      .stream(primaryKey: ['id'])
      .map(
        (data) => data.map((userMap) => UserLogin.fromMap(userMap)).toList(),
      );

  Future updateUser(UserLogin oldUser, String nama, String email) async {
    await database.update({'nama': nama, 'email': email}).eq('id', oldUser.id!);
  }

  Future deleteUser(UserLogin user) async {
    await database.delete().eq('id', user.id!);
  }
}
