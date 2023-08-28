package com.cydeo.jdbctests.liveclass;

import oracle.jdbc.internal.XSCacheOutput;
import org.junit.jupiter.api.Test;

import javax.swing.*;
import java.sql.Connection;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class P01_JDBCPractice {
    //CONNECTION STRING
    String dbURL = "jdbc:oracle:thin:@54.158.68.99:1521:"; //:xe :XE
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void test1() throws SQLException {
        /*
        HOW TO INIT VARIABLE ?
        -> MAC --> OPT+ENTER
        -> WIN --> ALT+ENTER

         */
        // Driver manager will help us to create connection
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        // Statement help us to execute any query
        Statement stmnt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        // Resultset will store data after query execution
        ResultSet rs = stmnt.executeQuery("SELECT COUNTRY_ID,COUNTRY_NAME FROM COUNTRIES");


        /*

        RETRIVE DATA

        COUNTRY_ID - COUNTRY_NAME
        AR - Argentina

         */

        System.out.println("---- FIRST ROW -----");
        rs.next();
        System.out.println(rs.getString(1) + " - " + rs.getString(2));

        System.out.println("---- SECOND ROW -----");
        rs.next();
        System.out.println(rs.getString(1) + " - " + rs.getString(2));

        System.out.println("---- 10TH ROW -----");
        rs.absolute(10);
        System.out.println(rs.getString(1) + " - " + rs.getString(2));


        System.out.println("---- HOW MANY ROW WE HAVE  -----");
        System.out.println(rs.getRow());

        // HOW MANY ROW WE HAVE
        // jump into last row
        // get Row count
        rs.last();
        int rowCount = rs.getRow();
        System.out.println(rowCount);

        System.out.println("---- GET ME PREVIOUS ROW  -----");
        rs.previous();
        System.out.println(rs.getString(1) + " - " + rs.getString(2));


        rs.beforeFirst();
        System.out.println("---- PRINT ALL DATA DYNAMICALLY   -----");

        while (rs.next()) {
            System.out.println(rs.getString(1) + " - " + rs.getString(2));
        }

        /*
        What if we have more than 2 rows
         */

        ResultSetMetaData rsmd = rs.getMetaData();

        System.out.println("---- HOW MANY COLUMN WE HAVE    -----");
        int columnCount = rsmd.getColumnCount();
        System.out.println(columnCount);

        System.out.println("---- WHAT ARE COLUMN NAMES    -----");
        System.out.println(rsmd.getColumnName(1));
        System.out.println(rsmd.getColumnName(2));

        System.out.println("---- PRINT ALL COLUMN NAMES DYNAMICALLY   -----");
        for (int i = 1; i <= columnCount; i++) {
            System.out.println(rsmd.getColumnName(i));
        }


        System.out.println("---- GET ALL DATA DYNAMICALLY   -----");
        // COUNTRY_ID - AR  COUNTRY_NAME - Argentina
        // ITERATE EACH ROW DYNAMIC
        rs.beforeFirst();
        while (rs.next()) {
            //ITERATE EACH COLUMN DYNAMIC
            for (int i = 1; i <= columnCount; i++) {
                System.out.print(rsmd.getColumnName(i) + "-" + rs.getString(i) + "   ");
            }
            System.out.println();
        }


        rs.close();

        stmnt.close();

        conn.close();


    }

    }
