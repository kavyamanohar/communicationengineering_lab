%script to make a square-wave carrier modulated with a sinusoidal message
fmsg1=1;	%Message signal frequency. 1 Hz
fc=5;	%carrier frequency, 25 Hz
Fs=500;	%sampling frequency, 500 Hz
t=[0:1/Fs:3/fmsg]; % Time duaration defined
 
%To make the amplitude vector in the same size as the duration of t
Amsg=1*ones(size(t));
Ac=1*ones(size(t));
 
 %The message signal
 x1 = 2*Amsg.*sin(2*pi*fmsg1*t);
 subplot(4,1,1); plot(t,x1); title('Message 1');xlabel('time(s)');ylabel('amplitude(V)');
 x2 = Amsg.*sawtooth (2*pi*fmsg1*t,0.5);
subplot(4,1,2);plot(t,x2); title('Message 2');axis([0,3, -2,2]);xlabel('time(s)');ylabel('amplitude(V)');

 %The carrier signal
y=Ac.*square(2*pi*fc*t);
y1 = Ac+y;
y1=y1/2;
y2 = y - Ac;
y2=y2/2;
subplot(4,1,3);plot(t,y1); title('Carrier');xlabel('time(s)');ylabel('amplitude(V)');
%subplot(4,1,3);plot(t,y2); title('Carrier2');xlabel('time(s)');ylabel('amplitude(V)');

%tdmawaves

z1 = y1.*x1;
z2 = -(y2 .* x2);
z= z1+ z2;
subplot(4,1,4);plot(t,z); title('TDMA');xlabel('time(s)');ylabel('amplitude(V)');

print('tdmawaves.png');
