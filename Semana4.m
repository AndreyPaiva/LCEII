V = 220; %Tensçao RMS
f = 60; %Frequência

%Combinação 1
S01 = 5e3;
fp01 = 0.6; %atrasado
P01 = S01*fp01;
Q01 = sqrt(S01^2 - P01^2);
S1 = P01 + j*Q01;

XC01 = V^2/Q01;
C01 = 1/(2*pi*f*XC01);

figure(1)
subplot(1,2,1);
plot([0 P01],[0 0],[P01 P01],[0 Q01],[0 P01],[0 Q01]);
axis([0 3500 0 4500],'square');
title("Antes: fp = 0.6");
grid;
subplot(1, 2, 2);
plot([0 P01],[0 0],[P01 P01],[0 Q01-Q01],[0 P01],[0 Q01-Q01]);
axis([0 3500 0 4500],'square');
title("Depois: fp = 1");
grid;

%Combinação 2
S02 = 15e3;
fp02 = 0.5; %atrasado
P02 = S02*fp02;
Q02 = sqrt(S02^2 - P02^2);
S2 = P02 + j*Q02;

XC02 = V^2/Q02;
C02 = 1/(2*pi*f*XC02);

figure(2)
subplot(1,2,1);
plot([0 P02],[0 0],[P02 P02],[0 Q02],[0 P02],[0 Q02]);
axis([0 8000 0 14000],'square');
title("Antes: fp = 0.5");
grid;
subplot(1, 2, 2);
plot([0 P02],[0 0],[P02 P02],[0 Q02-Q01],[0 P02],[0 Q02-Q01]);
axis([0 8000 0 14000],'square');
title("Depois: fp = 0.6406");
grid;

%Combinação 3
S03 = 10e3;
fp03 = 0.9; %adiantado
P03 = S03*fp03;
Q03 = -1*sqrt(S03^2 - P03^2);
S3 = P03 + j*Q03;

XC03 = V^2/Q03;
C03 = 1/(2*pi*f*XC03);

figure(3)
subplot(1,2,1);
plot([0 P03],[0 0],[P03 P03],[0 Q03],[0 P03],[0 Q03]);
axis([0 10000 -10000 0],'square');
title("Antes: fp = 0.9");
grid;
subplot(1, 2, 2);
plot([0 P03],[0 0],[P03 P03],[0 Q03-Q01],[0 P03],[0 Q03-Q01]);
axis([0 10000 -10000 0],'square');
title("Depois: fp = 0.7327");
grid;

%Combinação 1 e 2
S12 = S1 + S2;
P12 = real(S12);
Q12 = imag(S12);

XC12 = V^2/Q12;
C12 = 1/(2*pi*f*XC12);

figure(4)
subplot(1, 2, 1);
plot([0 P12],[0 0],[P12 P12],[0 Q12],[0 P12],[0 Q12]);
axis([0 12000 0 20000], 'square');
title("Antes: fp = 0.5257");
grid;
subplot(1, 2, 2);
plot([0 P12],[0 0],[P12 P12],[0 Q12-Q01],[0 P12],[0 Q12-Q01]);
axis([0 12000 0 20000], 'square');
title("Depois: fp = 0.6286");
grid;

%Combinação 1 e 3
S13 = S1 + S3;
P13 = real(S13);
Q13 = imag(S13);

XC13 = V^2/Q13;
C13 = 1/(2*pi*f*XC13);

figure(5)
subplot(1, 2, 1);
plot([0 P13],[0 0],[P13 P13],[0 Q13],[0 P13],[0 Q13]);
axis([0 13000 -5000 0], 'square');
title("Antes: fp = 0.9996");
grid;
subplot(1, 2, 2);
plot([0 P13],[0 0],[P13 P13],[0 Q13-Q01],[0 P13],[0 Q13-Q01]);
axis([0 13000 -5000 0], 'square');
title("Depois: fp = 0.9399");
grid;

%Combinação 2 e 3
S23 = S2 + S3;
P23 = real(S23);
Q23 = imag(S23);

XC23 = V^2/Q23;
C23 = 1/(2*pi*f*XC23);


figure(6)
subplot(1, 2, 1);
plot([0 P23],[0 0],[P23 P23],[0 Q23],[0 P23],[0 Q23]);
axis([0 20000 0 10000], 'square');
title("Antes: fp = 0.8861");
grid;
subplot(1, 2, 2);
plot([0 P23],[0 0],[P23 P23],[0 Q23-Q01],[0 P23],[0 Q23-Q01]);
axis([0 20000 0 10000], 'square');
title("Depois: fp = 0.9628");
grid;

%Combinação 1, 2 e 3
S123 = S1 + S2 + S3;
P123 = real(S123);
Q123 = imag(S123);

XC123 = V^2/Q123;
C123 = 1/(2*pi*f*XC123);

figure(7)
subplot(1, 2, 1);
plot([0 P123],[0 0],[P123 P123],[0 Q123],[0 P123],[0 Q123]);
axis([0 20000 0 14000], 'square');
title("Antes: fp = 0.8393");
grid;
subplot(1, 2, 2);
plot([0 P123],[0 0],[P123 P123],[0 Q123-Q01],[0 P123],[0 Q123-Q01]);
axis([0 20000 0 14000], 'square');
title("Depois: fp = 0.9144");
grid;