import mysql.connector
from db_config import DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE

def create_connection():
    return mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=DB_DATABASE
    )
from db_connection import create_connection

def add_employee(first_name, last_name, date_of_birth, gender, address, phone, email, department_id):
    connection = create_connection()
    cursor = connection.cursor()
    query = "INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, Address, Phone, Email, DepartmentID) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
    values = (first_name, last_name, date_of_birth, gender, address, phone, email, department_id)
    cursor.execute(query, values)
    connection.commit()
    cursor.close()
    connection.close()

def get_employee(employee_id):
    connection = create_connection()
    cursor = connection.cursor()
    query = "SELECT * FROM Employee WHERE EmployeeID = %s"
    cursor.execute(query, (employee_id,))
    result = cursor.fetchone()
    cursor.close()
    connection.close()
    return result

def update_employee(employee_id, first_name=None, last_name=None, address=None, phone=None, email=None):
    connection = create_connection()
    cursor = connection.cursor()
    query = "UPDATE Employee SET FirstName = %s, LastName = %s, Address = %s, Phone = %s, Email = %s WHERE EmployeeID = %s"
    values = (first_name, last_name, address, phone, email, employee_id)
    cursor.execute(query, values)
    connection.commit()
    cursor.close()
    connection.close()

def delete_employee(employee_id):
    connection = create_connection()
    cursor = connection.cursor()
    query = "DELETE FROM Employee WHERE EmployeeID = %s"
    cursor.execute(query, (employee_id,))
    connection.commit()
    cursor.close()
    connection.close()

# Example of adding an employee
add_employee('John', 'Doe', '1985-08-15', 'Male', '123 Elm St', '555-1234', 'john.doe@example.com', 1)

# Example of getting an employee
employee = get_employee(1)
print(employee)

# Example of updating an employee
update_employee(1, address='456 Oak St', phone='555-5678')

# Example of deleting an employee
delete_employee(1)

