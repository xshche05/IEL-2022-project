% falstad - https://cutt.ly/e1hOdoj
clc;
clear;
disp('Prikld 3: Metoda uzlovych napeti');
U = 110;
I_1 = 0.85;
I_2 = 0.75;
R_1 = 44;
R_2 = 31;
R_3 = 56;
R_4 = 20;
R_5 = 30;

%syms U I_1 I_2 R_1 R_2 R_3 R_4 R_5
syms U_A;
syms U_B;
syms U_C;
I_R_1 = (U - U_A)/R_1;
I_R_2 = (U_A - U_B)/R_2;
I_R_3 = U_A/R_3;
I_R_4 = (U_B - U_C)/R_4;
I_R_5 = U_C/R_5;

A = I_R_1 - I_R_2 - I_R_3 == 0;
B = I_R_2 - I_R_4 - I_2 == 0;
C = I_R_4 + I_2 - I_1 - I_R_5 == 0;


%eqns = [A, B, C];

%[a, b] = equationsToMatrix(eqns, [U_A, U_B, U_C]);

%disp(a)
%disp(b)

[U_A, U_B, U_C] = solve(A, B, C);

a = double(U_A);
b = double(U_B);
c = double(U_C);
I_R_4 = (U_B - U_C)/R_4;
UR4 = R_4 * I_R_4;
disp('VYSLEDKY:');
fprintf('UR4 = %.4f V\n', UR4);
fprintf('IR4 = %.4f A\n', I_R_4);




