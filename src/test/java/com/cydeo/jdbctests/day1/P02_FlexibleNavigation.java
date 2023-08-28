package com.cydeo.jdbctests.day1;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P02_FlexibleNavigation {

    String dbURL = "jdbc:oracle:thin:@54.158.68.99:1521:"; //:xe :XE
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task1() throws SQLException {

        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select First_name, last_name from Employees");

        //first row
        rs.next();
        System.out.println(rs.getString(1)+" "+rs.getString(2));


        //second row
        rs.next();
        System.out.println(rs.getString(1)+" "+rs.getString(2));


        //last row
        //Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                                                 // -to do flexible navigation between rows, do not update anything from database, only read
        rs.last();
        System.out.println(rs.getString(1)+" "+rs.getString(2));

        //how many rows we have (last+getRow)
        int rowNumber = rs.getRow();   //the current row number ; 0 if there is no current row
        System.out.println("rowNumber = " + rowNumber);

        //write any number  , learn any row
        System.out.println("---------ABSOLUTE-----------");
        rs.absolute(46); //true if the cursor is moved to a position in this ResultSet object; false if the cursor is before the first row or after the last row
        System.out.println(rs.getString(1)+" "+rs.getString(2));  //Alexander

        System.out.println("--------Previous-----------");
        rs.previous();  //
        System.out.println(rs.getString(1)+" "+rs.getString(2));  //Guy Himuro


        System.out.println("-----Printing table---------");
        //print the whole table
        rs.first();//if we use first() before while loop, loop will start second row so use beforeFirst method

        rs.beforeFirst(); //jump into  before first row

        while(rs.next()){ //while loop will continue with 46. because previous method is used before while, so we will use rs.beforeFirst()
            System.out.println(rs.getString(1)+" - "+rs.getString(2));
        }


        //close connection
        rs.close();
        statement.close();
        conn.close();

    }
}