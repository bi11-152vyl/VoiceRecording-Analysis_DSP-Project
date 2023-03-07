%% Make your Song
function makeSong()


fs = 50000
% Rythm
Long_Delay = rest(4,fs);     
Medium_Delay = rest(8,fs);    
Short_Delay = rest(16,fs);  

% eighth note as 0.5 sec
do = key(46,8,fs); re = key(48,8,fs);  mi = key(50,8,fs);  fa = key(52,8,fs);  so = key(53,8,fs);  la = key(55,8,fs);  si = key(57,8,fs);  
do2 = key(59,8,fs); re2 = key(61,8,fs); mi2 = key(63,8,fs); fa2 = key(64,8,fs); so2 = key(66,8,fs); la2 = key(68,8,fs); si2 = key(70,8,fs);
% quarter note as 1 sec
do_4 = key(46,4,fs);  re_4 = key(48,4,fs);  mi_4 = key(50,4,fs);  fa_4 = key(52,4,fs);  so_4 = key(53,4,fs);  la_4 = key(55,4,fs);  si_4 = key(57,4,fs);  
do2_4 = key(59,4,fs); re2_4 = key(61,4,fs); mi2_4 = key(63,4,fs); fa2_4 = key(64,4,fs); so2_4 = key(66,4,fs); la2_4 = key(68,4,fs); si2_4 = key(70,4,fs);

% make a song
line1 = [ re re mi re so mi_4];
line2 = [ re re mi re la so_4];
line3 = [ re re re2 si so fa mi_4];
line4 = [ do2 do2 si so la so_4];


Melody = [line1 line2 line3 line4];
plot(Melody)
sound(Melody,fs,24);
audiowrite('Beo Dat May Troi.wav',Melody,fs,32);

function wave = key(p, n, fs)
    t = 0:1/fs:4/n;
    idx = 440*2^((p-49)/12);
    
%     Original Song
      wave = (sin(2*pi*idx*t));

%     After Exponential Decreasing 
      tt = 4/n:-1/fs:0;
      wave = (sin(2*pi*idx*t)).*exp(tt);
      wave = wave./max(wave);
    
%     After Triangle Decreasing 
      mid = (t(1)+t(end))/2;
      tri = -(abs(t-mid)-mid);
      tri = tri./max(tri); 
      wave = (sin(2*pi*idx*t)).*tri;
    
      plot(wave)

function wave = rest(n,fs)
    t = 0:1/fs:4/n;
    tt = 4/n:-1/fs:0;
    wave = 0*sin(2*pi*t).*exp(tt);


 
    
