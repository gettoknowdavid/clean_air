import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/ui/views/home/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel _getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('showBottomSheet -', () {
      test('When called, should show custom bottom sheet using notice variant',
          () {});
    });
  });
}
