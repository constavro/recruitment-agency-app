import pymysql.cursors
import operator
import sys
import pandas as pd
import datetime
from datetime import date

## Connection with php my admin
try:
        connection = pymysql.connect(host='127.0.0.1',
                                     user='root',
                                     password='dbproject',
                                     db='dbproject',
                                     charset='utf8mb4',
                                     cursorclass=pymysql.cursors.DictCursor,
                                     port=3306)

        print ("\nConnection established\n")
except:
        print("Connection failed")
        sys.exit("Error message")


def main():
        pd.set_option('display.max_rows', 500)
        pd.set_option('display.max_columns', 500)
        pd.set_option('display.width', 1000)
        pd.set_option("display.colheader_justify","right")
        while(True):
                user=selectUser()
                if user==1:
                        admin()
                elif user==2:
                        employer()
                elif user==3:
                        employee()
                elif user==4:
                        newcustomer()
                else:
                        break
        return


def selectUser():
        print('Select user ')
        while(True):
                print('1. Admin\n2. Employer\n3. Employee\n4. New user\n5. Exit')
                selection= input()
                if selection.isdigit():
                        selection=int(selection)
                        if selection==1:
                                return selection
                        elif selection==2:
                                return selection
                        elif selection==3:
                                return selection
                        elif selection==4:
                                return selection
                        elif selection==5:
                                return
                        else:
                                print("Invalid entry")
                else:
                        print("Invalid entry")
        return

## Checkers 

def checkpass1(): #Checks ID for admin
        with connection.cursor() as cursor:
                cursor.execute("SELECT `ID_admin` from `ADMIN`")
                data = cursor.fetchall()
                passadmin=[]
                for d in data:
                        passadmin.append(d['ID_admin'])
                while(True):
                        password=input()
                        if password.isdigit():
                                password=int(password)
                                if password in passadmin:
                                        return password
                                else:
                                        print('Try again')
                        else:
                                print('Try again')
                return


def check_ergaz(): #elegxei an to id iparxei se kapoion ergazomeno
        with connection.cursor() as cursor:
                cursor.execute("SELECT `ID_customer` from `EMPLOYEE`")
                data = cursor.fetchall()
                passergazomenou=[]
                for d in data:
                        passergazomenou.append(d['ID_customer'])
                while(True):
                        print('Insert Employee ID')
                        password=input()
                        if password.isdigit():
                                password=int(password)
                                if password in passergazomenou:
                                        return password
                                else:
                                        print('Invalid ID')
                        else:
                                print('Invalid ID')
                return


def check_ergod(): #elegxei an to id iparxei se kapoion ergodoti
        with connection.cursor() as cursor:
                cursor.execute("SELECT `ID_employer` from `EMPLOYER`")
                data = cursor.fetchall()
                passergodoti=[]
                for d in data:
                        passergodoti.append(d['ID_employer'])
                while(True):
                        print('Insert Employer ID')
                        password=input()
                        if password.isdigit():
                                password=int(password)
                                if password in passergodoti:
                                        return password
                                else:
                                        print('Invalid ID')
                        else:
                                print('Invalid ID')
                return


def check_thesis():  #elegxei an to id theseis ergasias iparxei sti vasi
        with connection.cursor() as cursor:
                cursor.execute("SELECT `ID_job` from `JOB`")
                data = cursor.fetchall()
                pass_thesis = []
                for d in data:
                        pass_thesis.append(d['ID_job'])
                while (True):
                        print('Insert job ID')
                        password = input()
                        if password.isdigit():
                                password = int(password)
                                if password in pass_thesis:
                                        return password
                                else:
                                        print('Invalid ID')
                        else:
                                print('Invalid ID')
        return


def checkapply():  #elegxei  an to id aitisis pou vazei o ipopsifios einai egkiro
        with connection.cursor() as cursor:
                cursor.execute("SELECT `ID_job` from `JOB` where `Availability`=1")
                data = cursor.fetchall()
                theseis=[]
                for d in data:
                    theseis.append(d['ID_job'])
                while(True):
                        print("Insert job ID in order to apply")
                        thesi=input()
                        if thesi.isdigit():
                                thesi=int(thesi)
                                if thesi in theseis:
                                        print('Application successful')
                                        return thesi
                                else:
                                        print('This job does not exist!')
                                        print('Insert another job ID')
                                        print (theseis)
                        else:
                                print('Invalid ID')
                return


def checkaitisi(password): #elegxei an oi aitiseis aforoun ton ergodoti
        with connection.cursor() as cursor:
                            query="select a.`ID_app` from `OFFER` as k join `JOB` as y on y.`ID_job`=k.`ID_job` JOIN `APPLY`as a on a.`ID_job`=y.`ID_job` where k.`ID_employer`='{}'".format(password)
                            cursor.execute(query)
                            data=cursor.fetchall()
                            aitiseis=[]
                            for d in data:
                                    aitiseis.append(d['ID_app'])
                            while(True):
                                    print('Select one of your open applications or type * if you want to exit')
                                    aitisi=input()
                                    if aitisi.isdigit():
                                            aitisi=int(aitisi)
                                            
                                            if aitisi in aitiseis:
                                                    return aitisi
                                            else:
                                                    print('Please insert a valid application ID')
                                    elif aitisi=='*':
                                            return aitisi
                                    else:
                                                print('Invalid ID')
        return  


def intchecker(): #checkarei an einai integer kai epistrefei tin timi
        while(True):
                integer= input()
                if integer.isdigit():
                        integer=int(integer)
                        return integer
                else:
                        print("Invalid entry")
        return 


def boolchecker(): #checkarei an einai boolean kai epistrefei tin timi
        while(True):
                boolean= input()
                if boolean.isdigit():
                        if int(boolean)==1:
                                boolean=bool(boolean)
                                return 1
                        elif int(boolean)==0:
                                boolean=bool(boolean)
                                return 0
                        else:
                                print("Invalid entry")
                else:
                        print("Invalid entry")
        return 


def checkpass2(): #elegxei to pass gia ergodoti
        with connection.cursor() as cursor:
                cursor.execute("SELECT `ID_employer` from `EMPLOYER`")
                data = cursor.fetchall()
                passergodoti=[]
                for d in data:
                        passergodoti.append(d['ID_employer'])
                while(True):
                        print('Insert password')
                        password=input()
                        if password.isdigit():
                                password=int(password)
                                if password in passergodoti:
                                        print('Successful log in')
                                        return password
                                else:
                                        print('Try again')
                        else:
                                print('Try again')
                return


def checkpass3(): #elegxei to pass gia ergazomeno
        with connection.cursor() as cursor:
                cursor.execute("SELECT `ID_customer` from `EMPLOYEE`")
                data = cursor.fetchall()
                passergazomenou=[]
                for d in data:
                        passergazomenou.append(d['ID_customer'])
                while(True):
                        print('Insert password')
                        password=input()
                        if password.isdigit():
                                password=int(password)
                                if password in passergazomenou:
                                        print('Successful log in')
                                        return password
                                else:
                                        print('Try again')
                        else:
                                print('Try again')
                return


def check_pelati():  # elegxei an to id pelati iparxei sti vasi
        with connection.cursor() as cursor:
                cursor.execute("SELECT `ID_customer` from `CUSTOMER`")
                data = cursor.fetchall()
                pass_pelati = []
                for d in data:
                        pass_pelati.append(d['ID_customer'])
        while (True):
                print('Insert customer ID')
                password = input()
                if password.isdigit():
                        password = int(password)
                        if password in pass_pelati:
                                return password
                        else:
                                print('Invalid ID')
                else:
                        print('Invalid ID')
        return


def datechecker():
        boolean=True
        while(boolean):
                date=str(input("Insert date YYYY-MM-DD\n"))
                try:
                        valid_date = datetime.datetime.strptime(date, '%Y-%m-%d').date()
                        boolean=False
                except ValueError:
                        boolean=True
        return date

        
##Leitourgies ipallilou

def admin(): #main ipallilou
        print ('Password:')
        password=checkpass1()
        print('Succesful entrance')
        print ("Select function")
        while(True):
                print ("1. My jobs\n2. My employees\n3. Search\n4. Available jobs\n5. New \n6. Update \n7. Delete\n8. Log out")
                selection=input()
                if selection.isdigit():
                        selection=int(selection)
                        if selection==1:
                                print("My jobs")
                                myjobs(password)
                        elif selection==2:
                                print("My employees")
                                myemployees(password)
                        elif selection==3:
                                print("Search")
                                anazitisi()
                        elif selection==4:
                                print("Jobs")
                                openjobs()
                        elif selection==5:
                                eisagogi(password)
                        elif selection==6:
                                print ("Update")
                                enimerwsi(password)
                        elif selection==7:
                                print ("Delete")
                                diagrafi()
                        elif selection==8:
                                print("Succesful log out")
                                break
                        else:
                                print("Invalid choice")
                else:
                        print("Invalid choice")
        return


def myjobs(password): # emfanizei tis theseis pou diaxeirizetai o ipallilos
        with connection.cursor() as cursor:
                query="select t.`ID_job`as `ID_job`,t.`Title`,t.`Salary`,t.`Working hours` as `Hours`,t.`City`,t.`Remote`,t.`Website published` as `Website`,t.`Availability`,t.`Preffered experience` as `Experience`,e.`Title` as `Expertise` from `MANAGE` as d join `JOB` as t on t.`ID_job`=d.`ID_job` join `EXPERTISE` as e on e.`ID_expertise`=t.`ID_expertise`where d.`ID_admin`='{}'".format(password)
                cursor.execute(query)
                data=cursor.fetchall()
                if len(data)==0:
                        print("No jobs found!")
                else:
                        colNames = data[0].keys()
                        data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                        print (data.to_string(index=False))
                return


def myemployees(password): #emfanizei tous ipallilous pou kathodigei o ipallilos
        with connection.cursor() as cursor:
                query="select p.* from `GUIDE`as k join `EMPLOYEE`as y on k.`ID_employee`=y.`ID_customer` join `CUSTOMER` as p on p.`ID_customer`=y.`ID_customer` where k.`ID_admin`='{}'".format(password)
                cursor.execute(query)
                data=cursor.fetchall()
                if len(data)==0:
                        print("No employees found!")
                else:
                        colNames = data[0].keys()
                        data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                        print (data.to_string(index=False))
        return


def anazitisi(): #anazitisi gia ipallilo me vasei id thesis ipallilou i pelati
    print('Search for')
    while (True):
        print('1. Customer\n2. Job\n3. Admin\n4. Back')
        choice = input()
        if choice.isdigit():
                choice = int(choice)
                if choice == 1:
                        print('Searh for customer')
                        idpel=check_pelati()
                        with connection.cursor() as cursor:
                                query = "select * from `customer` where `ID_customer`='{}'".format(idpel)
                                cursor.execute(query)
                                data = cursor.fetchall()
                        if len(data) == 0:
                                print("No results!")
                        else:
                                colNames = data[0].keys()
                                data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                                print (data.to_string(index=False))
                        return
                elif choice == 2:
                        print('Search for job')
                        idthes=check_thesis()
                        with connection.cursor() as cursor:
                                query = "SELECT `ID_job` as `ID`, `Title`, `Salary`, `Working hours`, `Work type`, `City`, `Remote`, `Specifications`, `Website published`as `Website`, `Availability`, `Preffered experience`, `ID_expertise` FROM `job` WHERE `ID_job`='{}'".format(idthes)
                                cursor.execute(query)
                                data = cursor.fetchall()
                        if len(data) == 0:
                                print("No results!")
                        else:
                                colNames = data[0].keys()
                                data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                                print (data.to_string(index=False))
                        return
                elif choice == 3:
                        print('Search for admin')
                        idipal=checkpass1()
                        with connection.cursor() as cursor:
                                query="select * from `admin` where `ID_admin`='{}'".format(idipal)
                                cursor.execute(query)
                                data = cursor.fetchall()
                        if len(data) == 0:
                                print("No results!")
                        else:
                                colNames = data[0].keys()
                                data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                                print (data.to_string(index=False))              
                        return
                elif choice == 4:
                        print("Back")
                        break
                else:
                        print("Invalid choice")
        else:
            print("Invalid choice")
    return




def openjobs(): #emfanizei oles tis anoixtes theseis pou iparxoun sti vasi
        with connection.cursor() as cursor:
                query="SELECT y.`ID_job`,y.Title,y.Salary,y.`work type`,y.City,y.Remote,k.`DateOffered`,k.due FROM `OFFER` as k JOIN `EMPLOYER` as e on e.`ID_employer`=k.`ID_employer` join `JOB` as y on y.`ID_job`=k.`ID_job` where  y.`Availability`=1"
                cursor.execute(query)
                data=cursor.fetchall()
                if len(data)==0:
                        print("No open jobs")
                else:
                        colNames = data[0].keys()
                        data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                        print (data.to_string(index=False))


def eisagogi(password): #insert data gia ton ipallilo
        print('New')
        while (True):
                print('1. Customer\n2. Job\n3. Interview\n4. Job manager\n5. Admin\n6. Guide\n7. Back')
                choice = input()
                if choice.isdigit():
                        choice = int(choice)
                        if choice == 1:
                                print('New customer')
                                newcustomer()
                        elif choice == 2:
                                print('New job')
                                id_erg =check_ergod()
                                newjob(id_erg)
                        elif choice == 3:
                                print('New interview')
                                eisagogisunent()
                        elif choice == 4:
                                print('New job manager')
                                eisagogidiaxeirisis(password)
                        elif choice == 5:
                                print('New admin')
                                eisagogiipallilou()
                        elif choice == 6:
                                print('New guide')
                                eisagogikathod(password)
                        elif choice == 7:
                                print("Back")
                                break
                        else:
                                print("Invalid choice")
                else:
                        print("Invalid choice")


def newcustomer(): #eisagwgi pelati gia ton ipallilo
        name=input('Name\n')
        surname=input('Surname\n')
        email=input('E-mail\n')
        address=input('Street\n')
        print('Number')
        number=intchecker()
        city=input('City\n')
        print('Phone')
        phone=intchecker()
        id=input('ID\n')
        with connection.cursor() as cursor:
                query="insert into `CUSTOMER`  (`Name`,`Surname`,`E-mail`,`Street`,`Number`,`City`,`Phone`,`ID`) values (%s,%s,%s,%s,%s,%s,%s,%s)"
                cursor.execute(query,(name,surname,email,address,number,city,phone,id))
                query2 = "SELECT `ID_customer` FROM `CUSTOMER` ORDER BY `ID_customer` DESC LIMIT 1"
                cursor.execute(query2)
                data = cursor.fetchall()
                data = data[0].get('ID_customer')
                print("New customer with ID: ", data)
                connection.commit()
                print('1. Employee\n2. Employer')
                choice1=input('')
                if choice1.isdigit():
                        choice1=int(choice1)
                        if choice1==1:
                                print('Years of experience')
                                experience=intchecker()
                                print('Available hours')
                                hours=intchecker()
                                
                                with connection.cursor() as cursor:
                                        query="insert into `EMPLOYEE` (`ID_customer`,`YearsofExperience`,`Available_hours`) values (%s,%s,%s)"
                                        cursor.execute(query,(data,experience,hours))
                                        query2="insert into `EXPERT`(`ID_employee`,`ID_expertise`) values (%s,15)"
                                        cursor.execute(query2,(data))
                                        query1="SELECT `ID_cv` FROM `EMPLOYEE` ORDER BY `ID_cv` DESC LIMIT 1"
                                        cursor.execute(query1)
                                        id_cv = cursor.fetchall()
                                        id_cv = id_cv[0].get('ID_cv')
                                        query0="insert into `CV` (`ID_cv`) values ('%s')"
                                        cursor.execute(query0,(id_cv))
                                        connection.commit()
                                return
                        elif choice1==2:
                                print('SSN')
                                ssn=intchecker()
                                compname=input('Company name\n')
                                comptype=input('Company type\n')
                                with connection.cursor() as cursor:
                                        query="insert into `EMPLOYER` (`ID_customer`,`SSN`,`Company name`,`Company type`) values (%s,%s,%s,%s)"
                                        cursor.execute(query,(data,ssn,compname,comptype))
                                        connection.commit()
                                        query2 = "SELECT `ID_employer` FROM `EMPLOYER` ORDER BY `ID_employer` DESC LIMIT 1"
                                        cursor.execute(query2)
                                        data = cursor.fetchall()
                                        data = data[0].get('ID_employer')
                                        print("New employer with ID : ", data)
                                        connection.commit()
                                return
                        else:
                                print("Invalid choice")
                else:
                        print("Invalid choice")
        return


def newjob(password): ##eisagwgi neas thesis
        print("Insert information for the new job")
        title=input("Title\n")
        print("Salary")
        salary=intchecker()
        print ("Working hours")
        hours=intchecker()
        wtype=input("Part Time/Full Time/Internship\n")
        city=input("City\n")
        print ("Remote: 1. YES   0. NO")
        remote=boolchecker()
        xaraktiristika=input("Insert job specifications\n")
        istoselida=input("Website published\n")
        print("Preffered experience")
        proipiresia=intchecker()
        duedate=datechecker()
        with connection.cursor() as cursor:
                query1="insert into `JOB` (`Title`,`Salary`,`Working hours`,`Work type`,`City`,`Remote`,`Specifications`,`Website published`,`Availability`,`Preffered experience`) values (%s,%s,%s,%s,%s,%s,%s,%s,1,%s);" 
                cursor.execute(query1,(title,salary,hours,wtype,city,remote,xaraktiristika,istoselida,proipiresia))
                lastinsertedid=connection.insert_id()
                print("New job with ID: ",lastinsertedid)
                query2="insert into `OFFER` (`ID_employer`,`ID_job`,`DateOffered`,`due`) values (%s,%s,%s,%s)"
                cursor.execute(query2,(password,lastinsertedid,date.today(),duedate))
                connection.commit()
        return


def eisagogisunent():  #orizei sinenteuksi metaksi ergodoti kai ipallilou
        id_erg = check_ergod()
        id_upop = check_ergaz()
        print('Interview date')
        date = datechecker()
        comments = input('Comments\n')
        with connection.cursor() as cursor:
                query="insert into `INTERVIEW`(`ID_employer`,`ID_employee`,`date`,`comments`) values (%s,%s,%s,%s)"
                cursor.execute(query,(id_erg,id_upop,date,comments))
                connection.commit()
        return


def eisagogidiaxeirisis(password): #orizei diaxeiristi thesis ergasias
        id_theseis =check_thesis()
        with connection.cursor() as cursor:
                query="insert into `MANAGE`(`ID_job`,`ID_admin`) values (%s,%s)"
                cursor.execute(query,(id_theseis,password))
                connection.commit()
        return


def eisagogiipallilou(): #eisagei neo ipallilo
        onoma = input('Name\n')
        epwnimo = input('Surname\n')
        print('Salary')
        salary=intchecker()
        print('Phone')
        phone = intchecker()
        print('DOB')
        birthdate = datechecker()
        print('SSN')
        afm = intchecker()
        with connection.cursor() as cursor:
                query="insert into `ADMIN`(`Name`,`Surname`,`Salary`,`Phone`,`DOB`,`SSN`) values (%s,%s,%s,%s,%s,%s)"
                cursor.execute(query,(onoma,epwnimo,salary,phone,birthdate,afm))
                connection.commit()
        return


def eisagogikathod(password): #orizei ws kathodigiti ton ipallilo se enan ipopsifio
        id_ypopsifiou = check_ergaz()
        with connection.cursor() as cursor:
                query="insert into `GUIDE`(`ID_admin`,`ID_employee`) values (%s,%s)"
                cursor.execute(query,(id_ypopsifiou,password))
                connection.commit()
        return


def enimerwsi(password): #enimerwsi ton stoixeion tis vasis
        print('Update')
        while (True):
                print('1. customer information\n2. job information\n3. admin information\n4. job availability\n5. Back')
                choice = input()
                if choice.isdigit():
                        choice = int(choice)
                        if choice == 1:
                                print('Update customer information ')
                                enimerwsiPelati()
                        elif choice == 2:
                                print('Update job information ')
                                enimerwsithesis()
                        elif choice == 3:
                                print('Update admin information ')
                                enimerwsiipallilou()
                        elif choice == 4:
                                print('Update job availability ')
                                enimerwsidiathesimotitas()
                        elif choice == 5:
                                print("Back")
                                break
                        else:
                                print("Invalid choice")
                else:
                        print("Invalid choice")
        return


def enimerwsiPelati(): #enimerwnei ta stoixeia tou pelati
        idpelati=check_pelati()
        with connection.cursor() as cursor:
                cursor.execute("SELECT * from `CUSTOMER` where `ID_customer`='{}'".format(idpelati))
                data=cursor.fetchall()
                if len(data)==0:
                        print("No customers!")
                else:
                        colNames = data[0].keys()
                        data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                        print (data.to_string(index=False))
                        connection.commit()
        print('Update:')
        while (True):
                print('1. Name\n2. Surname \n3. E-mail\n4. Address\n5. Phone\n6. ID\n7. Back')
                choice = input()
                if choice.isdigit():
                        choice = int(choice)
                        if choice == 1:
                                print('Name update')
                                name=input('Insert new name\n')
                                with connection.cursor() as cursor:
                                        query = "UPDATE `CUSTOMER` SET `name` ='{}' where `ID_customer` = '{}'".format(name,idpelati)
                                        cursor.execute(query)
                                        connection.commit()
                        elif choice == 2:
                                name = input('Insert new surname\n')
                                with connection.cursor() as cursor:
                                        query = "UPDATE `CUSTOMER` SET `surname` ='{}' where `ID_customer` = '{}'".format(name,idpelati)
                                        cursor.execute(query)
                                        connection.commit()
                        elif choice == 3:
                                name = input('Insert new E-mail\n')
                                with connection.cursor() as cursor:
                                        query = "UPDATE `CUSTOMER` SET `E-mail` ='{}' where `ID_customer` = '{}'".format(name,idpelati)
                                        cursor.execute(query)
                                        connection.commit()
                        elif choice == 4:
                                print('Update address')
                                city=input('City\n')
                                odos=input('Street\n')
                                print('Number')
                                noumero=intchecker()
                                with connection.cursor() as cursor:
                                        query = "UPDATE `CUSTOMER` SET `Street` ='{}',`Number`='{}',`City`='{}' where `ID_customer` = '{}'".format(odos,noumero,city,idpelati)
                                        cursor.execute(query)
                                        connection.commit()
                        elif choice == 5:
                                print('Phone')
                                name = intchecker()
                                with connection.cursor() as cursor:
                                        query = "UPDATE `CUSTOMER` SET `phone` ='{}' where `ID_customer` = '{}'".format(name,idpelati)
                                        cursor.execute(query)
                                        connection.commit()
                        elif choice == 6:
                                name = input('ID\n')
                                with connection.cursor() as cursor:
                                        query = "UPDATE `CUSTOMER` SET `ID` ='{}' where `ID_customer` = '{}'".format(name,idpelati)
                                        cursor.execute(query)
                                        connection.commit()
                        elif choice == 7:
                                print("Back")
                                break
                        else:
                                print("Invalid choice")
                else:
                        print("Invalid choice")
        return


def enimerwsidiathesimotitas(): #allazei tin diathesimotita tis theseis
        epilogiid=check_thesis()
        epilogi=2
        while(epilogi<0 or epilogi>1):
                print('Choose job availability:\n0. Not available\n1. Available')
                epilogi=boolchecker()
                if(epilogi==0):
                        with connection.cursor() as cursor:
                                query = "UPDATE `JOB` SET `availability` = 0 where `ID_job` = '{}'".format(epilogiid)
                                cursor.execute(query)
                                connection.commit()
                elif(epilogi==1):
                        with connection.cursor() as cursor:
                                query = "UPDATE `JOB` SET `availability` = 1 where `ID_job` = '{}'".format(epilogiid)
                                cursor.execute(query)
                                connection.commit()
        return


def enimerwsithesis(): #enimerwsi stoixeiwn thesis ergasias
        idthesis=check_thesis()
        with connection.cursor() as cursor:
                cursor.execute("SELECT * from `job` where `ID_job`='{}'".format(idthesis))
                data = cursor.fetchall()
                if len(data) == 0:
                        print("No results!")
                else:
                        colNames = data[0].keys()
                        data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                        print (data.to_string(index=False))
                        connection.commit()
                print('Update')
                while (True):
                        print('1. Title\n2. Salary \n3. Working hours\n4. Work type\n5. City\n6. Remote\n7. Website published\n8. Back')
                        choice = input()
                        if choice.isdigit():
                                choice = int(choice)
                                if choice == 1:
                                        name = input('Title\n')
                                        with connection.cursor() as cursor:
                                                query = "UPDATE `JOB` SET `Title` ='{}' where `ID_job` = '{}'".format(name,idthesis)
                                                cursor.execute(query)
                                                connection.commit()
                                elif choice == 2:
                                        print('Salary')
                                        name=intchecker()
                                        with connection.cursor() as cursor:
                                                query = "UPDATE `JOB` SET `Salary` ='{}' where `ID_job` = '{}'".format(name,idthesis)
                                                cursor.execute(query)
                                                connection.commit()
                                elif choice == 3:
                                        print('Working hours')
                                        name = intchecker()
                                        with connection.cursor() as cursor:
                                                query = "UPDATE `JOB` SET `working hours` ='{}' where `ID_job` = '{}'".format(name,idthesis)
                                                cursor.execute(query)
                                                connection.commit()
                                elif choice == 4:
                                        name = input('Work type\n')
                                        with connection.cursor() as cursor:
                                                query = "UPDATE `JOB` SET `work type` ='{}' where `ID_job` = '{}'".format(name,idthesis)
                                                cursor.execute(query)
                                                connection.commit()
                                elif choice == 5:
                                        name = input('City\n')
                                        with connection.cursor() as cursor:
                                                query = "UPDATE `JOB` SET `city` ='{}' where `ID_job` = '{}'".format(name,idthesis)
                                                cursor.execute(query)
                                                connection.commit()
                                elif choice == 6:
                                        print('Insert 1 if remote is available, or 0')
                                        name = boolchecker()
                                        with connection.cursor() as cursor:
                                                query = "UPDATE `JOB` SET `Remote` ='{}' where `ID_job` = '{}'".format(name, idthesis)
                                                cursor.execute(query)
                                                connection.commit()
                                elif choice == 7:
                                        name = input('Website published\n')
                                        with connection.cursor() as cursor:
                                                query = "UPDATE `JOB` SET `website published` ='{}' where `ID_job` = '{}'".format(name,idthesis)
                                                cursor.execute(query)
                                                connection.commit()
                                elif choice == 8:
                                        print("Back")
                                        break
                                else:
                                        print("Invalid choice")
                        else:
                                print("Invalid choice")
        return


def enimerwsiipallilou(): #enimerwsi stoixeiwn ipallilwn
        password=checkpass1()
        with connection.cursor() as cursor:
                cursor.execute("SELECT * from `ADMIN` where `ID_admin`='{}'".format(password))
                data=cursor.fetchall()
                if len(data)==0:
                        print("No results!")
                else:
                        colNames = data[0].keys()
                        data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                        print (data.to_string(index=False))   
        print('Update')
        while (True):
                print('1. Name\n2. Surname \n3. Salary\n4. Phone\n5. SSN\n6. Back')
                choice = input()
                if choice.isdigit():
                        choice = int(choice)
                        if choice == 1:
                                print('Name update')
                                name=input('Name\n')
                                with connection.cursor() as cursor:
                                        query = "UPDATE `ADMIN` SET `Name` ='{}' where `ID_admin` = '{}'".format(name,password)
                                        cursor.execute(query)
                                        connection.commit()
                        elif choice == 2:
                                name = input('Surname\n')
                                with connection.cursor() as cursor:
                                        query = "UPDATE `ADMIN` SET `Surname` ='{}' where `ID_admin` = '{}'".format(name,password)
                                        cursor.execute(query)
                                        connection.commit()
                        elif choice == 3:
                                print('Salary')
                                name = intchecker()
                                with connection.cursor() as cursor:
                                        query = "UPDATE `ADMIN` SET `Salary` ='{}' where `ID_admin` = '{}'".format(name,password)
                                        cursor.execute(query)
                                        connection.commit()
                        elif choice == 4:
                                print('Phone')
                                name = intchecker()
                                with connection.cursor() as cursor:
                                        query = "UPDATE `Admin` SET `Phone` ='{}' where `ID_admin` = '{}'".format(name,password)
                                        cursor.execute(query)
                                        connection.commit()
                        elif choice == 5:
                                print('SSN')
                                name = intchecker()
                                with connection.cursor() as cursor:
                                        query = "UPDATE `ADMIN` SET `SSN` ='{}' where `ID_admin` = '{}'".format(name,password)
                                        cursor.execute(query)
                                        connection.commit()
                        elif choice == 6:
                                print("Back")
                                break
                        else:
                                print("Invalid choice")
                else:
                        print("Invalid choice")
        return


## Leitourgies ergodoti

def employer(): #main ergodoti
        password=checkpass2()#id etaireias
        print ("Select function")
        while(True):
                print ("1. New job\n2. Upcoming interviews\n3. My job offers\n4. Applications\n5. Log out")
                selection=input()
                if selection.isdigit():
                        selection=int(selection)
                        if selection==1:
                                newjob(password)
                        elif selection==2:
                                sinenteukseis1(password)
                        elif selection==3:
                                theseis(password)
                        elif selection==4:
                                print("1. Show applications\n2. Review cv\n3. Update")
                                choice=input()
                                if choice.isdigit():
                                        choice=int(choice)
                                        if choice==1:
                                                aitiseis(password)
                                        elif choice==2:
                                                reviewcv(password)
                                        elif choice==3:
                                                poreia(password)
                                        else:
                                                print("Invalid choice")
                                else:
                                        print("Invalid choice")
                        elif selection==5:
                                print("Succesful log out")
                                break
                        else:
                                print("Invalid choice")
                else:
                        print("Invalid choice")
        return


def sinenteukseis1(password): #gia ergodotes emfanizei tis sinenteukseis me onomatepwnimo tilefwno kai imerominia
        with connection.cursor() as cursor:
                query="SELECT p.`Name`,p.`Surname`,p.`Phone`,k.`Date` FROM `Interview` as k JOIN `EMPLOYER` as e on e.`ID_employer`=k.`ID_employer` join `EMPLOYEE` as y on y.`ID_customer`=k.`ID_employee` JOIN `CUSTOMER` as p on p.`ID_customer`=y.`ID_customer` where e.`ID_employer`='{}'".format(password)
                cursor.execute(query)
                data=cursor.fetchall()
                if len(data)==0:
                        print("No upcoming interviews!")
                else:
                        colNames = data[0].keys()
                        data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                        print (data.to_string(index=False))
        return


def theseis(password): #anoixtes theseis tou ergodoti
        with connection.cursor() as cursor:
                query="SELECT y.ID_job as ID,y.Title,y.City,k.`DateOffered`,k.Due FROM `OFFER` as k JOIN `EMPLOYER` as e on e.`ID_employer`=k.`ID_employer` join `JOB` as y on y.`ID_job`=k.`ID_job` where e.`ID_employer`='{}' and y.`Availability`=1".format(password)
                cursor.execute(query)
                data=cursor.fetchall()
                if len(data)==0:
                        print("No open job offers!")
                else:
                        colNames = data[0].keys()
                        data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                        print (data.to_string(index=False))
        return


def aitiseis(password): #aitiseis gia tis anoixtes theseis tou ergodoti
        with connection.cursor() as cursor:
                query="select p.`Name`,p.`Surname`,p.`Phone`,a.`Status`,a.`ID_app` from `OFFER` as k JOIN `EMPLOYER` as e on e.`ID_employer`=k.`ID_employer` join `JOB` as y on y.`ID_job`=k.`ID_job` JOIN `APPLY` as a on a.`ID_job`=y.`ID_job` join `EMPLOYEE` as l on l.`ID_customer`=a.`ID_employee` join `CUSTOMER` as p on p.`ID_customer`=l.`ID_customer` join `CV` as b on b.`ID_cv`=l.`ID_cv` where e.`ID_employer`='{}'".format(password)
                cursor.execute(query)
                data=cursor.fetchall()
                if len(data)==0:
                        print("No applications!")
                else:
                        colNames = data[0].keys()
                        data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                        print (data.to_string(index=False))
        return


def poreia(password): #allazei tin poreia tis aitisis afou exei diavasei to viografiko se egrithike i aporrifthike
        aitisi=checkaitisi(password)
        if aitisi=='*':
                return
        print("Status")
        poreia=input()
        with connection.cursor() as cursor:
                query="UPDATE `APPLY` SET `status` =  '{}' where `ID_app` = '{}'".format(poreia,aitisi)
                cursor.execute(query)
                connection.commit()
        return


## Leitourgies ergazomenou


def employee(): #main ergazomenou
        password=checkpass3()
        print ("Select function")
        while(True):
                print ("1. Available jobs\n2. Apply\n3. Upcoming interviews\n4. Guide's informamtion\n5. Applications\n6. Expertise\n7. Upload CV\n8. Log out")
                selection=input()
                if selection.isdigit():
                        selection=int(selection)
                        if selection==1:
                                print("1. All available jobs\n2. Expertise filtered")
                                choice=input()
                                if choice.isdigit():
                                        choice=int(choice)
                                        if choice==1:
                                                openjobs()
                                        elif choice==2:
                                                theseiseidikotita(password)
                                        else:
                                                print("Invalid choice")
                                else:
                                        print("Invalid choice")
                        elif selection==2:
                                apply(password)
                        elif selection==3:
                                sinenteukseis2(password)
                        elif selection==4:
                                ipefthinos(password)
                        elif selection==5:
                                aitiseis2(password)
                        elif selection==6:
                                update_eidikotitas(password)
                        elif selection==7:
                                uploadcv(password)
                        elif selection==8:
                                print("Successful log out")
                                break
                        else:
                                print("Invalid choice")
                else:
                        print("Invalid choice")
        return


def theseiseidikotita(password): #emfanizei tis theseis ergasias panw stin eidikotita tou ipopsifiou
        with connection.cursor() as cursor:
                query="SELECT y.`ID_job` as `ID`, y.`Title`, y.`Salary`, y.`Working hours`, y.`Work type`, y.`City`, y.`Remote`, y.`Specifications`, y.`Preffered experience` FROM `JOB` as y join `EXPERTISE` as k on k.`ID_expertise`=y.`ID_expertise` join `EXPERT`as t on t.`ID_expertise`=k.`ID_expertise` where  y.`Availability`=1 and t.`ID_employee`='{}'".format(password) 
                cursor.execute(query)
                data=cursor.fetchall()
                if len(data)==0:
                        print("No jobs found!")
                else:
                        colNames = data[0].keys()
                        data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                        print (data.to_string(index=False))
        return


def apply(password): #dimiourgei aitisi se thesi ergasias gia ton ipopsifio
        thesi=checkapply()
        with connection.cursor() as cursor:
                query="insert into `APPLY` (`ID_employee`,`ID_job`) values (%s,%s)"
                cursor.execute(query,(password,thesi))
                connection.commit()
        return


def sinenteukseis2(password): #emfanizei  tis sinenteukseis tou ergazomenou
        with connection.cursor() as cursor:
                query="SELECT k.`Date`,e.`Company name`,e.`Company type` FROM `INTERVIEW` as k JOIN `EMPLOYER` as e  on e.`ID_employer`=k.`ID_employer` where k.`ID_employee`='{}'".format(password)
                cursor.execute(query)
                data=cursor.fetchall()
                if len(data)==0:
                        print("No upcoming interviews!")
                else:
                        colNames = data[0].keys()
                        data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                        print (data.to_string(index=False))
        return


def ipefthinos(password): #emfanizei ta stoixeia tou ipallilou pou ton kathodigei
        with connection.cursor() as cursor:
                query="select y.`ID_admin`,y.`Name`,y.`Surname`,y.`Phone` from `GUIDE` as k join `ADMIN` as y on y.`ID_admin`=k.`ID_admin` where k.`ID_employee`='{}'".format(password) 
                cursor.execute(query)
                data=cursor.fetchall()
                if len(data)==0:
                        print("Soon someone will be your guide!")
                else:
                        colNames = data[0].keys()
                        data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                        print (data.to_string(index=False))
        return

                      
def aitiseis2(password): #emfanizei tis aitiseis pou exei kanei o ipopsifios
        with connection.cursor() as cursor:
                query="select y.`Title`,a.`ID_app`,a.`Status`,y.`ID_job` from `JOB` as y JOIN `APPLY`as a on a.`ID_job`=y.`ID_job` join `EMPLOYEE` as l on l.`ID_customer`=a.`ID_employee` where l.`ID_customer`='{}'".format(password) 
                cursor.execute(query)
                data=cursor.fetchall()
                if len(data)==0:
                        print("No open applications")
                else:
                        colNames = data[0].keys()
                        data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                        print (data.to_string(index=False))
        return


def update_eidikotitas(password): #allazei tin eidikotita tou ergazomenou
        with connection.cursor() as cursor: #provoli eidikotitwn
                #query="select distinct k.`ID_Ειδικότητας`,k.`Τίτλος` from `ΥΠΟΨΗΦΙΟΣ ΕΡΓΑΖΟΜΕΝΟΣ` as e join `ΚΑΤΕΧΕΙ` as t on t.`ID_Υποψήφιου`=e.`ID_Πελάτη` join `ΕΙΔΙΚΟΤΗΤΑ`as k ON k.`ID_Ειδικότητας`=t.`ID_Ειδικότητας`"
                query="select * from `EXPERTISE`"
                cursor.execute(query)
                data=cursor.fetchall()
                if len(data)==0:
                        print("No expertise found")
                else:
                        colNames = data[0].keys()
                        data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                        print (data.to_string(index=False))
                connection.commit()
        print('These are the available expertises')
        epilogi=0
        while(epilogi<1 or epilogi>15):
                print('Select expertise ID')
                epilogi=intchecker()
        with connection.cursor() as cursor:  #allagi eidikotitas
                query1="update `EMPLOYEE` as e JOIN `EXPERT`as k on k.`ID_employee`=e.`ID_customer` SET `ID_expertise`='{}' where `ID_customer`='{}'".format(epilogi,password)
                cursor.execute(query1)
                connection.commit()
        return








def diagrafi():
    print('Τι θες να διαγράψεις ?')
    while (True):
        print('1: Πελάτη\n2: Θέση Εργασίας\n3: Υπάλληλος\n4: Αίτηση\n5: Πίσω')
        choice = input()
        if choice.isdigit():
            choice = int(choice)
            if choice == 1:
                print('Διαγραφή πελάτη')
                idpel=check_pelati()
                with connection.cursor() as cursor:
                    query = "DELETE from `ΠΕΛΑΤΗΣ` where `ID_Πελάτη`='{}'".format(idpel)
                    cursor.execute(query)
                    connection.commit()
                return
            elif choice == 2:
                print('Διαγραφή Θέσης Εργασίας')
                idthes=check_thesis()
                with connection.cursor() as cursor:
                    query = "DELETE FROM `ΘΕΣΗ ΕΡΓΑΣΙΑΣ` WHERE `ID_Θέσης_Εργασίας`='{}'".format(idthes)
                    cursor.execute(query)
                    connection.commit()
                return
            elif choice == 3:
                print('Διαγραφή υπαλλήλου')
                idipal=checkpass1()
                with connection.cursor() as cursor:
                    query="DELETE from `ΥΠΑΛΛΗΛΟΣ` where `ID_Υπαλλήλου`='{}'".format(idipal)
                    cursor.execute(query)
                    connection.commit()             
                return
            elif choice == 4:
                print('Διαγραφή Αίτησης')
                idipal=check_aitisi1()
                with connection.cursor() as cursor:
                    query="DELETE from `ΚΑΝΕΙ ΑΙΤΗΣΗ ΓΙΑ` where `ID_αίτησης`='{}'".format(idipal)
                    cursor.execute(query)
                    connection.commit()            
                return
            elif choice == 5:
                print("Πίσω")
                break
            else:
                print("Μη έγκυρο")
        else:
            print("Μη έγκυρο")
    return

def check_aitisi1():  # gia diagrafi
    with connection.cursor() as cursor:
        cursor.execute("SELECT `ID_app` from `APPLY`")
        data = cursor.fetchall()
        pass_pelati = []
        for d in data:
            pass_pelati.append(d['ID_app'])
        while (True):
            print('Insert application ID')
            password = input()
            if password.isdigit():

                password = int(password)
                if password in pass_pelati:
                    return password
                else:
                    print('Invalid ID')
            else:
                print('Invalid ID')
        return

def uploadcv(password):
        with connection.cursor() as cursor:
                query2 = "SELECT `ID_cv` FROM `EMPLOYEE` WHERE id_customer={}".format(password)
                cursor.execute(query2)
                data = cursor.fetchall()
                id_cv = data[0].get('ID_cv')
                try:
                        cv = input("Insert the file name: ")
                        cv = open(cv, "r")
                        query="Update `CV` set cv = '{}' where id_cv = '{}'".format(cv.read(),id_cv)
                        cursor.execute(query)
                        connection.commit()
                except:
                        print ("No such file! Please make sure the file is in the same directory!")                
        return

def reviewcv(password):
        idapp=checkaitisi(password)
        with connection.cursor() as cursor:
                query="select b.CV from `OFFER` as k JOIN `EMPLOYER` as e on e.`ID_employer`=k.`ID_employer` join `JOB` as y on y.`ID_job`=k.`ID_job` JOIN `APPLY` as a on a.`ID_job`=y.`ID_job` join `EMPLOYEE` as l on l.`ID_customer`=a.`ID_employee` join `CUSTOMER` as p on p.`ID_customer`=l.`ID_customer` join `CV` as b on b.`ID_cv`=l.`ID_cv` where e.`ID_employer`='{}' and a.ID_app='{}'".format(password,idapp)
                cursor.execute(query)
                data = cursor.fetchall()
                if len(data)==0:
                        print("CV is not available!")
                else:
                        colNames = data[0].keys()
                        data=pd.DataFrame([[row[col] for col in colNames] for row in data],columns=colNames)
                        print (data.to_string(index=False))
        return
                
main()

