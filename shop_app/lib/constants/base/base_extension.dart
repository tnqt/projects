import 'package:shop_app/shop_app.dart';

extension CustomDialogTypeExtension on CustomDialogType {
  static const _rawTitle = {
    CustomDialogType.info: 'Thông tin',
    CustomDialogType.success: 'Thành công',
    CustomDialogType.error: 'Lỗi',
    CustomDialogType.warning: 'Cảnh báo',
    CustomDialogType.question: 'Câu hỏi',
    CustomDialogType.noHeader: '',
  };

  String? get titleText => _rawTitle[this];
}