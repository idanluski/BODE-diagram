


f =figure('name',"Bode Homework2");

%extrac phase and Q(s) data
[phase,Q] = Q_s(w);
[phase2,Qn] = Q_s(5.5);

%finding the normalize magnitude 
magnitude = abs(Q)./abs(Qn);

%making a plot with log scale
subplot(2,1,1);
semilogx(w,20*log10(magnitude));
ylabel("dB");
xlabel("jw");
title("magnitude analyze");
subplot(2,1,2);
semilogx(w,phase);
ylabel("phase [rad]");
xlabel("w");
title("phase analyze");


function [phase,Q] = Q_s(w)
%function that calcultae phase and Q(jw) with input of w
%given parameters
b1 = 1;
b2 = 10;
p1 = -0.1;
p2 =  -300;
p3 = -100000;
a1 = 1;
%calculate magnitude in laplase
 Q = (a1.*complex(-b1,w).*complex(-b2,w))./(complex(-p1,w).*complex(-p2,w).*complex(-p3,w));
 %calculate phase
 phase =(angle(complex(-b1,w))+angle(complex(-b2,w))+angle(1./complex(-p1,w))+angle(1./complex(-p2,w))+angle(1./complex(-p3,w)))./pi;

end