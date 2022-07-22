#include<stdio.h> 
#include<iostream.h> 
#include<fstream.h> 
#include<conio.h> 
#include<string.h> 
#include<stdlib.h> 
class student 
{ 
public: char name[20] , usn[10] , sem[10] , branch[20] , buffer[50] , rrn[10]; 
public: void writerec( ); 
void displayrec( ); 
void searchrec( ); 
}; 
void student :: writerec( ) 
{
fstream fp; 
student s; 
fp.open("stu3.txt",ios::app); 
cout<<"\n Enter RRN value"; 
cin>>s.rrn; 
cout<<"\n Enter name"; 
cin>>s.name; 
cout<<"\nEnter usn"; 
cin>>s.usn; 
cout<<"\nEnter sem"; 
cin>>s.sem; 
cout<<"\nEnter branch"; 
cin>>s.branch; 
strcpy(s.buffer,s.rrn); 
strcat(s.buffer,"|"); 
strcat(s.buffer,s.name); 
strcat(s.buffer,"|"); 
strcat(s.buffer,s.usn); 
strcat(s.buffer,"|"); 
strcat(s.buffer,s.sem); 
strcat(s.buffer,"|"); 
strcat(s.buffer,s.branch); 
strcat(s.buffer,"\n"); 
fp<<s.buffer; 
fp.close(); 
} 
void student :: displayrec( ) 
{ 
int i; 
student s; 
fstream fp; 
fp.open("stu3.txt",ios::in); 
i=0;
cout<<"RRN \t \t Name \t \t USN \t \t Sem \t \t Branch \n"; 
while(!fp.eof( )) 
{ 
fp.getline(s.rrn,10,'|'); 
fp.getline(s.name,20,'|'); 
fp.getline(s.usn,10,'|'); 
fp.getline(s.sem,10,'|'); 
fp.getline(s.branch,20,'\n'); 
cout<<s.rrn<<"\t\t"<<s.name<<"\t\t"<<s.usn<<"\t\t"; 
cout<<s.sem<<"\t\t"<<s.branch; 
cout<<"\n"; 
i++; 
} 
fp.close( ); 
getch( ); 
} 
void student :: searchrec( ) 
{ 
fstream fp; 
student s; 
char num[10] , buff[50]; 
fp.open("stu3.txt",ios::in); 
cout<<"\n Enter the RRN of the record which is to be searched"; 
cin>>num; 
while(!fp.eof( )) 
{ 
fp.getline(s.rrn,10,'|'); 
fp.getline(s.name,20,'|'); 
fp.getline(s.usn,10,'|'); 
fp.getline(s.sem,10,'|'); 
fp.getline(s.branch,20,'\n'); 
if(strcmp(s.rrn,num) = = 0) 
{ 
cout<<"\n Record Found"; 
cout<<"\n"<<s.rrn<<"\t\t"<<s.name<<"\t\t"<<s.usn<<"\t\t"; 
cout<<s.sem<<"\t\t"<<s.branch; 
cout<<"\n"; 
getch();
return; 
} 
} 
cout<<"\n Record not Found"; 
getch( ); 
return; 
} 
void main( ) 
{ 
fstream fp; 
int ch; 
student s; 
fp.open("stu3.txt",ios::out); 
fp.close(); 
for(;;) 
{ 
clrscr(); 
cout<<"\n 1. write record"; 
cout<<"\n 2. display record"; 
cout<<"\n 3. search record"; 
// cout<<"\n 4. modify record"; 
cout<<"\n 4. exit"; 
cout<<"\n Enter your choice"; 
cin>>ch; 
switch(ch) 
{ 
case 1 : s.writerec( ); 
break; 
case 2 : s.displayrec( ); 
break; 
case 3 : s.searchrec(); 
break; 
// case 4:s.modifyrec(); 
break; 
case 4 : exit(0); 
break; 
} 
} 
}
