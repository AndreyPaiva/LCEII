%Informações iniciais
V = 220; %Tensão nominal
f = 60; %Frequência
I = 20; %Corrente nominal

%Defasagem entre a corrente e a tensão
atraso = 1.8355e-3; 
fase = -atraso*2*pi*f;

t = [0:(1/f)/1000:1/f];

%V e I no domínio do tempo
Vt = V*sqrt(2)*cos(2*pi*f*t);
It = I*sqrt(2)*cos(2*pi*f*t + fase);

%V e I no domínio fasorial
Vfas = V*exp(j*0);
Ifas = I*exp(j*fase);

%Triângulo das potências
S = Vfas*conj(Ifas);
P = real(S);
Q = imag(S);
Sap = abs(S);

%Alteração na potência;
S2 = S-2000;
P2 = real(S2);
Q2 = imag(S2);
Sap2 = abs(S2);

%Novos valores de I
Ifas2 = conj(S2)/Vfas;
It2 = abs(Ifas2)*sqrt(2)*cos(2*pi*f*t + fase);

%Gráficos no dominio do tempo
figure(1)
subplot(1, 2, 1)
plotyy(t, Vt, t, It)
title('Antes da mudança')
legend('Tensão', 'Corrente')
axis('square')
grid;

subplot(1, 2, 2)
plotyy(t, Vt, t, It2)
title('Depois da mudança')
legend('Tensão', 'Corrente')
axis('square')
grid;

%Gráficos no dominio fasorial 
figure(2)
subplot(1, 2, 1)
plot([0 real(Vfas)], [0 imag(Vfas)], [0 real(Ifas)*10], [0 imag(Ifas)*10])
axis([-250 250 -250 250])
axis('square')
xlabel('Real')
ylabel('Imaginário')
legend('Tensão', 'Corrente * 10')
title('Antes da mudança')
grid;

subplot(1, 2, 2)
plot([0 real(Vfas)], [0 imag(Vfas)], [0 real(Ifas2)*10], [0 imag(Ifas2)*10])
axis([-250 250 -250 250])
axis('square')
xlabel('Real')
ylabel('Imaginário')
legend('Tensão', 'Corrente * 10')
title('Depois da mudança')
grid;

%Gráficos do triângulo das potências
figure(3)
subplot(1, 2, 1)
plot([0 P], [0 0], [P P], [0 Q], [0 P], [0 Q])
xlabel('Potência ativa (W)')
ylabel('Potência reativa (VAr)')
axis('square')
title('Antes da mudança')
grid;  

subplot(1, 2, 2)
plot([0 P2], [0 0], [P2 P2], [0 Q2], [0 P2], [0 Q2])
xlabel('Potência ativa (W)')
ylabel('Potência reativa (VAr)')
axis('square')
title('Depois da mudança')
grid;   
