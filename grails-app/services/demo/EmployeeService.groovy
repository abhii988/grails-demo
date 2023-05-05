package demo

import grails.transaction.Transactional
import org.grails.web.json.JSONObject
import groovy.sql.Sql

@Transactional
class EmployeeService {
    def dataSource
    DepartmentService departmentService

    def saveEmployee(params) {
        try {
            def department = departmentService.getDepartment(Integer.parseInt(params.department_id))
            def employee = new Employee(params);
            employee.department =  department;
            if(employee.validate()) {
                employee.save flush:true
            } else {
                employee.errors.allErrors.each {
                    println it
                }
                return [errors: employee.errors]
            }
//            return employee.save(flush:true)
        }catch (Exception e) {
            println(e.message)
            return null;
        }
    }
    def updateEmployee(params) {
        try {
            def employee = getEmployee(Integer.parseInt(params.id))
            def department = Department.findById(Integer.parseInt(params.department_id))
            if(employee != null){
                employee.name = params.name
                employee.age = Integer.parseInt(params.age)
                employee.position = params.position
                employee.department =  department
                if(employee.validate()) {
                    employee.save flush:true
                } else {
                    employee.errors.allErrors.each {
                        println it
                    }
                    return [errors: employee.errors]
                }
            }else {
                return null
            }
        }catch (Exception e) {
            println(e.message)
            return null;
        }
    }

//    def saveEmployee( def params){
//        def department = Department.findById(Integer.parseInt(params.department_id))
//        def employee = new Employee(params);
//        employee.department =  department;
//        def result = employee.save();
//        println(result)
//        return result
//        [0].each{
//        def message =  new JSONObject()
//            try {
////                def employeeJson = request.JSON
////                def employeeInstance = new Employee(employeeJson)
////                employeeInstance = employeeInstance.save(flush:true)
////            if (!employeeInstance.hasErrors()){
////                return employeeInstance
////                message.put("status", "ok")
////                message.put("message", "Post Successfully !")
////                message.put("updatedResult", employeeInstance)
////            }else{
////                message.put("errorMessage", "Error !")
////            }
//            } catch(Exception ex) {
//                println(ex)
////            message.put("errorMessage", ex)
//            }
////        return message
//        }
//    }
//    def deleteEmployee(Long id) {
//        def employee = Employee.get(id)
//        if(employee) {
//            employee.delete()
//        }
//    }
//
    def getAllEmployees(params) {
//        String query = "select e.id as id, e.name as name, e.age as age, e.position as position, e.department_id as department_id, d.name as department_name from employee e join department d on e.department_id = d.id;"
//        def sql = new Sql(dataSource);
        def employeeList = Employee.list(params);
        return employeeList;
    }
    def list() {
        return Employee.findAll()
    }
    def getEmployeeCount() {
//        String query = "select count(id) from employee"
//        def sql = new Sql(dataSource);
//        def employeeCount = sql.rows(query);
        def employeeCount = Employee.count()
        return employeeCount.toString()
    }
    def getEmployee(Long id) {
        Employee.get(id)
    }
}
