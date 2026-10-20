import 'package:flutter_test/flutter_test.dart';
import 'package:selvarin/core/utils/price_formatter.dart';

void main() {
  test('formats whole dollars with thousands separators', () {
    expect(PriceFormatter.usd(950), r'$950');
    expect(PriceFormatter.usd(8400), r'$8,400');
    expect(PriceFormatter.usd(1250000), r'$1,250,000');
  });
}
