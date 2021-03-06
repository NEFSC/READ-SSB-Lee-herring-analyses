pause off

use $RFA_dataset, clear
/* first, lets get total fishery value by year */

 collapse (sum) value168 value212, by(year)

 list




use $RFA_dataset, clear


/* For FW9, we will only be affecting HRG ABCDE vessels. 
we want to flag all the firms that had at least 1 of these in the most recent year*/

/* STEP 1: Keep affiliate_id's that have at least one of the categorical variables in the keeplist ==1 in the most recent year*/


/* ALL permitted */
local keeplist HRG_A HRG_B HRG_C HRG_D HRG_E 


drop person*

/*Add up the number of herring permits help by a vp_num */
egen keep_flag=rowtotal(`keeplist')

/* zero out everything that is not the last year */
qui summ year
local maxy=`r(max)'
replace keep_flag=0 if year~=`maxy'

bysort affiliate_id : egen kf2=total(keep_flag)

bysort affiliate_id : egen kf3=total(HRG_D)

pause
keep if kf2==0 & kf3>=1
drop kf2 kf3

qui compress



/* how many firms */
/* generate an indicator for each firm-year */
egen ty=tag(affiliate_id year)
tab year if ty==1

/* how many small firms and large */
tab year small_business if ty==1





/* setup revenue for small and large firms */
gen squid=value801+value802


keep if year==`maxy'
gen permits=1
collapse (sum) value168 value212 value221 squid value_permit ty permits, by(small affiliate_id)

gsort - value168
browse
