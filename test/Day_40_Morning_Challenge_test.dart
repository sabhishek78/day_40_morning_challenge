import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('Best Move', () {
    expect(bestMove([[], [1], [2,3,4]]),
        [[],[],[1,2,3,4]]);
  });
  test('Best Move', () {
    expect(bestMove([[1], [], [2,3,4]]),
        [[],[],[1,2,3,4]]);
  });

}