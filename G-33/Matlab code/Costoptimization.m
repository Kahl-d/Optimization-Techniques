f = [74310;110080];
A = [-50 -120];
prompt="Please enter the branch\n";
branch = input(prompt);
intcon=[1 2];
lb = [0 0];
ub = [4 4];
if branch=="CSE"
   prompt1="Enter the number of students in cse branch\n";
   cse=input(prompt1);
   v1=-1*cse;
   b=v1;
end
if branch=="CCE"
   prompt1="Enter the number of students in cce branch\n";
   cse=input(prompt1);
   v1=-1*cse;
   b=v1;
end
x = intlinprog(f,intcon,A,b,[],[],lb,ub);
optimized=x(1)*74310 + x(2)*110080;
fprintf("The required number of lecture halls are as follows-:\n");
fprintf("Small lecture halls: %d\n",x(1));
fprintf("Big lecture halls: %d\n",x(2));
fprintf("Optimal  cost is %f\n",optimized);