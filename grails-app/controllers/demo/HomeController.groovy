package demo

import groovy.sql.Sql

class HomeController {
    EmployeeService employeeService
    def dataSource

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def index() {
        String query = "select e.id as id, e.name as name, e.age as age, e.position as position, e.department_id as department_id, d.name as department_name, d.unit as department_unit, d.manager as department_manager from employee e join department d on e.department_id = d.id;"
        def sql = new Sql(dataSource);
        def employeeList = sql.rows(query);
        render(view: '/index', model: [employeeList: employeeList, employeeCount: employeeService.getEmployeeCount()])
    }
}