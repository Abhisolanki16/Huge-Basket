import 'dart:math';

class OtpVarification {
  final Random random = Random();
   int otp = 0;
  void generateRandomNumber() {
    otp = 1000 + random.nextInt(9000);
    
  }
}
