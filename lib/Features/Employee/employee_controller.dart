import 'package:get/get.dart';

import '../../Utils/loading_statud.dart';
import 'employee_model.dart';
import 'employee_services.dart';

class EmployeeController extends GetxController {
  EmployeeListModel? employeeList = EmployeeListModel.fromJson({
    "status": LoadingStatus.NOT_STARTED,
    "page": 1,
    "last_page": 1,
    "list": [],
  });
// ========================================
// =========== Load List OF Employees ================
// ========================================

  Future loadEmployeeList() async {
    employeeList!.status = LoadingStatus.IN_PROGRESS;
    update();

    employeeList = await EmployeeAPI().loadEmployeeListAPI(1, 2);
    update();
  }
}
