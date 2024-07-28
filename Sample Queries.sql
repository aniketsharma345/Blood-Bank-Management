/*Create a View of recipients and donors’ names having
the same blood group registered on the same date and
the name of recording staff name */

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

/*Show the blood specimen verified by disease finder
Gwen which are pure (status=1)*/

Select specimen_number,
b_group
from BloodSpecimen,
DiseaseFinder
WHERE BloodSpecimen.dfind_ID = DiseaseFinder.dfind_ID
AND dfind_name = 'Gwen'
AND status = 1;

/*Show the pure blood specimen handled by BB_Manager
who also handles a recipient needing the same blood
group along with the details of the BB_Manager and
Recipient.*/

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

/*Show the donors having the same blood groups required
by the recipient staying in the same city along with
recipient details*/

Select bd_ID,
bd_name,
reci_ID,
reci_name
FROM Blood_Donor,
Recipient
WHERE bd_Bgroup = reci_Brgp
AND Blood_Donor.City_ID = Recipient.City_ID;

/*Display the information of Hospital_Info_1 handled by
BB_Manager whose ID is 103 */

Select hosp_ID,
hosp_name,
City_ID,
HOspital_Info_1.M_id
from Hospital_Info_1,
BB_Manager
where BB_Manager.M_id = Hospital_Info_1.M_id
and BB_Manager.M_id = 103;

