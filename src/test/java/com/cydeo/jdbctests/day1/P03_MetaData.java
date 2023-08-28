package com.cydeo.jdbctests.day1;

import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.time.temporal.TemporalAdjusters.next;

public class P03_MetaData {

    String dbURL = "jdbc:oracle:thin:@54.158.68.99:1521:"; //:xe :XE
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task1() throws SQLException {

        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select FIRST_NAME,LAST_NAME,SALARY from EMPLOYEES where rownum<6");
       // ResultSet rs = statement.executeQuery("select count(*) from EMPLOYEES");

        //DatabaseMetaData
        DatabaseMetaData dbMetaData = conn.getMetaData();

        System.out.println(dbMetaData.getUserName());
        System.out.println(dbMetaData.getDatabaseProductName());
        System.out.println(dbMetaData.getDatabaseProductVersion());
        System.out.println(dbMetaData.getDriverName());

        //ResultSetMetaData
        ResultSetMetaData rsmd = rs.getMetaData();

        //how many columns we have?
        int columnCount = rsmd.getColumnCount();
        System.out.println("columnCount = " + columnCount); //11

        //second column name?
        System.out.println("rsmd.getColumnName(2) = " + rsmd.getColumnName(1));  //FIRST_NAME

        //print all column names dynamically
        System.out.println("------Column Names-----------");
        for (int i = 1; i <= columnCount; i++) { //in sql index starts 1
            System.out.println(rsmd.getColumnName(i));
        }

        /*
              ResultSet                  --> it holds table data
              rs.next()                  --> it iterates each row dynamically (with while loop)
              rs.getString(ColumnIndex)  --> to retrieve data itself
              rs.getString(ColumnName)
              ResultSetMetaData          --> IT HOLDS TABLE INFORMATION (columnNames - Column Count)
              rsmd.getColumCount()       --> how many columns we have?
              rsmd.getColumnName(index); --> it will give specific column name
         */


        System.out.println("----Homework--------");
        //write a code , that print whole table information for every query.
        //ColumnName  - Column VALUE
        //EMPLOYEE_ID - 100
        //FIRST_NAME  - Steven

        System.out.println("----PRINT ALL DATA DYNAMICALLY---------");

        //iterate through each row
        while (rs.next()) {
            //whatever we do, we will do for each row
            //REGION_ID - 1  REGION_NAME - EUROPA
            //REGION_ID - 2  REGION_NAME - AMERICAS
            //iterate each column
            for (int i = 1; i <= columnCount; i++) {
                System.out.print(rsmd.getColumnName(i) + " - " + rs.getString(i)+" ");
            }
            System.out.println();
               }



            //close connection
            rs.close();
            statement.close();
            conn.close();

        }
}