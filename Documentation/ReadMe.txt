
About the Project:

Fast and Delight Cafe is open-source software for online order placement, food delivery and restaurant management. It is based on the Spang Framework that is an open-source application software that provide infrastructure support for developing java applications and features modules like an online food ordering system, a table reservation management system and user management.

Built with:
* My SQL
* Apache Tom Web Server
* NetBeans

* Set Up Instructions For Running Application

Below are the instructions on setting up your project locally. To get the project running follow these simple steps.

* JDK 
1. Go to https://www.oracle.com/java/technologies/downloads/
2. Search for your windows and click on the link to download.
3. It will be installed in your system.

* Apache NetBeans

1. Go to https://netbeans.apache.org/download/index.html
2. Click on download button with the latest version.
3. Select your windows and click on the link to get downloading start.


* Apache Tomcat Server

1. Go to https://tomcat.apache.org/download-80.cgi
2. Scroll down and select the link on the windows.
3. The download will start.
 

* Configure the Server with Apache NetBeans

1. Go to Windows bar.
2. Click on Services
3. Right Click on the Server and click add server.
4. Select Apache Tom Cat
5. Click on download and Activate
6. You will see a window in which you have to enter the path of Apache Tom Cat Server in your PC
7. Enter the username and password
8. Apache Tom Cat successfully configured with NetBeans.

YouTube Link for installing JDK, NetBeans, Tom Cat Server: https://youtu.be/YJoCmTip9Iw

* Adding MySQl JDBC Connector 
1. Go to https://dev.mysql.com/downloads/connector/j/
2. Select Operating System as Platform Independant
3. Download the mysql-connector-java-8.0.29.zip file

*Running Project on NetBeans

1. Open netbeans
2. Go to file and click open project
3. Select the source code
4. It will output resolve errors option, click it and add the jar file in the mysql-connector-java-8.0.29/lib folder
5. Create database in mysql.
6. Go to Source Packages in netbeans project.
7. Click SQL package then UtilConnection Class.
8. Modify the url to your own password and username
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fastcafe?autoReconnect=true", "ENTER USER HERE", "ENTER PASS HERE");
9. Now you can run the project.

*Potential Errors and How to Solve them*
1. Library Not Added
	*Right click the project and go to properties -> libraries -> click add jar folder -> add mysql-connector-java-8.0.29.jar

2. Tomcat server not running
	*Go to services stop tomcat, and restart tomcat

3. Project Not deployed
	*Goto project properties -> run -> add relative url as HomePage.jsp and select Chrome Browser




