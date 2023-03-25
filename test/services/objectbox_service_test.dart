import 'package:clean_air/app/app.locator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ObjectBoxServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
