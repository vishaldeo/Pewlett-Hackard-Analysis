# Pewlett-Hackard-Analysis

## Overview

The purpose of this project to provide the analysis for the Pewlett-Hackard company  to prepare for the  `silver tsunami`. The HR team need a analysis on the employees who   retiring at a rapid rate in the next few years and the company had to plan the budget for the new/retiring employees . 


### Resources & Environment

| Resource  
| -----------  
| departments.csv
| dept_emp.csv
| dept_manager.csv
| employees.csv
| salaries.csv
| titles.csv




| Software / Environment   | 
| ---------------------- | 
| QuickDBD    
| PostreSQL 
| pgAdmin


### ERD ( Entity Relationship Diagram)

Entity Relationship Diagram is type of flowchart that discribe how the entities ( e.g Employee , Department etc ) are related to each other. ER Diagrams are used to design the relational database.


<img width="786" alt="image" src="https://user-images.githubusercontent.com/22928255/193196748-31bfac22-b0a3-4b5c-bee7-ce204d120298.png">

## Results

### List of retiring employees information

<img width="786" alt="image" src="https://user-images.githubusercontent.com/22928255/193197420-538cc25e-5817-4389-927d-19fd56ff0511.png">

The table above provide the information of the employees who is going to be retire in the next few years with the creteria of `birth_date BETWEEN 1952-01-01 AND 1955-12-31` . This provide the information by department what title they have and employee information. 


### Retiring employees grouped by title

<img width="786" alt="image" src="https://user-images.githubusercontent.com/22928255/193198518-370f5b66-96b9-4a03-97d6-d4fa9b74cf48.png">

The above analysis provide the insigth of the employee titles that are going to be impacted (retiring ) soon. Based on the date we can confirm that 7 different titles will be retiring. Senior Engg and Senior Staff will be the most impacted titles. 


### Employee Mentorship info


<img width="786" alt="image" src="https://user-images.githubusercontent.com/22928255/193199424-c42fc6e7-3d38-45c9-812f-9c631535eaf6.png">

The mentorship criteria for the employee whose  `birth_date BETWEEN 1965-01-01 AND 1965-12-31` . Based on the data we have only `1,549` mentorship available employees. 


## Summary

<img width="786" alt="image" src="https://user-images.githubusercontent.com/22928255/193201150-00aad9a9-50a0-4849-a115-a02fb670e61d.png">


Based on the analysis provide to the Pewlett-Hackard company , we have the data for each year employee retiring who was born `birth_date BETWEEN 1952-01-01 AND 1955-12-31` by each year. Based on the above data company can budget the hiring process for the new emplyee for each title. 


<img width="786" alt="image" src="https://user-images.githubusercontent.com/22928255/193201776-48c873b8-fb5b-4f8d-9406-778b05f652d9.png">


The second summary we have the data for the mentorship program by each title. Based on the data we can groups for the newly hired emplyees who can be trained by their mentors. 







