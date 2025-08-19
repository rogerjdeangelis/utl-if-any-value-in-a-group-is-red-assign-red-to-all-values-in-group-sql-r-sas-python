%let pgm=utl-if-any-value-in-a-group-is-red-assign-red-to-all-values-in-group-sql-r-sas-python;

%stop_submission;

If any value in a group is red assign red to all values in group sql r sas python

  THREE SOLUTIONS (same code everywhere (sas r python spss matlab powershell perl odbc)

     1 sas sql
       Bill Sut
       https://communities.sas.com/t5/user/viewprofilepage/user-id/302431
     2 r sql
     3 python sql
     4 links to matlab and spss clones sql (should be able to run the sql query)
       for excel see  https://tinyurl.com/4e6yaap8

github
https://tinyurl.com/35h9z6d4
https://github.com/rogerjdeangelis/utl-if-any-value-in-a-group-is-red-assign-red-to-all-values-in-group-sql-r-sas-python

communities.sas
https://tinyurl.com/yc3xspvy
htthttps://communities.sas.com/t5/SAS-Programming/Updating-Groups-Within-Dataset/m-p/761907#M241170


/**************************************************************************************************************************/
/* INPUT                             | PROCESS                                  | OUTPUT                                  */
/* =====                             | =======                                  | ======                                  */
/*  ID    COLOR                      | 1 SAS SQL                                | ID COLOR   RED                          */
/*                                   | =========                                |                                         */
/*  1     Blue                       |                                          | 1  Red     Red  group has               */
/*  1     Green                      | proc sql;                                | 1  Blue    Red  red                     */
/*  1     Red                        |  create                                  | 1  Green   Red                          */
/*  2     Blue                       |     table want as                        |                                         */
/*  2     Yellow                     |  select                                  | 2  Yellow  Yellow                       */
/*  3     Green                      |     l.id                                 | 2  Blue    Blue                         */
/*  3     Red                        |    ,l.color as color                     |                                         */
/*  3     Yellow                     |    ,coalescec(r.color,l.color) as red    | 3  Red     Red  group has               */
/*                                   |  from                                    | 3  Green   Red  red                     */
/*                                   |     sd1.have as l left join              | 3  Yellow  Red                          */
/* options                           |      (select                             |                                         */
/*  validvarname=upcase;             |         distinct id, color               |                                         */
/* libname sd1 "d:/sd1";             |      from                                |                                         */
/* data sd1.have;                    |         sd1.have                         |                                         */
/*  input ID $                       |       where                              |                                         */
/*  Color $;                         |         color='Red') as r                |                                         */
/* cards4;                           |  on                                      |                                         */
/*  1 Blue                           |    l.id=r.id                             |                                         */
/*  1 Green                          |                                          |                                         */
/*  1 Red                            | ;quit;                                   |                                         */
/*  2 Blue                           |                                          |                                         */
/*  2 Yellow                         |                                          |                                         */
/*  3 Green                          | 2 R SQL                                  | R                                       */
/*  3 Red                            | =======                                  |   ID  color    red                      */
/*  3 Yellow                         |                                          | 1  1   Blue    Red                      */
/* ;;;;                              | %utl_rbeginx;                            | 2  1  Green    Red                      */
/* run;quit;                         | parmcards4;                              | 3  1    Red    Red                      */
/*                                   | library(haven)                           | 4  2   Blue   Blue                      */
/*                                   | library(sqldf)                           | 5  2 Yellow Yellow                      */
/*                                   | source("c:/oto/fn_tosas9x.R")            | 6  3  Green    Red                      */
/*                                   | options(sqldf.dll                        | 7  3    Red    Red                      */
/*                                   |  = "d:/dll/sqlean.dll")                  | 8  3 Yellow    Red                      */
/*                                   | have<-read_sas(                          |                                         */
/*                                   |  "d:/sd1/have.sas7bdat")                 |                                         */
/*                                   | print(have)                              |                                         */
/*                                   | want<-sqldf('                            | SAS                                     */
/*                                   |  select                                  | ID    COLOR     RED                     */
/*                                   |     l.id                                 |                                         */
/*                                   |    ,l.color as color                     | 1     Blue      Red                     */
/*                                   |    ,coalesce(r.color,l.color) as red     | 1     Green     Red                     */
/*                                   |  from                                    | 1     Red       Red                     */
/*                                   |     have as l left join                  | 2     Blue      Blue                    */
/*                                   |      (select                             | 2     Yellow    Yellow                  */
/*                                   |         distinct id, color               | 3     Green     Red                     */
/*                                   |      from                                | 3     Red       Red                     */
/*                                   |         have                             | 3     Yellow    Red                     */
/*                                   |       where                              |                                         */
/*                                   |         color="Red") as r                |                                         */
/*                                   |  on                                      |                                         */
/*                                   |    l.id=r.id                             |                                         */
/*                                   | ')                                       |                                         */
/*                                   | want                                     |                                         */
/*                                   | fn_tosas9x(                              |                                         */
/*                                   |       inp    = want                      |                                         */
/*                                   |      ,outlib ="d:/sd1/"                  |                                         */
/*                                   |      ,outdsn ="want"                     |                                         */
/*                                   |      )                                   |                                         */
/*                                   | ;;;;                                     |                                         */
/*                                   | %utl_rendx;                              |                                         */
/*                                   |                                          |                                         */
/*                                   | proc print data=sd1.want;                |                                         */
/*                                   | run;quit;                                |                                         */
/*                                   |                                          |                                         */
/*                                   |                                          |                                         */
/*                                   | 3 PYTHON SQL                             | PYTHON                                  */
/*                                   | ============                             |   ID   color     red                    */
/*                                   |                                          | 0  1    Blue     Red                    */
/*                                   | proc datasets lib=sd1                    | 1  1   Green     Red                    */
/*                                   |  nolist nodetails;                       | 2  1     Red     Red                    */
/*                                   |  delete pywant;                          | 3  2    Blue    Blue                    */
/*                                   | run;quit;                                | 4  2  Yellow  Yellow                    */
/*                                   |                                          | 5  3   Green     Red                    */
/*                                   | %utl_pybeginx;                           | 6  3     Red     Red                    */
/*                                   | parmcards4;                              | 7  3  Yellow     Red                    */
/*                                   | exec(open( \                             |                                         */
/*                                   |  'c:/oto/fn_pythonx.py').read());        |                                         */
/*                                   | have,meta = ps.read_sas7bdat( \          | SAS                                     */
/*                                   |   'd:/sd1/have.sas7bdat');               | ID    COLOR     RED                     */
/*                                   | want=pdsql('''                           |                                         */
/*                                   |  select                                  | 1     Blue      Red                     */
/*                                   |     l.id                                 | 1     Green     Red                     */
/*                                   |    ,l.color as color                     | 1     Red       Red                     */
/*                                   |    ,coalesce(r.color,l.color) as red     | 2     Blue      Blue                    */
/*                                   |  from                                    | 2     Yellow    Yellow                  */
/*                                   |     have as l left join                  | 3     Green     Red                     */
/*                                   |      (select                             | 3     Red       Red                     */
/*                                   |         distinct id, color               | 3     Yellow    Red                     */
/*                                   |      from                                |                                         */
/*                                   |         have                             |                                         */
/*                                   |       where                              |                                         */
/*                                   |         color="Red") as r                |                                         */
/*                                   |  on                                      |                                         */
/*                                   |    l.id=r.id                             |                                         */
/*                                   |  ''');                                   |                                         */
/*                                   | print(want);                             |                                         */
/*                                   | fn_tosas9x(want                          |                                         */
/*                                   |   ,outlib='d:/sd1/'                      |                                         */
/*                                   |   ,outdsn='pywant'                       |                                         */
/*                                   |   ,timeest=3);                           |                                         */
/*                                   | ;;;;                                     |                                         */
/*                                   | %utl_pyendx;                             |                                         */
/*                                   |                                          |                                         */
/*                                   | proc print data=sd1.pywant;              |                                         */
/*                                   | run;quit;                                |                                         */
/**************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options
 validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.have;
 input ID $
 Color $;
cards4;
 1 Blue
 1 Green
 1 Red
 2 Blue
 2 Yellow
 3 Green
 3 Red
 3 Yellow
;;;;
run;quit;

/**************************************************************************************************************************/
/*   ID    COLOR                                                                                                          */
/*   1     Blue                                                                                                           */
/*   1     Green                                                                                                          */
/*   1     Red                                                                                                            */
/*   2     Blue                                                                                                           */
/*   2     Yellow                                                                                                         */
/*   3     Green                                                                                                          */
/*   3     Red                                                                                                            */
/*   3     Yellow                                                                                                         */
/**************************************************************************************************************************/

/*                             _
/ |  ___  __ _ ___   ___  __ _| |
| | / __|/ _` / __| / __|/ _` | |
| | \__ \ (_| \__ \ \__ \ (_| | |
|_| |___/\__,_|___/ |___/\__, |_|
                            |_|
*/

proc sql;
 create
    table want as
 select
    l.id
   ,l.color as color
   ,coalescec(r.color,l.color) as red
 from
    sd1.have as l left join
     (select
        distinct id, color
     from
        sd1.have
      where
        color='Red') as r
 on
   l.id=r.id

;quit;

/**************************************************************************************************************************/
/* ID    COLOR     RED                                                                                                    */
/*                                                                                                                        */
/* 1     Red       Red                                                                                                    */
/* 1     Blue      Red                                                                                                    */
/* 1     Green     Red                                                                                                    */
/* 2     Yellow    Yellow                                                                                                 */
/* 2     Blue      Blue                                                                                                   */
/* 3     Red       Red                                                                                                    */
/* 3     Green     Red                                                                                                    */
/* 3     Yellow    Red                                                                                                    */
/**************************************************************************************************************************/

/*___                   _
|___ \   _ __ ___  __ _| |
  __) | | `__/ __|/ _` | |
 / __/  | |  \__ \ (_| | |
|_____| |_|  |___/\__, |_|
                     |_|
*/

%utl_rbeginx;
parmcards4;
library(haven)
library(sqldf)
source("c:/oto/fn_tosas9x.R")
options(sqldf.dll
 = "d:/dll/sqlean.dll")
have<-read_sas(
 "d:/sd1/have.sas7bdat")
print(have)
want<-sqldf('
 select
    l.id
   ,l.color as color
   ,coalesce(r.color,l.color) as red
 from
    have as l left join
     (select
        distinct id, color
     from
        have
      where
        color="Red") as r
 on
   l.id=r.id
')
want
fn_tosas9x(
      inp    = want
     ,outlib ="d:/sd1/"
     ,outdsn ="want"
     )
;;;;
%utl_rendx;

proc print data=sd1.want;
run;quit;

/**************************************************************************************************************************/
/* R                                                                                                                      */
/*   ID  color    red                                                                                                     */
/* 1  1   Blue    Red                                                                                                     */
/* 2  1  Green    Red                                                                                                     */
/* 3  1    Red    Red                                                                                                     */
/* 4  2   Blue   Blue                                                                                                     */
/* 5  2 Yellow Yellow                                                                                                     */
/* 6  3  Green    Red                                                                                                     */
/* 7  3    Red    Red                                                                                                     */
/* 8  3 Yellow    Red                                                                                                     */
/**************************************************************************************************************************/

/*____               _   _                             _
|___ /   _ __  _   _| |_| |__   ___  _ __    ___  __ _| |
  |_ \  | `_ \| | | | __| `_ \ / _ \| `_ \  / __|/ _` | |
 ___) | | |_) | |_| | |_| | | | (_) | | | | \__ \ (_| | |
|____/  | .__/ \__, |\__|_| |_|\___/|_| |_| |___/\__, |_|
        |_|    |___/                                |_|
*/

proc datasets lib=sd1
 nolist nodetails;
 delete pywant;
run;quit;

%utl_pybeginx;
parmcards4;
exec(open( \
 'c:/oto/fn_pythonx.py').read());
have,meta = ps.read_sas7bdat( \
  'd:/sd1/have.sas7bdat');
want=pdsql('''
 select
    l.id
   ,l.color as color
   ,coalesce(r.color,l.color) as red
 from
    have as l left join
     (select
        distinct id, color
     from
        have
      where
        color="Red") as r
 on
   l.id=r.id
 ''');
print(want);
fn_tosas(want
,outlib='d:/sd1/'
,outdsn='pywant'
,timeest=3);
;;;;
%utl_pyendx;

proc print data=sd1.pywant;
run;quit;


%utl_pybeginx;
parmcards4;
exec(open( \
 'c:/oto/fn_pythonx.py').read());
have,meta = ps.read_sas7bdat( \
  'd:/sd1/have.sas7bdat');
want=pdsql('''
 select
    l.id
   ,l.color as color
   ,coalesce(r.color,l.color) as red
 from
    have as l left join
     (select
        distinct id, color
     from
        have
      where
        color="Red") as r
 on
   l.id=r.id
 ''');
print(want);
fn_tosas9x(want
  ,outlib='d:/sd1/'
  ,outdsn='pywant'
  ,timeest=3);
;;;;
%utl_pyendx;

proc print data=sd1.pywant;
run;quit;

/**************************************************************************************************************************/
/*  Python SAS                                                                                                            */
/*   ID   color     red       ID    COLOR     RED                                                                         */
/* 0  1    Blue     Red       1     Blue      Red                                                                         */
/* 1  1   Green     Red       1     Green     Red                                                                         */
/* 2  1     Red     Red       1     Red       Red                                                                         */
/* 3  2    Blue    Blue       2     Blue      Blue                                                                        */
/* 4  2  Yellow  Yellow       2     Yellow    Yellow                                                                      */
/* 5  3   Green     Red       3     Green     Red                                                                         */
/* 6  3     Red     Red       3     Red       Red                                                                         */
/* 7  3  Yellow     Red       3     Yellow    Red                                                                         */
/**************************************************************************************************************************/


/*  _               _                     _                                      _   _       _
| || |    ___  __ _| |   _____  _____ ___| |  ___ _ __  ___ ___  _ __ ___   __ _| |_| | __ _| |__
| || |_  / __|/ _` | |  / _ \ \/ / __/ _ \ | / __| `_ \/ __/ __|| `_ ` _ \ / _` | __| |/ _` | `_ \
|__   _| \__ \ (_| | | |  __/>  < (_|  __/ | \__ \ |_) \__ \__ \| | | | | | (_| | |_| | (_| | |_) |
   |_|   |___/\__, |_|  \___/_/\_\___\___|_| |___/ .__/|___/___/|_| |_| |_|\__,_|\__|_|\__,_|_.__/
                 |_|                             |_|
*/

matlab
https://tinyurl.com/bded7jc6
https://github.com/rogerjdeangelis/utl-randomly-pick-one-player-from-the-heat-and-suns-for-captains-sql-sas-r-python-matlab

spss
https://tinyurl.com/yrzh99mt
https://github.com/rogerjdeangelis/utl-connecting-spss-pspp-to-postgresql-sample-problem-compute-mean-weight-by-sex
https://github.com/rogerjdeangelis/utl-dropping-down-to-spss-using-the-pspp-free-clone-and-running-a-spss-linear-regression

excel
https://tinyurl.com/4e6yaap8
https://github.com/rogerjdeangelis/utl-identify-changes-in-all-variable-values-between-phase1-and-phase2-trials

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
