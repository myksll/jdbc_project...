package com.cydeo.jdbctests;

import java.sql.*;

public class TestOracleConnection {

    public static void main(String[] args) throws SQLException {

            //CONNECTION STRING
            String dbURL = "jdbc:oracle:thin:@54.158.68.99:1521:"; //:xe :XE
            String dbUsername = "hr";
            String dbPassword = "hr";

            //we use here 3 interfaces Connection, Statement, ResultSet
            //Create the connection
            //DriverManager class getConnection Method will help to connect database
            Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            //It will help us to execute queries
            Statement statement = conn.createStatement();

            //ResultSet will store data after execution. It stores only data(there is no table info)
            ResultSet rs = statement.executeQuery("select * from DEPARTMENTS");


           /* //Getting DATA
            rs.next();
            System.out.println("---------FIRST ROW---------");

            //Right now pointer is in the first row


            //how to get data from first row ?
            //rs.getInt(index) --> this method returns integer. Index start from 1 in SQL. It refers column position
            System.out.println(rs.getInt(1));  //way 1
            //get the EUROPE -REGION name
            System.out.println(rs.getString(2));

            // same information we can get with column label not column index
            System.out.println(rs.getInt("REGION_ID"));  //way 2
            System.out.println(rs.getString("REGION_NAME"));


            //Task: GET ME SECOND ROW RESULT IN FOLLOWING FORMAT: 2 - Americas

            System.out.println("---------SECOND  ROW---------");
            rs.next(); //we need to move pointer to second row
            System.out.println(rs.getInt(1) + " - " + rs.getString(2));

            System.out.println("---------THIRD ROW---------");
            rs.next(); //we need to move pointer to second row
            System.out.println(rs.getInt("REGION_ID") + " - " + rs.getString("REGION_NAME"));

            System.out.println("---------4TH ROW---------");
            rs.next(); //we need to move pointer to second row
            System.out.println(rs.getInt("REGION_ID") + " - " + rs.getString("REGION_NAME"));

*/
        //what if we have 100 rows , we want to print first and second column
        System.out.println("---------Loop---------");


        while(rs.next()){
            System.out.println(rs.getInt(1)+" - "+ rs.getString(2)+" - "+ rs.getString(3));
        }



        //close connection
        rs.close();
        statement.close();
        conn.close();
    }

}
