from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.shortcuts import render
import webbrowser
from datetime import date
import MySQLdb


conn=MySQLdb.connect("localhost","root","","dbbabycare")
c=conn.cursor()

def sendsms(ph,msg):
    sendToPhoneNumber= "+91"+ph
    userid = "2000022557"
    passwd = "54321@lcc"
    url = "http://enterprise.smsgupshup.com/GatewayAPI/rest?method=sendMessage&send_to=" + sendToPhoneNumber + "&msg=" + msg + "&userid=" + userid + "&password=" + passwd + "&v=1.1&msg_type=TEXT&auth_scheme=PLAIN"
    # contents = urllib.request.urlopen(url)
    webbrowser.open(url)

def home(request):
    userid=request.session['userid']
    s="select name from panchayath_reg where panchayath_id='"+str(userid)+"'"
    c.execute(s)
    d=c.fetchone()
    request.session['name']=d[0]
    return render(request,'panchayathhome.html')

def notification(request):
    name=request.session['name']
   
    view_projects="select * from projects where panchayath='"+str(name)+"'"
    c.execute(view_projects)
    view_data=c.fetchall()
    return render(request,'viewnotification.html',{"data":view_data})

def meeting(request):
    name=request.session['name']
    if request.POST:

        meeting=request.POST.get("meeting")
        date=request.POST.get("date")
        time=request.POST.get("time")
        
        project_exists="select count(*) from meeting where  panchayath='"+str(name)+"' and meeting='"+str(meeting)+"' and mdate='"+str(date)+"' and mtime='"+str(time)+"'"
        print("-------"+project_exists+"-------")
        c.execute(project_exists)
        exisist_data=c.fetchone()
        print(exisist_data)
        # try:
        if exisist_data[0]>0:
                message="meeting already exisist"
                return render(request,"addmeeting.html",{"message":message})
        else:
                project_insert="insert into meeting(`panchayath`,`meeting`,`mdate`,`mtime`)values('"+str(name)+"','"+str(meeting)+"','"+str(date)+"','"+str(time)+"')"
                c.execute(project_insert)
                conn.commit()
                msg="The Government added something new for your diary please check it on, don't be late posted on "+str(date)
                project_sms="select phone_no from worker_reg where panchayath='"+name+"'"
                c.execute(project_sms)
                phone_data=c.fetchall()
                for p in phone_data:
                    sendsms(p[0],msg)
                message="Meeting Added Successfully"
                return render(request,"addmeeting.html",{"message":message})
        # except:
        #     message="Such details already exisist"
        #     return render(request,"Add_project.html",{"message":message})
    s="select * from meeting where panchayath='"+name+"'"
    c.execute(s)
    data=c.fetchall()
    return render(request,'addmeeting.html',{"data":data})
