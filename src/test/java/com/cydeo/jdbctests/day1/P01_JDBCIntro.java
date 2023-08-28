package com.cydeo.jdbctests.day1;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P01_JDBCIntro {

        //CONNECTION STRING
        String dbURL = "jdbc:oracle:thin:@54.158.68.99:1521:"; //:xe :XE
        String dbUsername = "hr";
        String dbPassword = "hr";

    @Test
   public void task1() throws SQLException {

        //we use here 3 interfaces Connection, Statement, ResultSet
        //Create the connection
        //DriverManager class getConnection Method will help to connect database
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        //It will help us to execute queries
        Statement statement = conn.createStatement();

        //ResultSet will store data after execution. It stores only data(there is no table info)
        ResultSet rs = statement.executeQuery("select * from DEPARTMENTS where MANAGER_ID is not null ");

        //10-Administration-200-1700

        //rs.next(); -->only for one row
        //System.out.println(rs.getInt(1)+" - "+rs.getString(2)+" - "+ rs.getInt(3)+" - "+ rs.getInt(4) );

        while(rs.next()){ //--> for all rows
            System.out.println(rs.getString(2)+" - "+ rs.getInt(3)+" - "+ rs.getInt(4) );
        }


        //can we run another query in same connection?  - yes
        System.out.println("------LoCATIONS---------------");
        rs = statement.executeQuery("select * from LOCATIONS ");

        while(rs.next()){
            System.out.println(rs.getString(1)+" - "+rs.getString(2)+" - "+rs.getString(4));
        }






        //close connection
        rs.close();
        statement.close();
        conn.close();
    }
}

