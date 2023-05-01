package demo

class Employee {
    static belongsTo = [department: Department]
    String name
    Integer age
    String position

    static constraints = {
        name blank: false
        age blank: false
        position blank: false
        department nullable: true
    }

    static mapping = {
        department column: 'department_id'
        department joinTable: [name: 'employee', key: 'department_id']
    }

    String toString() {
        name
        position
    }
}

//class Employee {
//    static belongsTo = [departments: Department]
//    String name
//    Integer age
//    String position
//    Department department
//
//    static constraints = {
//        name blank: false
//        age blank: false
//        position blank: false
//        department nullable: true
//    }
//
//    static mapping = {
//        department column: 'department_id'
//    }
//
//    String toString() {
//        name
//    }
//}
