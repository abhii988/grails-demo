package demo

import grails.transaction.Transactional

@Transactional
class DepartmentService {

    def saveDepartment(Department department) {
        if(department.validate()) {
            department.save flush:true
        } else {
            return [errors: department.errors]
        }
    }

    def updateDepartment(Department department) {
        if(department.validate()) {
            department.save flush:true
        } else {
            return [errors: department.errors]
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
    def list() {
        def departmentList = Department.list()
        return departmentList
    }
    def count() {
        def departmentCount = Department.count()
        return departmentCount.toString()
    }


}
