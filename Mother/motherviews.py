from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import render
import MySQLdb
# import pymysql
import simplejson as json
import random
import urllib.request
import webbrowser
from datetime import date

conn=MySQLdb.connect("localhost","root","","dbbabycare")
c=conn.cursor()


def motherhome(request):
    return render(request,'Mother_home.html')


def vaccination_alerts(request):
    mother_id=request.session['userid']
    get_panchayah="select district,panchayath,phone_number,wrker_id from mother_reg where mother_id='"+str(mother_id)+"'"
    c.execute(get_panchayah)
    mthr_details=c.fetchone()
    view_vaacs="select * from vaccination where wrkr_id='"+str(mthr_details[3])+"'"
    c.execute(view_vaacs)
    view_data=c.fetchall()
    return render(request,'Vacc_Alerts.html',{"data":view_data})

def food_details(request):
    mother_id=request.session['userid']
    get_panchayah="select district,panchayath,phone_number,wrker_id from mother_reg where mother_id='"+str(mother_id)+"'"
    c.execute(get_panchayah)
    mthr_details=c.fetchone()
    view_food="select * from food where wrkr_id='"+str(mthr_details[3])+"'"
    c.execute(view_food)
    view_data=c.fetchall()
    return render(request,'Food_Details.html',{"data":view_data})

def health_tips(request):
    mother_id=request.session['userid']
    get_panchayah="select district,panchayath,phone_number,wrker_id from mother_reg where mother_id='"+str(mother_id)+"'"
    c.execute(get_panchayah)
    mthr_details=c.fetchone()
    view_food="select * from health_tips where wrkr_id='"+str(mthr_details[3])+"'"
    c.execute(view_food)
    view_data=c.fetchall()
    return render(request,'Health_Tips.html',{"data":view_data})

def disease_details(request):
    mother_id=request.session['userid']
    get_panchayah="select district,panchayath,phone_number,wrker_id from mother_reg where mother_id='"+str(mother_id)+"'"
    c.execute(get_panchayah)
    mthr_details=c.fetchone()
    view_disease="select d.disease_id,d.details,doc.dname,doc.qualification,doc.address,doc.phone_no,doc.optime from disease d,doctor doc where d.wrkr_id='"+str(mthr_details[3])+"' and doc.doctor_id=d.doc_id"
    c.execute(view_disease)
    view_data=c.fetchall()
    return render(request,'Disease_Details.html',{"data":view_data})


