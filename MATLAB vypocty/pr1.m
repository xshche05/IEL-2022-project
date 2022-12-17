% falstad - https://cutt.ly/C1hOUpY
clc;
clear;
disp('Prikld 1: Metoda postupneho zjednodusovani');
U1 = 80;
U2 = 120;
R1 = 350;
R2 = 650;
R3 = 410;
R4 = 130;
R5 = 360;
R6 = 750;
R7 = 310;
R8 = 190;
% R6 a R8 seriove - R68
R68 = R6 + R8;
% hvezda to trojuhelnik
Rab = R4 + R5 + (R4*R5)/R7;
Rac = R4 + R7 + (R4*R7)/R5;
Rbc = R5 + R7 + (R5*R7)/R4;
%fprintf('%.4f\n', Rab)
%fprintf('%.4f\n', Rac)
%fprintf('%.4f\n', Rbc)
% U1 a U2 seriove - U12
U12 = U1 + U2;
% R2, R3, Rab paralelne - R23ab
R23ab = (1/R2 + 1/R3 + 1/Rab)^-1;
% R68 a Rbc paralelne - R68bc
R68bc = (1/R68 + 1/Rbc)^-1;
% R23ab a R68bc seriove - R23ab68bc
R23ab68bc = R23ab + R68bc;
% R23ab68bc a Rac paralelne - R23ab68bcac
R23ab68bcac = (1/R23ab68bc + 1/Rac)^-1;
% Ui se rovna U12
Ui = U12;
% R1 a R23ab68bcac seriove - Rekv
Rekv = R1 + R23ab68bcac;
% Celkovy proud
I = Ui/Rekv;
% Zpetne dopocitame UR2 a IR2
UR23ab68bcac = (R23ab68bcac/(R23ab68bcac+R1)) * Ui;
UR23ab68bc = UR23ab68bcac;
UR23ab = (R23ab/(R23ab+R68bc)) * UR23ab68bc;
UR2 = UR23ab;
IR2 = UR2/R2;
disp('VYSLEDKY:');
fprintf('UR2 = %.4f V\n', UR2);
fprintf('IR2 = %.4f A\n', IR2);




