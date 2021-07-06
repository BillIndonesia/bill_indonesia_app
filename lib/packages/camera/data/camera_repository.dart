class CameraRepository {
  Future<bool> scanVoucher(String qrCode) async {
    await Future.delayed(
      Duration(
        seconds: 2,
      ),
    );
    return false;
  }
}
