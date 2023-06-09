package demo

class Department {
    String name
    String unit
    String manager

    static hasMany = [employees: Employee]

    static constraints = {
        name blank: false, unique: true
        unit blank: false, unique: true
        manager blank: false
        employees cascade: 'save-update'
    }
    String toString() {
        name
        unit
        manager
    }
}
