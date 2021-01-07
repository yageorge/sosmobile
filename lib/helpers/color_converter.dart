// Converts color from database to hex flutter colors
// example: #64DD17 to 0xFF64DD17

String colorConverter(String color) {
  // Removing # from the beginning
  final String trimmedColor = color.substring(1, color.length);
  // Adding 0xFF
  final String convertedColor = '0xFF' + trimmedColor;
  return convertedColor;
}
