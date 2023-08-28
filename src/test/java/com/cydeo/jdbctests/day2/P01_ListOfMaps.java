package com.cydeo.jdbctests.day2;

import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class P01_ListOfMaps {


    @Test
    public void task1(){

        System.out.println("-------ROW MAP 1------");

        Map<String,Object> rowMap1 = new HashMap<>();

        rowMap1.put("First_Name","Steven"); //add key and values
        rowMap1.put("Last_Name","King");
        rowMap1.put("Salary",24000);
        System.out.println(rowMap1);

        System.out.println("-------ROW MAP 2------");

        Map<String,Object> rowMap2 = new HashMap<>();

        rowMap2.put("First_Name","Neena"); //add key and values
        rowMap2.put("Last_Name","Kochhar");
        rowMap2.put("Salary",17000);
        System.out.println(rowMap2);

        System.out.println("------List<Map>-------");

        List<Map<String,Object>> dataList = new ArrayList<>();

        //we will put each of the rowMap tot the list
        dataList.add(rowMap1);
        dataList.add(rowMap2);
        System.out.println("dataList = " + dataList);


        //I WANT TO GET STEVEN's LAST NAME ???
        System.out.println("dataList.get(0).get(\"Last_Name\") = " + dataList.get(0).get("Last_Name"));
    }

    @Test
    public void task2() throws SQLException {

        String dbURL = "jdbc:oracle:thin:@54.158.68.99:1521:"; //:xe :XE
        String dbUsername = "hr";
        String dbPassword = "hr";

        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select FIRST_NAME,LAST_NAME,SALARY from EMPLOYEES where rownum<6");


        ResultSetMetaData rsmd = rs.getMetaData();//create rsmd to get column name and count
        rs.next(); //we need to move to first row to fill rowMap1

        System.out.println("-------ROW MAP 1------");

        Map<String,Object> rowMap1 = new HashMap<>();

        rowMap1.put(rsmd.getColumnName(1),rs.getString(1)); //do it dynamically because we have query (select * ..)
        rowMap1.put(rsmd.getColumnName(2),rs.getString(2));
        rowMap1.put(rsmd.getColumnName(3),rs.getString(3));
        System.out.println(rowMap1);

        System.out.println("-------ROW MAP 2------");

        rs.next();//move pointer to second row. we have to use rs.next(); method

        Map<String,Object> rowMap2 = new HashMap<>();

        rowMap2.put(rsmd.getColumnName(1),rs.getString(1)); //do it dynamically because we have query (select * ..)
        rowMap2.put(rsmd.getColumnName(2),rs.getString(2));
        rowMap2.put(rsmd.getColumnName(3),rs.getString(3));
        System.out.println(rowMap2);

        System.out.println("-------ROW MAP 3------");

        rs.next();//move pointer to third row. we have to use rs.next(); method

        Map<String,Object> rowMap3 = new HashMap<>();

        rowMap3.put(rsmd.getColumnName(1),rs.getString(1)); //do it dynamically because we have query (select * ..)
        rowMap3.put(rsmd.getColumnName(2),rs.getString(2));
        rowMap3.put(rsmd.getColumnName(3),rs.getString(3));
        System.out.println(rowMap3);


        System.out.println("------List<Map>-------");

        List<Map<String,Object>> dataList = new ArrayList<>();

        //we will put each of the rowMap tot the list
        dataList.add(rowMap1);
        dataList.add(rowMap2);
        dataList.add(rowMap3);
        System.out.println("dataList = " + dataList);


        //get info from rows
        System.out.println("1.rowMap First Name = " + dataList.get(0).get("LAST_NAME"));
        System.out.println("3.rowMap  Salary =  "  + dataList.get(2).get("SALARY"));


        //close connection
        rs.close();
        statement.close();
        conn.close();

    }

    @Test
    public void task3() throws SQLException{


        String dbURL = "jdbc:oracle:thin:@54.158.68.99:1521:"; //:xe :XE
        String dbUsername = "hr";
        String dbPassword = "hr";

        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select FIRST_NAME,LAST_NAME,SALARY from EMPLOYEES where rownum < 6 ");
        ResultSetMetaData rsmd = rs.getMetaData();

        //Create your list of maps to kepp information
        List<Map<String,Object>> dataList = new ArrayList<>();

        //how many columns we have??
       int columnCount = rsmd.getColumnCount();


        //iterate through each row
        while(rs.next()){
            //create an empty map to hold one row of information
            Map<String, Object> rowMap = new HashMap<>();
            //iterate each column dynamically to fill the map
            for (int i = 1; i <= columnCount; i++) {
                //key = column name, value = column value

                rowMap.put(rsmd.getColumnName(i),rs.getString(i));
            }
            //add the one row information to the list
            dataList.add(rowMap);
        }

        for (Map<String, Object> row : dataList) {
            System.out.println(row);
        }






        //close connection
        rs.close();
        statement.close();
        conn.close();

    }
}
   /*


        Map<String,Object> rowMap1 = new HashMap<>();
        rowMap1.put("First_Name","Steven"); //add key and values
        rowMap1.put("Last_Name","King");
        rowMap1.put("Salary",24000);

       rowMap1.get("Salary");  // returns -->24000

        Map<String,Object> rowMap2 = new HashMap<>();
        Map<String,Object> rowMap3 = new HashMap<>();
        Map<String,Object> rowMap4 = new HashMap<>();


        List<Map<String,Object>> tableData = new ArrayList<>(); //list all maps
        tableData.add(rowMap1);  //tableData.get(0)
        tableData.add(rowMap2);  //tableData.get(1)
        tableData.add(rowMap3);  //tableData.get(2)
        tableData.add(rowMap4);  //tableData.get(3)

        // if I want to learn 4.row's last name -->tableDate.get(3) get all information and then go map, rowMap4.get(""Last_NAME)
        // list is working with the index, map is working with the key value
     */