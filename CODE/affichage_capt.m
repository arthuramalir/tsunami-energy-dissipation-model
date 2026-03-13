pkg load io
 B=xlsread('C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\COURBES\\CourbesEXPERIMENTALES\\essai9cyl.xlsx',1);
 C=xlsread('C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\COURBES\\CourbesEXPERIMENTALES\\essai9cyl.xlsx',4);
 E=xlsread('C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\COURBES\\CourbesEXPERIMENTALES\\essai9cyl.xlsx',3);
 D=xlsread('C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\COURBES\\CourbesEXPERIMENTALES\\essai9cyl.xlsx',2);

data = load('C:\\Users\\ARTHUR AMALIR\\OneDrive\\Documents\\2A\\projet recherche\\COURBES\\CourbesMATLAB\\C2_cas_9cyl.txt');
% load('gages_9_gages_L_9m_init_2_boussi.mat');
t = data(:, 1);  % Assuming column 1 is time

 ttt=0:0.01:3699*0.01;
for i=1:3700
    if C(i,16)<1000
    else
        C(i,16)=0;
    end
end

 figure;plot(ttt-(3.17-0.3846-0.25),C(:,16))
 hold on;plot(t,(c(:,3)+c(:,4))/2*100)

 figure;plot(ttt-(3.17-0.3846-0.25),B(:,17))
 hold on;plot(t,(c(:,9)+0.1)*100)

 figure;plot(ttt-(3.17-0.3846-0.25),E(:,1)+0.8)
 hold on;plot(t,(c(:,7)+0.1)*100)

 figure;plot(ttt-(3.17-0.3846-0.25),D(:,16)+0.8)
 hold on;plot(t,(c(:,6)+0.1)*100)

 %Essais 16 cyl
 B=xlsread('essai16cyl.xlsx',1);
 C=xlsread('essai16cyl.xlsx',4);
 E=xlsread('essai16cyl.xlsx',3);
 D=xlsread('essai16cyl.xlsx',2);

load('gages_16_gages_L_9m_init_2_bis.mat');

 ttt=0:0.01:5099*0.01;
for i=1:3700
    if C(i,28)<1000
    else
        C(i,28)=0;
    end
end
figure;plot(ttt-(3.17-0.3846-0.1),C(:,28))
hold on;plot(t,(c(:,3)+c(:,4))/2*100)

 figure;plot(ttt-(3.17-0.3846-0.1),B(:,19)+0.5)
 hold on;plot(t,(c(:,9)+0.1)*100)

 figure;plot(ttt-(3.17-0.3846-0.1),E(:,3)+0.6)
 hold on;plot(t,(c(:,7)+0.1)*100)

  figure;plot(ttt-(3.17-0.3846-0.1),D(:,3)+0.7)
 hold on;plot(t,(c(:,6)+0.1)*100)

 %Essais 0 cyl
 B=xlsread('essai0cyl.xlsx',1);
 C=xlsread('essai0cyl.xlsx',4);
 E=xlsread('essai0cyl.xlsx',3);

 load('gages_0_gages_L_9m_init_2_bis.mat');

 ttt=0:0.01:7799*0.01;
for i=1:7799
    if C(i,19)<1000
    else
        C(i,19)=0;
    end
end
figure;plot(ttt-(3.17-0.3846+0.6),C(:,19))
hold on;plot(t,(c(:,3)+c(:,4))/2*100)

figure;plot(ttt-(3.17-0.3846+0.6),B(:,19)+0.5)
hold on;plot(t,(c(:,9)+0.1)*100)