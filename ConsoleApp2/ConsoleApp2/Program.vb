
Imports System.Data
Imports MySql.Data.MySqlClient
Imports System.Threading

Module Program
    Dim connection As String = "server=localhost; user=root; password='';database=traveo", vtemp As String = ""

    Private Sub CheckDBChange(ByVal o As Object)

        Dim conn As MySqlConnection = New MySqlConnection(connection)
        Try
            Dim vsql = "SELECT GROUP_CONCAT(update_time)
                        FROM information_schema.tables
                        WHERE table_schema='traveo'"
            If Not conn.State = ConnectionState.Open Then conn.Open()
            Dim mycommand As New MySqlCommand(vsql, conn)
            mycommand.CommandText = vsql
            Dim value As Object = mycommand.ExecuteScalar()
            If vtemp <> value.ToString() Then ' to check if data updated
                GetData(conn)
                vtemp = value.ToString()
            End If
        Catch ex As Exception
        Finally
            If Not conn.State = ConnectionState.Closed Then conn.Close()
        End Try

    End Sub

    Sub Main(args As String())

        Dim t As Timer = New Timer(AddressOf CheckDBChange, Nothing, 0, 5000) ' Timer runs every 5 seconds
        Console.ReadLine()

    End Sub

    Private Sub GetData(conn)

        Try
            Dim sql = "SELECT DISTINCT(`ProfessorName`) AS Professors,GROUP_CONCAT(DISTINCT `StudentName` ORDER BY StudentName) AS Students FROM `studentenrollment` 
                        JOIN `professors` ON (`professors`.`CourseId` = studentenrollment.`CourseId`)
                        JOIN `students` ON (`students`.`StudentId` = studentenrollment.`StudentId`)
                        GROUP BY ProfessorName
                        ORDER BY ProfessorName"

            Dim command = New MySqlCommand(sql, conn)
            If Not conn.State = ConnectionState.Open Then conn.Open()
            Dim reader As MySqlDataReader = command.ExecuteReader()

            Console.WriteLine("------- list of all the students taught by all the professors--------")
            Console.WriteLine()
            While reader.Read()
                For i As Integer = 0 To reader.FieldCount - 1
                    Console.WriteLine("Professor: " & reader.GetValue(i) & "    Students: " & reader.GetValue(i + 1))
                    i += 1
                Next
                Console.WriteLine("--------------------")
                Console.WriteLine()
            End While

        Catch ex As Exception
        End Try

    End Sub

End Module
