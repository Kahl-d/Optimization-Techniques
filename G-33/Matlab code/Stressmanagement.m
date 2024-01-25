f = [1;1.5;1;1.5;1;1.5;1;1.5];
A = [1 0 1 0 1 0 1 0 
     0 1 0 1 0 1 0 1
     1 0 0 0 1 0 0 0
     0 1 0 0 1 0 0 0
     0 0 1 0 0 0 1 0
     0 0 0 1 0 0 0 1];
b = [15 19 6 6 6 6];
intcon = [1 2 3 4 5 6 7 8];
a = 3; B= 2; e= 0; F= 0; g=0; h=0;i=3;j=2;
prompt9 = "Enter the branch\n";
branch = input(prompt9);
    fprintf("Faculty 1:\n");
    prompt = "If you want to reschedule your classes enter 1 else 0\n";
    f1 = input(prompt);
    if f1==1
        prompt1 = "Enter 1 if you want to cancel the scheduled class and 2 if you want to take extra class\n";
        f1i=input(prompt1);
        prompt2="";
        f1i1=input(prompt2);
        if f1i==1
            a=3-f1i1;
        end
        if f1i==2
            e=f1i1;
        end
    end
    fprintf("Faculty 2:\n");
    prompt3 = "If you want to reschedule your classes enter 1 else 0\n";
    f2 = input(prompt3);
    if f2==1
        prompt4 = "Enter 1 if you want to cancel the scheduled class and 2 if you want to take extra class\n";
        f2i=input(prompt4);
        prompt5="";
        f2i1=input(prompt5);
        if f2i==1
            B = 2-f2i1;
        end
        if f2i==2
            F = f2i1;
        end
    end
    fprintf("Faculty 3:\n");
    prompt10 = "If you want to reschedule your classes enter 1 else 0\n";
    f3 = input(prompt10);
    if f3==1
        prompt11 = "Enter 1 if you want to cancel the scheduled class and 2 if you want to take extra class\n";
        f3i=input(prompt11);
        prompt12="";
        f3i1=input(prompt12);
        if f3i==1
             i= 3-f3i1;
        end
        if f2i==2
            g = f3i1;
        end
    end
    fprintf("Faculty 4:\n");
    prompt13 = "If you want to reschedule your classes enter 1 else 0\n";
    f4 = input(prompt13);
    if f4==1
        prompt14 = "Enter 1 if you want to cancel the scheduled class and 2 if you want to take extra class\n";
        f4i=input(prompt14);
        prompt15="";
        f4i1=input(prompt15);
        if f4i==1
             j= 3-f4i1;
        end
        if f4i==2
            h = f4i1;
        end
    end
lb = [a B i j e F g h];
x = intlinprog(f,intcon,A,b,[],[],lb);
s = 5;
arr = ["8:00-9:00";"9:00-10:00";"BREAK";"11:00-12:00";"12:00-1:00";"BREAK";"3:00-4:00";"4:00-5:00"];
arr1 = ["8:00-9:30";"BREAK";"10:00-11:30";"BREAK";"12:00-1:30";"BREAK";"2:00-3:30"];
m=0;
q = x(1);w = x(2); r = x(3); t = x(4); u = x(5); v = x(6); k=x(7); l=x(8); 
for c = 1:s
    m=0;
    if c==1
        fprintf("MONDAY:\n");
    end
    if c==2
        fprintf("TUESDAY:\n");
    end
    if c==3
        fprintf("WEDNESDAY:\n");
    end
    if c==4
        fprintf("THURSDAY:\n");
    end
    if c==5
        fprintf("FRIDAY:\n");
    end
    if mod(c,2)==1
        if q>0
            if(arr(m+1)=="BREAK")
                m=m+1;
                fprintf("BREAK| ");
            end
            fprintf("AP(%s)| ",arr(m+1));
            q=q-1;
            m=m+1;
        end
        if r>0
            if(arr(m+1)=="BREAK")
                m=m+1;
                fprintf("BREAK| ");
            end
            fprintf("M3(%s)| ",arr(m+1));
            r=r-1;
            m=m+1;
        end
        if u>0
            if(arr(m+1)=="BREAK")
                m=m+1;
                fprintf("BREAK| ");
            end
            fprintf("Ex-AP(%s)| ",arr(m+1));
            u=u-1;
            m=m+1;
        end
        if k>0
            if(arr(m+1)=="BREAK")
                m=m+1;
                fprintf("BREAK| ");
            end
            fprintf("Ex-M3(%s)| ",arr(m+1));
            k=k-1;
            m=m+1;
        end
    end
    if mod(c,2)==0
        if w>0
            if(arr1(m+1)=="BREAK")
                m=m+1;
                fprintf("BREAK| ");
            end
            if(branch=="CSE")
                fprintf("OTA(%s)| ",arr1(m+1));
            end
            if(branch=="CCE")
                fprintf("DCS(%s)| ",arr1(m+1));
            end
            m=m+1;
            w=w-1;
        end
        if t>0
            if(arr1(m+1)=="BREAK")
                m=m+1;
                fprintf("BREAK| ");
            end
            if(branch=="CSE")
                fprintf("PTS(%s)| ",arr1(m+1));
            end
            if(branch=="CCE")
                fprintf("S&S(%s)| ",arr1(m+1));
            end
            m=m+1;
            t=t-1;
        end
        if v>0
            if(arr1(m+1)=="BREAK")
                m=m+1;
                fprintf("BREAK| ");
            end
            if(branch=="CSE")
                fprintf("Ex-OTA(%s)| ",arr1(m+1));
            end
            if(branch=="CCE")
                fprintf("Ex-S&S(%s)| ",arr1(m+1));
            end
            m=m+1;
            v=v-1;
        end
        if l>0
            if(arr1(m+1)=="BREAK")
                m=m+1;
                fprintf("BREAK| ");
            end
            if(branch=="CSE")
                fprintf("Ex-PTS(%s)| ",arr1(m+1));
            end
            if(branch=="CCE")
                fprintf("Ex-DCS(%s)| ",arr1(m+1));
            end
            m=m+1;
            l=l-1;
        end
    end
    fprintf("\n");
end