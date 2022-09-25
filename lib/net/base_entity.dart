
import '../generated/json/base/json_convert_content.dart';
import 'constant.dart';

class BaseEntity<T> {

  BaseEntity(this.code, this.message,this.success, this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json[Constant.code] as int?;
    message = json[Constant.message] as String;
    success = json[Constant.success] as bool;
    if (json.containsKey(Constant.data)&&json[Constant.data]!=null) {
      data = _generateOBJ<T>(json[Constant.data] as Object);
    }
  }

  int? code;
  late String message;
  late bool success;
  T? data;

  T? _generateOBJ<O>(Object json) {
    if (T.toString() == 'String') {
      return json.toString() as T;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      return json as T;
    } else {
      /// List类型数据由fromJsonAsT判断处理
      return JsonConvert.fromJsonAsT<T>(json);
    }
  }
}
