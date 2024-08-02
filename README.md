## INTRODUCTION

Blood banks collect, store and provide collected blood to the patients who are in need of blood. The people who donate blood are called donors. The banks then group the blood which they receive according to the blood groups. They also make sure that the blood is not contaminated. The main mission of the blood bank is to provide the blood to the hospitals and health care systems which saves the patient’s life. No hospital can maintain the health care system without pure and adequate blood.

The major concern each blood bank has is to monitor the quality of the blood and monitor the people who donates the blood, that is ‘donors’. But this a tough job. The existing system will not satisfy the need of maintaining quality blood and keep track of donors. To overcome all these limitations, we introduced a new system called ‘Blood Donation Management System’.

The ‘Blood Bank Management System’ allows us to keep track of quality of blood and also keeps track of available blood when requested by the acceptor. The existing systems are Manual systems which are time consuming and not so effective. ‘Blood Bank Management system’ automates the distribution of blood. This database consists of thousands of records of each blood bank.

By using this system searching the available blood becomes easy and saves lot of time than the manual system. It will hoard, operate, recover and analyze information concerned with the administrative and inventory management within a blood bank. This system is developed in a manner that it is manageable, time effective, cost effective, flexible and much man power is not required.





## INFORMATION OF ENTITIES


In total we have eight entities and information of each entity is mentioned below: -

## 1.	Blood_Donor:
(Attributes – bd_ID, bd_name, bd_sex, bd_age, bd_Bgroup, bd_reg_date, bd_phNo)

The donor is the person who donates blood, on donation a donor id (bd_ID) is generated and used as primary key to identify the donor information. Other than that name, age, sex, blood group, phone number and registration dates will be stored in database under Blood_Donor entity.

## 2.	Recipient:
(Attributes – reci_ID, reci_name, reci_age, reci_Bgrp, reci_Bqnty , reci_sex, reci_reg_date, reci_phNo)

The Recipient is the person who receives blood from blood bank, when blood is given to a recipient a recipient ID (reci_ID) is generated and used as primary key for the recipient entity to identify blood recipients information. Along with it name ,age, sex, blood group (needed), blood quantity(needed) , phone number, and registration dates are also stored in the data base under recipient entity.

## 3.	BB_Manager:
(Attributes – m_ID, m_Name, m_phNo)

The blood bank manager is the person who takes care of the available blood samples in the blood bank, he is also responsible for handling blood requests from recipients and hospitals. Blood manager has a unique identification number (m_ID) used as primary key along with name and phone number of blood bank manager will be stored in data base under BB_Manager entity.
 

## 4.	Recording_Staff :
(Attributes – reco_ID, reco_Name, reco_phNo)

The recording staff is a person who registers the blood donor and recipients and the Recording_Staff entity has reco_ID which is primary key along with recorder’s name and recorder’s phone number will also be stored in the data base under Recording_Staff entity.

## 5.	BloodSpecimen :
(Attributes – specimen_number, b_group , status)

In data base, under Blood Specimen entity we will store the information of blood samples which are available in the blood bank. In this entity specimen_number and b_group together will be primary key along with status attribute which will show if the blood is contaminated on not.

## 6.	DiseaseFinder :
(Attributes - dfind_ID, dfind_name, dfind_PhNo)

In data base , under DiseaseFinder entity we will store the information of the doctor who checks the blood for any kind of contaminations. To store that information, we have unique identification number (dfind_ID) as primary key. Along with name and phone number of the doctor will also be stored under same entity.

## 7.	Hospital_Info :
(Attributes – hosp_ID, hosp_name, hosp_needed_Bgrp, hosp_needed_Bqnty)

In the data base, under Hospital_Info entity we will store the information of hospitals. In this hosp_ID and hosp_needed_Bgrp together makes the primary key. We will store hospital name and the blood quantity required at the hospital.
 



## 8.	City:
(Attributes- city_ID, city_name)

This entity will store the information of cities where donors, recipients and hospitals are present. A unique identification number (City_ID) will be used as primary key to identify the information about the city. Along with ID city names will also be stored under this entity.


## RELATIONSHIP BETWEEN ENTITIES



## 1.	City and Hospital_Info:
Relationship = “in”
Type of relation = 1 to many
Explanation = A city can have many hospitals in it. One hospital will belong in one city.

## 2.	City and Blood_Donor:
Relationship = “lives in”
Type of relation = 1 to many
Explanation = In a city, many donors can live. One donor will belong to one city.

## 3.	City and Recipient:
Relationship = “lives in”
Type of relation = 1 to many
Explanation = In a city, many recipients can live. One recipient will belong to one city.

## 4.	Recording_Staff and Donor:
Relationship = “registers”
Type of relation = 1 to many
Explanation = One recording staff can register many donors. One donor will register with one recording officer.
 

## 5.	Recording_Staff and Recipient:
Relationship = “records”
Type of relation = 1 to many
Explanation = One recording staff can record many recipients. One recipient will be recorded by one recording officer.

## 6.	Hospital_Info and BB_Manager:
Relationship = “gives order to”
Type of relation = 1 to many
Explanation = One Blood bank manager can handle and process requests from many hospitals. One hospital will place request to on blood bank manager.

## 7.	BB_Manager and Blood Specimen:
Relationship = “deals with specimen”
Type of relation = 1 to many
Explanation = One Blood bank manager can manage many blood specimens and one specimen will be managed by one manager.

## 8.	Recipient and BB_Manager:
Relationship = “requests to”
Type of relation = 1 to many
Explanation = One recipient can request blood to one manager and one manager can handle requests from many recipients.

## 9.	Disease_finder and Blood Specimen:
Relationship = “checks”,
Type of relation = 1 to many
Explanation = A disease finder can check many blood samples. One blood sample is checked by one disease finder.


## SAMPLE SQL QUERIES



1.	Create a View of recipients and donors’ names having the same blood group registered on the same date and the name of recording staff name.

``` SQL
   CREATE VIEW Blood_Recipient_SameBGrp AS
select bd.bd_name,
r.reci_name,
rs.reco_Name
from Recording_Staff rs
inner join Blood_Donor bd on rs.reco_ID = bd.reco_ID
inner join Recipient r on rs.reco_ID = r.reco_ID
where bd.bd_Bgroup = r.reci_Brgp
and bd.bd_reg_date = r.reci_reg_date;
select *
from Blood_Recipient_SameBGrp;
   ```
2.   Show the blood specimen verified by disease finder Gwen which are pure (status=1)
``` SQL
 Select specimen_number,
b_group
from BloodSpecimen,
DiseaseFinder
WHERE BloodSpecimen.dfind_ID = DiseaseFinder.dfind_ID
AND dfind_name = 'Gwen'
AND status = 1;
```

3.  Show the pure blood specimen handled by BB_Manager who also handles a recipient needing the same blood group along with the details of
    the BB_Manager and Recipient.
```SQL
select BB_Manager.M_id,
mName,
Recipient.reci_name,
Recipient.reci_Brgp,
BloodSpecimen.b_group
from BB_Manager,
Recipient,
BloodSpecimen
where Recipient.M_id = BloodSpecimen.M_id
and Recipient.reci_Brgp = BloodSpecimen.b_group
and Recipient.M_id = BB_Manager.M_id
and status = 1;
```

4.  Show the donors having the same blood groups required by the recipient staying in the same city along with recipient details.
```SQL
Select bd_ID,
bd_name,
reci_ID,
reci_name
FROM Blood_Donor,
Recipient
WHERE bd_Bgroup = reci_Brgp
AND Blood_Donor.City_ID = Recipient.City_ID;
```

5.  Display the information of Hospital_Info_1 handled by BB_Manager whose ID is 103 .
```SQL
Select hosp_ID,
hosp_name,
City_ID,
HOspital_Info_1.M_id
from Hospital_Info_1,
BB_Manager
where BB_Manager.M_id = Hospital_Info_1.M_id
and BB_Manager.M_id = 103;
```
