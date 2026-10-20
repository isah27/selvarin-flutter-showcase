/// Formats whole-dollar prices with thousands separators, e.g. $12,400.
abstract final class PriceFormatter {
  static String usd(int amount) {
    final String digits = amount.toString();
    final StringBuffer out = StringBuffer(r'$');
    for (int i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) {
        out.write(',');
      }
      out.write(digits[i]);
    }
    return out.toString();
  }
}
