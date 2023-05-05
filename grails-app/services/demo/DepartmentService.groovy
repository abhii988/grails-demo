package demo

import grails.transaction.Transactional
import groovy.sql.Sql

@Transactional
class DepartmentService {
    def dataSource
    def saveDepartment(params) {
        try {
            def department = new Department(params);
            if (department.validate()) {
                department.save flush: true
            } else {
                department.errors.allErrors.each {
                    println it
                }
                return [errors: department.errors]
            }
        }catch (Exception e) {
            println(e.message)
            return null;
        }
    }

    def updateDepartment(params) {
        try {
            def department = getDepartment(Integer.parseInt(params.id))
            if(department != null){
                department.name = params.name
                department.unit = params.unit
                department.manager =  params.manager
                if(department.validate()) {
                    department.save flush:true
                } else {
                    department.errors.allErrors.each {
                        println it
                    }
                    return [errors: department.errors]
                }
            }else {
                return null
            }
        }catch (Exception e) {
            println(e.message)
            return null;
        }
    }

    def deleteDepartment(Long id) {
        def department = Department.get(id)
        if(department) {
            department.delete()
        }
    }

    def getDepartments() {
        Department.list()
    }

    def getDepartment(Long id) {
        Department.get(id)
    }
    def getAllDepartments(params) {
        def departmentList = Department.list(params)
//        String query = "select * from department;"
//        def sql = new Sql(dataSource);
//
        return departmentList
    }
    def getDepartmentCount() {
        def departmentCount = Department.count()
//        String query = "select count(id) from department"
//        def sql = new Sql(dataSource);
//        def departmentCount = sql.rows(query);
        return departmentCount.toString()
    }


}
