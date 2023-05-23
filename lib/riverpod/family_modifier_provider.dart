import 'package:flutter_riverpod/flutter_riverpod.dart';

// family를 넣는 순간 2번째 파라미터(data)를 필요로 한다.
final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});
