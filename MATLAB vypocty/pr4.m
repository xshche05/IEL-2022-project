clc;
clear;
U_1 = 3;
U_2 = 5;
R_1 = 12;
R_2 = 14;
L_1 = 120*10^-3;
L_2 = 100*10^-3;
C_1 = 200*10^-6;
C_2 = 105*10^-6;
f = 70;

w = 2 * pi * f;

Z_C_1 = -1j/(w*C_1);
Z_C_2 = -1j/(w*C_2);
Z_L_1 = 1j * w * L_1;
Z_L_2 = 1j * w * L_2;

u_1 = U_1 * sin(2 * pi * f * pi/(2*w));
u_2 = U_2 * sin(2 * pi * f * pi/(2*w));

%A = [
%    Z_L_2 + R_2 + Z_L_1 + R_1, -Z_L_1-R_2, -Z_L_2;
%    -Z_L_1 - R_2, Z_C_1 + Z_C_2 + Z_L_1 + R_2, -Z_C_1;
%    -Z_L_2, -Z_C_1, Z_L_2 + Z_C_1;
%    ];
%B = [
%   -u_1;
%    0;
%    -u_2;
%    ];

syms I_A I_B I_C
a = I_A*(Z_L_2 + R_2 + Z_L_1 + R_1) + I_B*(-Z_L_1-R_2) + I_C * (-Z_L_2) == -u_1;
b = I_A*(-Z_L_1 - R_2) + I_B*(Z_C_1 + Z_C_2 + Z_L_1 + R_2) + I_C * (-Z_C_1) == 0;
c = I_A*(-Z_L_2) + I_B*(-Z_C_1) + I_C * (Z_L_2 + Z_C_1) == -u_2;

[I_A, I_B, I_C] = solve(a, b, c);

ia = double(I_A);
ib = double(I_B);
ic = double(I_C);

i_C_2 = ib;
%disp(abs(i_C_2))
U_C_2 = i_C_2 * Z_C_2;
fi_C_2 = atan2(imag(U_C_2),real(U_C_2));
%disp(real(U_C_2))
%disp(imag(U_C_2))
disp('VYSLEDKY:');
fprintf('|U_C2| = %.4f V\n', abs(U_C_2));
fprintf('fi_C2 = %.4f Rad || %.4fdeg\n', fi_C_2, rad2deg(fi_C_2));





