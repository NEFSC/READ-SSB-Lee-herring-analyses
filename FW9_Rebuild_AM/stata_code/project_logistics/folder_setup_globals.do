/* Set up global macros to point to folders */

version 15.1

#delimit ;


/*One of these
global user minyang; 
global user minyangWin; 
*/


if strmatch("$user","minyang"){;
global my_projdir "/home/mlee/Documents/READ-SSB-Lee-herring-analyses/FW9_Rebuild_AM";
quietly do "/home/mlee/Documents/Workspace/technical folder/do file scraps/odbc_connection_macros.do";
global oracle_cxn "conn("$mysole_conn")";
};

/*minyangWin is setup to connect to oracle yet */
if strmatch("$user","minyangWin"){;
global my_projdir "C:/Users/Min-Yang.Lee/Documents/READ-SSB-Lee-herring-analyses/FW9_Rebuild_AM";
quietly do "C:/Users/Min-Yang.Lee/Documents/common/odbc_setup_macros.do";
global oracle_cxn " $mysole_conn";

};


global my_codedir "${my_projdir}/stata_code";
global extract_process "${my_codedir}/data_extraction_processing";
global extraction_code "${extract_process}/extraction";
global processing_code "${extract_process}/processing";
global analysis_code "${my_codedir}/analysis";
global R_code "${my_projdir}/R_code";
global my_adopath "${my_codedir}/aceprice_ado";


/* setup data folder */
global my_datadir "${my_projdir}/data_folder";
global data_raw "${my_datadir}/raw";
global memberids ${data_raw}/memberids;

global data_internal "${my_datadir}/internal";
global data_external"${my_datadir}/external";

global data_main"${my_datadir}/main";

global data_intermediate "${my_datadir}/intermediate";

global RFA_dataset  "C:/Users/Min-Yang.Lee/Documents/RFAdataset/data_folder/affiliates_2021_06_07.dta";

/* setup results folders */
global intermediate_results "${my_projdir}/intermediate_results";
global my_results "${my_projdir}/results";


/* setup images folders */

global my_images "${my_projdir}/images";
global exploratory "${my_images}/exploratory";



/* setup tables */

global my_tables "${my_projdir}/tables";



/* add the programs in mobility_ado to the adopath*/
adopath + $my_adopath ;



global jderobafolder "work2/jderoba/Herring/";

/*set the date field */
local date: display %td_CCYY_NN_DD date(c(current_date), "DMY");
global today_date_string = subinstr(trim("`date'"), " " , "_", .);
global vintage_string $today_date_string;

