%script to make a square-wave carrier modulated with a sinusoidal message
fmsg=1;	%Message signal frequency. 1 Hz
fc=10;	%carrier frequency, 25 Hz
Fs=500;	%sampling frequency, 500 Hz
t=[0:1/Fs:3/fmsg]; % Time duaration defined
 
%To make the amplitude vector in the same size as the duration of t
Amsg=1*ones(size(t));
Ac=5*ones(size(t));
 
 
%The message signal
x=Amsg.*square(2*pi*fmsg*t);
subplot(3,1,1); plot(t,x); title('Message');axis([0 3 0 1.5]);xlabel('time(s)');ylabel('amplitude(V)');
 
%The carrier signal
y=Ac+Ac.*square(2*pi*fc*t);
y=y/2;
subplot(3,1,2);plot(t,y); title('Carrier');axis([0 3 0 5.5]);xlabel('time(s)');ylabel('amplitude(V)');
 
%steps for FSK modulation
x_modulating=x./max(x); %unit normalized modulating signal
fdev=fc/1.5; %frequency deviation limited to a maximum of 2/3 deviation from the carrier frequency
z =Ac+Ac.* square (2*pi*fc*t + 2*pi*fdev*(cumsum(x_modulating)/Fs));%Generating FM signal
z=z/2;
subplot(3,1,3);plot(t,z);title('BFSK');axis([0 3 0 5.5]);xlabel('time(s)');ylabel('amplitude(V)');
 
print('bfskwaves.png');
