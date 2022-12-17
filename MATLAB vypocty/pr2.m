% falstad - https://cutt.ly/u1hPRkV
clc;
clear;
disp('Prikld 2: Metoda Theveninovy vety');
U = 250;
R1 = 150;
R2 = 335;
R3 = 625;
R4 = 245;
R5 = 600;

% % Hledame ekv zdroj
% R1, R2, R3 seriove - R123
R123 = R1 + R2 + R3;
% R123, R4 paralelne - Ri
Ri = (1/R123+1/R4)^-1;
% % Ted najdeme Ix
% R1, R2, R3, R4 seriove - R1234
R1234 = R1 + R2 + R3 + R4;
% Ix
Ix = U/R1234;
% Ui se rovna UR4
UR4 = Ix * R4;
Ui = UR4;
% UR5
UR5 = R5/(Ri + R5) * Ui;
% IR5
IR5 = UR5/R5;

disp('VYSLEDKY:');
fprintf('UR5 = %.4f V\n', UR5);
fprintf('IR5 = %.4f A\n', IR5);