* Note: the remote environment provides only basic packages for Stata

* Data in
cd "W:\markus_laaninen\" 
use data, clear 

* Table 1
tab hours5 puhe if miss ==0, row
tab cc puhe if miss ==0, row
tab gender puhe if miss ==0, row
tab edu2 puhe if miss ==0, row
tab health puhe if miss ==0, row
tab deve puhe if miss ==0, row
tab upbr puhe if miss ==0, row
tab vkinfo2 puhe if miss ==0, row 

* Table 2
logit puhe i.hours5 if miss==0, base or 
logit puhe i.hours5 i.edu2 i.gender ib2.cc i.health i.deve i.upbr i.vkinfo2 if miss ==0, base or 
logit puhe i.hours5##i.edu2 if miss==0, base or 
logit puhe i.hours5##i.edu2 i.gender ib2.cc i.health i.deve i.upbr i.vkinfo2 if miss ==0, base or 
ereturn list

* Figure 1
margins, at (hours5 = (1 (1) 5) edu2 = (1 2))

* Table 3 
margins r.hours5, over(edu2)

* Table A1 
tab hours5 edu2 if miss ==0 & puhe !=., col 

* Table A2
logit puhe i.hours5##c.edu i.gender ib2.cc i.health i.deve i.upbr i.vkinfo2 if miss ==0, base or

* Table A3
margins r.hours5, over(edu)

