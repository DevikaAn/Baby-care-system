
from django.http import HttpResponseRedirect
from django.shortcuts import render
import MySQLdb

conn=MySQLdb.connect("localhost","root","","dbbabycare")
c=conn.cursor()

def index(request):
    return render(request,'home.html')
def login(request):
    try:
        if request.POST:
            username=request.POST.get('username')
            password=request.POST.get('pass')
            print(username+"-----"+password)
            logsql="select userid,username,password,usertype from login where status='1' and username='"+str(username)+"' and password='"+str(password)+"'"
            print("----"+logsql+"------")
            c.execute(logsql)
            logdata=c.fetchone()
            if (logdata[3] == "admin") :
                return HttpResponseRedirect("/adminhome")
            elif logdata[3] == "worker" :
                request.session['userid']=logdata[0]
                return HttpResponseRedirect("/workerhome/")
            elif logdata[3] == "mother" :
                request.session['userid']=logdata[0]
                return HttpResponseRedirect("/motherhome/")
            elif logdata[3] == "doctor" :
                request.session['userid']=logdata[0]
                return HttpResponseRedirect("/doctorhome/")
            elif logdata[3] == "panchayath" :
                request.session['userid']=logdata[0]
                return HttpResponseRedirect("/panchayathhome/")
            else:
                print('**********is here**********')
    except:
        message="Invalid username and password"
        return render(request,"login.html",{'message':message})
    return render(request,'login.html')

