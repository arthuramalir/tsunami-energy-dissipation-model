% close all
clear all
%clear
%% Paramètres entrés par l'utilisateur

Lx=9;%0.15;
Ly=0.41;
prompt = "Diamètre des N GBR (en m) ? "
D=input(prompt);
% D=0.04;
prompt = "Nombre de cylindres en x (num_x= 3 / num_x= 4 / num_x= 5 / num_x= 6)  ?"
num_x = input(prompt);
prompt = "Nombre de cylindres en y (num_y= 3 / num_y= 4 / num_y= 5 / num_y= 6)  ?"
num_y = input(prompt);
N=num_x*num_y;
DD=zeros(1,num_x*num_y)+D;
X=(Ly-num_x*D)/(num_x+1);
R=DD/2;

% input parameters reseau structuré
k=0;
for i=1:num_x
    for j=1:num_y
        k=k+1;
        xx(k)=5.8+X+D/2+(X+D)*(i-1);
        yy(k)=X+D/2+(X+D)*(j-1);
    end
end
DD=zeros(1,k)+D;

% %input parameters reseau non structuré
% N1=6;%taille 30 mm
% D1=0.03;
% N2=12;%taille 20 mm
% D2=0.02;
% N3=30;%taille 10 mm
% D3=0.01;
% N4=84;%taille 5 mm
% D4=0.005;
% xx=zeros(1,6);
% yy=zeros(1,6);
% DD=zeros(1,6);
% for i=1:N1
%     i
%     if i==1
%         xx(i)=0.2+D1/2+rand*(0.102-D1/2);
%         yy(i)=0.01+D1/2+rand*(Ly-2*0.01-2*D1/2);
%         DD(i)=D1;
%     else
%         var=0;
%         while var==0
%             temp=1;
%             xx(i)=0.2+D1/2+rand*(0.102-D1/2);
%             yy(i)=0.01+D1/2+rand*(Ly-2*0.01-2*D1/2);
%             DD(i)=D1;
%             for j=1:i-1
%                 len=sqrt((xx(i)-xx(j))^2+(yy(i)-yy(j))^2);
%                 if len<=D1+0.0025
%                     temp=0;
%                 else
%                     var=1;
%                 end
%             end
%             var=var*temp;
%         end
%     end
% end
% for i=N1+1:N1+N2
%     i
%     var=0;
%     while var==0
%         temp=1;
%         xx(i)=0.2+D2/2+rand*(0.102-D2/2);
%         yy(i)=0.01+D2/2+rand*(Ly-2*0.01-2*D2/2);
%         DD(i)=D2;
%         for j=1:N1%i-1
%             len=sqrt((xx(i)-xx(j))^2+(yy(i)-yy(j))^2);
%             if len<=(D1+D2)/2+0.0025
%                 temp=0;
%             else
%                 var=1;
%             end
%         end
%         for j=N1+1:i-1
%             len=sqrt((xx(i)-xx(j))^2+(yy(i)-yy(j))^2);
%             if len<=D2+0.0025
%                 temp=0;
%             else
%                 var=1;
%             end
%         end
%         var=var*temp;
%     end
% end
% for i=N1+N2+1:N1+N2+N3
%     i
%     var=0;
%     while var==0
%         temp=1;
%         xx(i)=0.2+D3/2+rand*(0.102-D3/2);
%         yy(i)=0.01+D3/2+rand*(Ly-2*0.01-2*D3/2);
%         DD(i)=D3;
%         for j=1:N1%i-1
%             len=sqrt((xx(i)-xx(j))^2+(yy(i)-yy(j))^2);
%             if len<=(D1+D3)/2+0.0025
%                 temp=0;
%             else
%                 var=1;
%             end
%         end
%         for j=N1+1:N1+N2%i-1
%             len=sqrt((xx(i)-xx(j))^2+(yy(i)-yy(j))^2);
%             if len<=(D2+D3)/2+0.0025
%                 temp=0;
%             else
%                 var=1;
%             end
%         end
%         for j=N1+N2+1:i-1
%             len=sqrt((xx(i)-xx(j))^2+(yy(i)-yy(j))^2);
%             if len<=D3+0.0025
%                 temp=0;
%             else
%                 var=1;
%             end
%         end
%         var=var*temp;
%     end
% end
% for i=N1+N2+N3+1:N1+N2+N3+N4
%     i
%     var=0;
%     while var==0
%         temp=1;
%         xx(i)=0.2+D4/2+rand*(0.102-D4/2);
%         yy(i)=0.01+D4/2+rand*(Ly-2*0.01-2*D4/2);
%         DD(i)=D4;
%         for j=1:N1%i-1
%             len=sqrt((xx(i)-xx(j))^2+(yy(i)-yy(j))^2);
%             if len<=(D1+D4)/2+0.0025
%                 temp=0;
%             else
%                 var=1;
%             end
%         end
%         for j=N1+1:N1+N2%i-1
%             len=sqrt((xx(i)-xx(j))^2+(yy(i)-yy(j))^2);
%             if len<=(D2+D4)/2+0.0025
%                 temp=0;
%             else
%                 var=1;
%             end
%         end
%         for j=N1+N2+1:N1+N2+N3%i-1
%             len=sqrt((xx(i)-xx(j))^2+(yy(i)-yy(j))^2);
%             if len<=(D3+D4)/2+0.0025
%                 temp=0;
%             else
%                 var=1;
%             end
%         end
%         for j=N1+N2+N3+1:i-1
%             len=sqrt((xx(i)-xx(j))^2+(yy(i)-yy(j))^2);
%             if len<=D4+0.0025
%                 temp=0;
%             else
%                 var=1;
%             end
%         end
%         var=var*temp;
%     end
% end

% %Paramétrage différence de hauteur d'eau entre l'amont et l'aval du canal
% prompt = "Quelle différence de hauteur d'eau (rupture de barrage) ? (1=2mm / 2=4mm / 3=6mm)"
% deltah = input(prompt);
% 
% if deltah == 1
%     deltahe = 0.002;%0.05
% elseif deltah == 2 
%     deltahe = 0.004;
% elseif deltah == 3
%     deltahe = 0.006;
% end

%Paramétrage de la résolution de la maille de calcul 
prompt = "Quelle résolution ? (6= 6*6mm / 5=5*5mm / 4=4*4mm / 8=8x8mm)"
res = input(prompt);

if  res == 8
    dx = 0.008;
    dy = 0.008;
elseif res == 6
    dx = 0.006;
    dy = 0.006;
elseif res == 5
    dx = 0.005;
    dy = 0.005;
elseif res == 4
    dx = 0.004;
    dy = 0.004;
end
%d=130;%d=78
%d=203;% ne fonctionne qu'en ajustant la largeur du canal

% %Paramétrage de la configuration des pâtés
% prompt = "Nombre d'éléments ?"
% N = input(prompt);

%Paramétrage des coordonnées des GBR
prompt = "Coordonnées x des N GBR ? Donner le vecteur sous la forme [0.01 0.02 0.03 ...] : "
a=input(prompt);
prompt = "Coordonnées y des N GBR ? Donner le vecteur sous la forme [0.01 0.02 0.03 ...] : "
b=input(prompt);


SUR = 0.01;

%% 
% SY=101;%SY=408*2 %(pour un dx=32cm);              %Définition de la liste des ordonnées (41 cm)
% SX=500;            %Définition de la liste des abscisses (1300 cm = 13m)
% dx=0.001;            %Définition du pas d'abscisse 
% dy=0.001;            %Définition du pas d'ordonnée
x=0:dx:Lx; %Définition de x, une liste qui va de 0 à (SX-1)*0.01 avec un pas de dx
y=0:dy:Ly; %Définition de y, une liste qui va de 0 à (SY-1)*0.01 avec un pas de dy
SX=floor(Lx/dx+1);
SY=floor(Ly/dy+1);
ghost=0;
if ghost==1
    bathy=zeros(SY,round(SX*4/3));  %Initialisation de la bathymétrie (profondeurs) une matrice de zéros de taille (SY,SX)
    u0=zeros(SY,round(SX*4/3)+1);   %Définition de u0, une matrice de zéros de taille (SY,SX+1) (initialisation de la vitesse selon x)
    v0=zeros(SY+1,round(SX*4/3));   %Définition de v0, une matrice de zéros de taille (SY+1,SX) (initialisation de la vitesse selon y)
else
    bathy=zeros(SY,SX);  %Initialisation de la bathymétrie (profondeurs) une matrice de zéros de taille (SY,SX)
    u0=zeros(SY,SX+1);   %Définition de u0, une matrice de zéros de taille (SY,SX+1) (initialisation de la vitesse selon x)
    v0=zeros(SY+1,SX); 
end
deltahe=0.1025;%0.1035 pour Hamont = 0.15
hr=0.149-deltahe;
bathy(:,:)=hr;%0.005;     %Initialisation des valeurs de bathymétrie à 0.17 : la profondeur du canal avant butte, avant perturbation. La bathy sera comptée négativement
%m=0.0018*5/6;%res5
if dx==0.008
    m=0.0018*4/3;%res8
elseif dx==0.006
    m=0.0018;%res6
end


% theta=atan(m/dx);
Mtheta=zeros(SY, SX);
for i=1:SY
    if dx==0.008
        bathy(i,SX-floor(3/4*276)+1:SX)=hr-m*[1:floor(3/4*276)];%res8
    elseif dx==0.006
        bathy(i,SX-276+1:SX)=hr-m*[1:276];%res6
    end
    %Mtheta(i,SX-250+1:SX)=theta*ones(250,1);
    % bathy(i,1001:SX)=hr-0.01*[1:251];
end



%Définition de etat0, une matrice de zéros de taille (SY,SX) (qui contiendra les infos sur la vague)

valeur=-1;%0.002
if ghost==1
    ind=zeros(SY,round(SX*4/3));
    ind_bis=zeros(SY,round(SX*4/3),N);
    bathy_bis=zeros(SY,round(SX*4/3),N);
else
    ind=zeros(SY,SX);
    ind_bis=zeros(SY,SX,N);
    bathy_bis=zeros(SY,SX,N);
end
for k=1:N
    for i=1:SY
        for j=1:SX
            if sqrt((x(j)-a(k))^2+(y(i)-b(k))^2)<R(k)
                bathy(i,j)=valeur;
                bathy_bis(i,j,k)=valeur;
                ind(i,j)=1;
                ind_bis(i,j,k)=1;
            end
        end
    end
end
if ghost==1
    BC=zeros(SY,round(SX*4/3));
    BCu=zeros(SY,round(SX*4/3)+1);
    BCv=zeros(SY+1,round(SX*4/3));
    BC_bis=zeros(SY,round(SX*4/3),N);
    BCu_bis=zeros(SY,round(SX*4/3)+1,N);
    BCv_bis=zeros(SY+1,round(SX*4/3),N);
    norm_x=zeros(SY,round(SX*4/3),N);
    norm_y=zeros(SY,round(SX*4/3),N);
    theta=zeros(SY,round(SX*4/3),N);
else
    BC=zeros(SY,SX);
    BCu=zeros(SY,SX+1);
    BCv=zeros(SY+1,SX);
    BC_bis=zeros(SY,SX,N);
    BCu_bis=zeros(SY,SX+1,N);
    BCv_bis=zeros(SY+1,SX,N);
    norm_x=zeros(SY,SX,N);
    norm_y=zeros(SY,SX,N);
    theta=zeros(SY,SX,N);
end
for k=1:N
    for i=2:SY-1
        for j=2:SX-1
            if (bathy_bis(i+1,j,k)==valeur || bathy_bis(i,j+1,k)==valeur || bathy_bis(i-1,j,k)==valeur || bathy_bis(i,j-1,k)==valeur) && ind_bis(i,j,k)==0 && (abs(x(j)-a(k))<(R(k)+2*dx)) && (abs(y(i)-b(k))<(R(k)+2*dy))
                BC(i,j)=1;
                BC_bis(i,j,k)=1;
%                 norm_x(i,j,k)=(x(j)-a(k))/sqrt((x(j)-a(k))^2+(y(i)-b(k))^2);
%                 norm_y(i,j,k)=(y(i)-b(k))/sqrt((x(j)-a(k))^2+(y(i)-b(k))^2);
%                 if y(i)<b(k)
%                     theta(i,j,k)=-acos(norm_x(i,j,k));
%                 else
%                     theta(i,j,k)=acos(norm_x(i,j,k));
%                 end
                test=0;
                if bathy(i+1,j)==valeur && bathy(i,j+1)==valeur && test==0
                    BCv(i+1,j)=1;
                    BCv_bis(i+1,j,k)=1;
                    BCu(i,j+1)=1;
                    BCu_bis(i,j+1,k)=1;
                    theta(i,j,k)=3*pi/4;
                    test=1;
                elseif bathy(i+1,j)==valeur && bathy(i,j-1)==valeur && test==0
                    BCv(i+1,j)=1;
                    BCv_bis(i+1,j,k)=1;
                    BCu(i,j)=1;
                    BCu_bis(i,j,k)=1;
                    theta(i,j,k)=pi/4;
                    test=1;
                elseif bathy(i+1,j)==valeur && test==0
                    BCv(i+1,j)=1;
                    BCv_bis(i+1,j,k)=1;
                    theta(i,j,k)=pi/2;
                    test=1;
                elseif bathy(i-1,j)==valeur && bathy(i,j+1)==valeur && test==0
                    BCv(i,j)=1;
                    BCv_bis(i,j,k)=1;
                    BCu(i,j+1)=1;
                    BCu_bis(i,j+1,k)=1;
                    theta(i,j,k)=-3*pi/4;
                    test=1;
                elseif bathy(i-1,j)==valeur && bathy(i,j-1)==valeur && test==0
                    BCv(i,j)=1;
                    BCv_bis(i,j,k)=1;
                    BCu(i,j)=1;
                    BCu_bis(i,j,k)=1;
                    theta(i,j,k)=-pi/4;
                    test=1;
                elseif bathy(i-1,j)==valeur && test==0
                    BCv(i,j)=1;
                    BCv_bis(i,j,k)=1;
                    theta(i,j,k)=-pi/2;
                    test=1;
                elseif bathy(i,j+1)==valeur && test==0
                    BCu(i,j+1)=1;
                    BCu_bis(i,j+1,k)=1;
                    theta(i,j,k)=pi;
                    test=1;
                elseif bathy(i,j-1)==valeur && test==0
                    BCu(i,j)=1;
                    BCu_bis(i,j,k)=1;
                    theta(i,j,k)=0;
                    test=1;
                end
            end
        end
    end
end


% SYb=round(SY/d);             
% SXb=round(SX/d);
% dxb=0.001*d;            %Définition du pas d'abscisse
% dyb=0.001*d;            %Définition du pas d'ordonnée
% xb=0:dx*d:(SXb-1)*0.001*d; %Définition de x, une liste qui va de 0 à (SX-1)*0.01 avec un pas de dx
% yb=0:dy*d:(SYb-1)*0.001*d;
% bathyb=zeros(SYb,SXb);
SYb=SY;
SXb=SX;
dxb=dx;
dyb=dy;
xb=x;
yb=y;
bathyb=bathy;
ghost=0;
if ghost==1
    etat0=zeros(SYb,round(SXb*4/3));  %Définition de etat0, une matrice de zéros de taille (SY,SX) (qui contiendra les infos sur la vague)
    %etat0b=zeros(SYb,SXb);
    etat0b=zeros(SYb,round(SXb*4/3));
else
    etat0=zeros(SYb,SXb);
    etat0b=zeros(SYb,SXb);
end

% for i=1:SXb
%     for j=1:SYb
%         bathyb(j,i)=mean(mean(bathy((j-1)*d+1:j*d,(i-1)*d+1:i*d)));
%     end
% end

figure;imagesc(xb,yb,-bathyb(:,1:SXb))         
axis equal         
xlabel('x (in m)')                                          %On place les titres des axes                        
ylabel('y (in m)')
zlabel('z (in m)')
colorbar


%affichage de la légende de l'échelle de couleur

%Etat initial de la vague                                   %Etat initial de la vague
init=4;
etat0(:,1:round(init/dx))=deltahe;                                       %hauteur de la vague (5cm sur les 4 premiers mètres du canal) et sur toute la largeur

dt=dxb/(4*sqrt(10*max(max(etat0+bathyb))));                    %dt obtenu en respectant la condition de convergence pour la méthode ???

T=9;%2;%2000*dt;                                                      %La durée de l'expérience (10 s)
t=0:dt:T;                                                   %Construction d'une liste de temps t de 0 à T avec un pas dt
[r,s]=size(t);                                              %permet d'obtenir s, la taille de la liste des temps t, utile pour la suite
dtout=0.2;
tout=0:dtout:T;
[rr,ss]=size(tout);

% prompt = "Coordonnées x des N GBR ? Donner le vecteur sous la forme [0.01 0.02 0.03 ...] : "
% a=input(prompt);

c=zeros(s,10);
c_u=zeros(s,10);
c_v=zeros(s,10);
%X1=510;
%Y1=380;
if dx==0.008
    Y=[25 25 25 25 25 25 25 25 25 25];%res8
    if init==2
        XX=[SX-176 SX-163 SX-143 SX-142 SX-149 676 826 199 307 1];%res8_init_2
    elseif init==4
        XX=[SX-176 SX-163 SX-143 SX-142 SX-149 676 826 448 561 706];%res8_init_4
    end
elseif dx==0.006
    Y=[floor(25*4/3) floor(25*4/3) floor(25*4/3) floor(25*4/3) floor(25*4/3) floor(25*4/3) floor(25*4/3) floor(25*4/3) floor(25*4/3) floor(25*4/3)];%res6
    if init==2
        XX=[floor((SX-176*4/3)) floor((SX-163*4/3))+1 floor((SX-143*4/3)) floor((SX-142*4/3))+1 floor((SX-149*4/3)) floor(676*4/3) floor(826*4/3) floor(199*4/3) floor(307*4/3) floor(1*4/3)];%res6_init_2
    elseif init==4
        XX=[floor((SX-176*4/3)) floor((SX-163*4/3))+1 floor((SX-143*4/3)) floor((SX-142*4/3))+1 floor((SX-149*4/3)) floor(676*4/3) floor(826*4/3) floor(448*4/3) floor(561*4/3) floor(706*4/3)];%res6_init_4
    end
end
%C6 : (c(:,3)+c(:,4))/2
%C4 : c(:,7)
%C3 : c(:,6)
%C2 : c(:,9)
%Vectrino : c(:,10)

%Y=[floor(25*8/5) floor(25*8/5) floor(25*8/5) floor(25*8/5) floor(25*8/5) floor(25*8/5) floor(25*8/5) floor(25*8/5) floor(25*8/5)];%res5
% XX=[1015 1018 1021 1024];%res2


%XX=[floor((SX-176*8/5)) floor((SX-163*8/5)) floor((SX-151*8/5)) floor((SX-126*8/5)) floor((SX-101*8/5)) floor(676*8/5) floor(826*8/5) floor(201*8/5) floor(301*8/5)];%res5_init_2
% Y=[95 95 95 95 95 95];%res2
% XX=[75 100 125 150 175 200];%res2

if ghost==1
    etat=zeros(SYb,round(SXb*4/3));                             %On définit la liste de matrices 2D "etat" qui contiennent la hauteur de la vague en fonction de x et y; pour chaque temps (état s). Cette liste de matrices est initialisée à 0.
    etat(:,:)=etat0;                                         %On injecte la hauteur initiale de la vague "etat0" comme 1ère matrice de la liste.
    etatout=zeros(SYb,round(SXb*4/3),ss);
    uout=zeros(SYb,round(SXb*4/3)+1,ss);
    vout=zeros(SYb+1,round(SXb*4/3),ss);
    u=zeros(SYb,round(SXb*4/3)+1);                              %préparation d'une matrice de vitesses selon x à chauqe instant s
    v=zeros(SYb+1,round(SXb*4/3));                              %préparation d'une matrice de vitesses selon y à chaque instant s
else
    etat=zeros(SYb,SXb);                             %On définit la liste de matrices 2D "etat" qui contiennent la hauteur de la vague en fonction de x et y; pour chaque temps (état s). Cette liste de matrices est initialisée à 0.
    etat(:,:)=etat0;                                         %On injecte la hauteur initiale de la vague "etat0" comme 1ère matrice de la liste.
    etatout=zeros(SYb,SXb,ss);
    uout=zeros(SYb,SXb+1,ss);
    vout=zeros(SYb+1,SXb,ss);
    u=zeros(SYb,SXb+1);                              %préparation d'une matrice de vitesses selon x à chauqe instant s
    v=zeros(SYb+1,SXb);
end

%coeff manning n                                            %Coefficient de Manning, fixé ici arbitrairement par l'utilisateur (pour affinage)
n=0.01;
ifrict=0;

RK2=0;%0 pour explicite et 1 pour RK2
if ghost==1
    etat_temp=zeros(SYb,round(SXb*4/3));
    u_temp=zeros(SYb,round(SXb*4/3)+1);
    %u_temp(:,round(init/dx))=sqrt(2*9.81*etat(:,round(init/dx)));
    v_temp=zeros(SYb+1,round(SXb*4/3));
    sigma=zeros(SYb,round(SXb*4/3))+1;
    sigma_u=zeros(SYb,round(SXb*4/3)+1)+1;
    sigma_v=zeros(SYb+1,round(SXb*4/3))+1;
else
    etat_temp=zeros(SYb,SXb);
    u_temp=zeros(SYb,SXb+1);
    %u_temp(:,round(init/dx))=sqrt(2*9.81*etat(:,round(init/dx)));
    v_temp=zeros(SYb+1,SXb);
    sigma=zeros(SYb,SXb)+1;
    sigma_u=zeros(SYb,SXb+1)+1;
    sigma_v=zeros(SYb+1,SXb)+1;
end
if ghost==1
    for i=1:SYb
        sigma(i,SXb+1:round(SXb*4/3))=1-(sin(3.14*[1:round(SXb*4/3)-SXb]/2/(round(SXb*4/3)-SXb))).^2;
        sigma_u(i,SXb+2:round(SXb*4/3)+1)=1-(sin(3.14*[1:round(SXb*4/3)-SXb]/2/(round(SXb*4/3)-SXb))).^2;
    end
    for i=1:SYb+1
        sigma_v(i,SXb+1:round(SXb*4/3))=1-(sin(3.14*[1:round(SXb*4/3)-SXb]/2/(round(SXb*4/3)-SXb))).^2;
    end
end

h=zeros(SYb,SXb);
f=zeros(SYb,SXb+1);
g=zeros(SYb+1,SXb);
if ghost==1
    if RK2==1
        h=zeros(SYb,round(SXb*4/3));
        f=zeros(SYb,round(SXb*4/3)+1);
        g=zeros(SYb+1,round(SXb*4/3));
    end
else
    if RK2==1
        h=zeros(SYb,SXb);
        f=zeros(SYb,SXb+1);
        g=zeros(SYb+1,SXb);
    end
end

%Si on a une porte qui s'ouvre
ouv_porte=0;%utilisation ouverture porte
X=3.98;
t_ouv=0.75;
Hf=0.2;
H=Hf/t_ouv*t;
mu=0.025;
[tt,ind_porte]=find(xb==X);
[tt,ind_fin_ouverture]=find(t>t_ouv-0.00165 & t<t_ouv+0.00165);

%inondation
epsu=0.00001;
epsh=0.0001;
EPSHD=0.0000001;
% close all
bathyb_bis=bathyb;
for j=1:SYb
    for k=1:SXb
       if bathyb_bis(j,k)<0
           bathyb_bis(j,k)=0;
       end
    end
end

% load("ETAT_BOUSSI_T_2_5s_dx_8mm.mat");
% load("U_BOUSSI_T_2_5s_dx_8mm.mat");
% u=U;
% etat=ETAT;

for i=2:s
% for i=1769:s
     %i
%     if i==2
%         MM=mean(mean(etat(1:SYb,1200:1400)));
%     end
    if RK2==0
        etat_temp=etat;
        u_temp=u;
        v_temp=v;
        for j=2:SYb-1
            for k=2:SXb-1
                test(j,k)=0;
                if ind(j,k)==1 || BC(j,k)==1
                else
                    %if bathyb(j,k)>0
                    if (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))))*sigma(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j+1,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k+1)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j+1,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k+1)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))))*sigma(j,k);
                    end
                    %else
                        %if (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        %    etat(j,k)=etat_temp(j,k)-dt/dxb*((etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((etat_temp(j,k))-(etat_temp(j,k-1))))*sigma(j,k)-dt/dyb*((etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((etat_temp(j,k))-(etat_temp(j-1,k))))*sigma(j,k);
                        %elseif (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        %    etat(j,k)=etat_temp(j,k)-dt/dxb*((etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((etat_temp(j,k))-(etat_temp(j,k-1))))*sigma(j,k)-dt/dyb*((etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j+1,k)*((etat_temp(j+1,k))-(etat_temp(j,k))))*sigma(j,k);
                        %elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        %    etat(j,k)=etat_temp(j,k)-dt/dxb*((etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k+1)*((etat_temp(j,k+1))-(etat_temp(j,k))))*sigma(j,k)-dt/dyb*((etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j+1,k)*((etat_temp(j+1,k))-(etat_temp(j,k))))*sigma(j,k);
                        %elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        %    etat(j,k)=etat_temp(j,k)-dt/dxb*((etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k+1)*((etat_temp(j,k+1))-(etat_temp(j,k))))*sigma(j,k)-dt/dyb*((etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((etat_temp(j,k))-(etat_temp(j-1,k))))*sigma(j,k);
                        %end
                    etat_temp_b=etat;
                    if bathyb(j,k)<0 
                        if etat(j,k)<0
                            var=abs(etat_temp_b(j,k));
                            etat(j,k)=0;
%                             if (u_temp(j,k)+u_temp(j,k+1))/2>=0
%                                 etat(j,k-1)=etat_temp_b(j,k-1)-var;
%                                 if etat(j,k-1)<0
%                                    etat(j,k-1)=0;
%                                 end
%                             else
%                                 etat(j,k+1)=etat_temp_b(j,k+1)-var;
%                                 if etat(j,k+1)<0
%                                     etat(j,k+1)=0;
%                                 end
%                             end
                            if (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                                tot=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))))+dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))));
                                totx=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))));
                                toty=dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))));
                                etat(j,k-1)=etat_temp_b(j,k-1)-var*totx/tot;
                                if etat(j,k-1)<0
                                    etat(j,k-1)=0;
                                end
                                etat(j-1,k)=etat_temp_b(j-1,k)-var*toty/tot;
                                if etat(j-1,k)<0
                                    etat(j-1,k)=0;
                                end
                            elseif (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                                tot=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))))+dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j+1,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))));
                                totx=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))));
                                toty=dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j+1,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))));
                                etat(j,k-1)=etat_temp_b(j,k-1)-var*totx/tot;
                                if etat(j,k-1)<0
                                    etat(j,k-1)=0;
                                end
                                etat(j+1,k)=etat_temp_b(j+1,k)-var*toty/tot;
                                if etat(j+1,k)<0
                                    etat(j+1,k)=0;
                                end
                            elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                                tot=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k+1)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))))+dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j+1,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))));
                                totx=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k+1)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))));
                                toty=dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j+1,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))));
                                etat(j,k+1)=etat_temp_b(j,k+1)-var*totx/tot;
                                if etat(j,k+1)<0
                                    etat(j,k+1)=0;
                                end
                                etat(j+1,k)=etat_temp_b(j+1,k)-var*toty/tot;
                                if etat(j+1,k)<0
                                    etat(j+1,k)=0;
                                end
                            elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                                tot=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k+1)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))))+dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))));
                                totx=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k+1)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))));
                                toty=dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))));
                                etat(j,k+1)=etat_temp_b(j,k+1)-var*totx/tot;
                                if etat(j,k+1)<0
                                    etat(j,k+1)=0;
                                end
                                etat(j-1,k)=etat_temp_b(j-1,k)-var*toty/tot;
                                if etat(j-1,k)<0
                                    etat(j-1,k)=0;
                                end
                            end
                        end
                    else
                        if etat(j,k)<-bathyb(j,k)
                            var=abs(etat_temp_b(j,k)-bathyb(j,k));
                            etat(j,k)=-bathyb(j,k);
%                             if (u_temp(j,k)+u_temp(j,k+1))/2>=0
%                                 etat(j,k-1)=etat_temp_b(j,k-1)-var;
%                                 if etat(j,k-1)<-bathyb_bis(j,k-1)
%                                     etat(j,k-1)=-bathyb_bis(j,k-1);
%                                 end
%                             else
%                                 etat(j,k+1)=etat_temp_b(j,k+1)-var;
%                                 if etat(j,k+1)<-bathyb_bis(j,k+1)
%                                     etat(j,k+1)=-bathyb_bis(j,k+1);
%                                 end
%                             end
                            if (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                                tot=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))))+dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))));
                                totx=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))));
                                toty=dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))));
                                etat(j,k-1)=etat_temp_b(j,k-1)-var*totx/tot;
                                if etat(j,k-1)<-bathyb_bis(j,k-1)
                                    etat(j,k-1)=-bathyb_bis(j,k-1);
                                end
                                etat(j-1,k)=etat_temp_b(j-1,k)-var*toty/tot;
                                if etat(j-1,k)<-bathyb_bis(j-1,k)
                                    etat(j-1,k)=-bathyb_bis(j-1,k);
                                end
                            elseif (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                                tot=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))))+dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j+1,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))));
                                totx=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))));
                                toty=dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j+1,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))));
                                etat(j,k-1)=etat_temp_b(j,k-1)-var*totx/tot;
                                if etat(j,k-1)<-bathyb_bis(j,k-1)
                                    etat(j,k-1)=-bathyb_bis(j,k-1);
                                end
                                etat(j+1,k)=etat_temp_b(j+1,k)-var*toty/tot;
                                if etat(j+1,k)<-bathyb_bis(j+1,k)
                                    etat(j+1,k)=-bathyb_bis(j+1,k);
                                end
                            elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                                tot=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k+1)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))))+dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j+1,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))));
                                totx=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k+1)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))));
                                toty=dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j+1,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))));
                                etat(j,k+1)=etat_temp_b(j,k+1)-var*totx/tot;
                                if etat(j,k+1)<-bathyb_bis(j,k+1)
                                    etat(j,k+1)=-bathyb_bis(j,k+1);
                                end
                                etat(j+1,k)=etat_temp_b(j+1,k)-var*toty/tot;
                                if etat(j+1,k)<-bathyb_bis(j+1,k)
                                    etat(j+1,k)=-bathyb_bis(j+1,k);
                                end
                            elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                                tot=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k+1)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))))+dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))));
                                totx=dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k+1)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))));
                                toty=dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))));
                                etat(j,k+1)=etat_temp_b(j,k+1)-var*totx/tot;
                                if etat(j,k+1)<-bathyb_bis(j,k+1)
                                    etat(j,k+1)=-bathyb_bis(j,k+1);
                                end
                                etat(j-1,k)=etat_temp_b(j-1,k)-var*toty/tot;
                                if etat(j-1,k)<-bathyb_bis(j-1,k)
                                    etat(j-1,k)=-bathyb_bis(j-1,k);
                                end
                            end
                            %if etat(j,k)>abs(bathyb(j,k)-bathyb(j,k-1))
                            %    test(j,k)=1;
                        end
                    end
                end
            end
        end
        etat(:,1)=etat(:,2);
        etat(:,SXb)=etat(:,SXb-1);
        etat(1,:)=etat(2,:);
        etat(SYb,:)=etat(SYb-1,:);
        etat(1,1)=etat(1,2);
        etat(SYb,1)=etat(SYb,2);
        etat(1,SXb)=etat(1,SXb-1);
        etat(SYb,SXb)=etat(SYb,SXb-1);
%         for j=2:SYb-1
%             for k=2:SXb-1
%                 for l=1:N
%                     if BC_bis(j,k,l)==1 && theta(j,k,l)==pi
%                         etat(j,k)=etat(j,k-1); 
%                     elseif BC_bis(j,k,l)==1 && theta(j,k,l)==3*pi/4
%                         etat(j,k)=etat(j,k-1);
%                     elseif BC_bis(j,k,l)==1 && theta(j,k,l)==pi/2
%                         etat(j,k)=etat(j-1,k);
%                     elseif BC_bis(j,k,l)==1 && theta(j,k,l)==pi/4
%                         etat(j,k)=etat(j,k+1);
%                     elseif BC_bis(j,k,l)==1 && theta(j,k,l)==0
%                         etat(j,k)=etat(j,k+1);
%                     elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-pi/4
%                         etat(j,k)=etat(j,k+1);
%                     elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-pi/2
%                         etat(j,k)=etat(j+1,k);
%                     elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-3*pi/4
%                         etat(j,k)=etat(j,k-1);
%                     end
%                 end
%             end
%         end
        for j=2:SYb-1
            for k=2:SXb-1
                for l=1:N
                    if BC_bis(j,k,l)==1 && theta(j,k,l)==pi
                        if (v_temp(j,k)+v_temp(j+1,k))/2>=0
                            etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))))*sigma(j,k); 
                        else
                            etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k); 
                        end
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==3*pi/4
                        etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))))*sigma(j,k);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==pi/2
                        if (u_temp(j,k)+u_temp(j,k+1))/2>=0
                            etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))))*sigma(j,k); 
                        else
                            etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))))*sigma(j,k); 
                        end
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==pi/4
                        etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))))*sigma(j,k); 
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==0
                        if (v_temp(j,k)+v_temp(j+1,k))/2>=0
                            etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j-1,k)+etat_temp(j-1,k))))*sigma(j,k); 
                        else
                            etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k); 
                        end
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-pi/4
                        etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k); 
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-pi/2
                        if (u_temp(j,k)+u_temp(j,k+1))/2>=0
                            etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k); 
                        else
                            etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k+1)+etat_temp(j,k+1))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k); 
                        end
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-3*pi/4
                        etat(j,k)=etat_temp(j,k)-dt/dxb*((bathyb_bis(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb_bis(j,k)+etat_temp(j,k))-(bathyb_bis(j,k-1)+etat_temp(j,k-1))))*sigma(j,k)-dt/dyb*((bathyb_bis(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb_bis(j+1,k)+etat_temp(j+1,k))-(bathyb_bis(j,k)+etat_temp(j,k))))*sigma(j,k); 
                    end
                end
            end
        end
%         MM_temp=MM;
%         MM=mean(mean(etat(1:SYb,1200:1400)));
%         if MM~=0
%             for j=1:SYb
%                 for k=1200:1400
%     %             for k=2:SXb
%                     etat(j,k)=etat(j,k)*MM_temp/MM;
%                 end
%             end
%         end
        for j=2:SYb-1
            for k=2:SXb
                DH3=max(ifrict,((etat(j,k-1)+bathyb_bis(j,k-1))+(etat(j,k)+bathyb_bis(j,k)))/2);
                if DH3>0.001
                    %MANNING=n*n*((etat(j,k-1)+bathyb_bis(j,k-1))+(etat(j,k)+bathyb_bis(j,k)))/2/DH3^(4/3);
                    MANNING=0;
                else
                    MANNING=0;
                end
                if ind(j,k)==1 || BCu(j,k)==1
                else
                    if bathyb(j,k)<0 && etat(j,k)>epsh
                        etat_bb(j,k)=etat(j,k)-bathyb(j,k);
                    else
                        etat_bb(j,k)=etat(j,k);
                    end
                    if bathyb(j,k-1)<0 && etat(j,k-1)>epsh
                        etat_bb(j,k-1)=etat(j,k-1)-bathyb(j,k-1);
                    else
                        etat_bb(j,k-1)=etat(j,k-1);
                    end
%                     if abs(etat_bb(j,k)-etat_bb(j,k-1))-abs(bathyb(j,k)-bathyb(j,k-1))<0.0001
%                         etat_bb(j,k)=etat_bb(j,k-1);
%                     end
                    if (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        u(j,k)=u_temp(j,k)-dt/dxb*u_temp(j,k)*(u_temp(j,k)-u_temp(j,k-1))*sigma_u(j,k)-dt/dyb*v_temp(j,k-1)*(u_temp(j,k)-u_temp(j-1,k))*sigma_u(j,k)-9.81*cos(Mtheta(j,k))*dt/dxb*(etat_bb(j,k)-etat_bb(j,k-1))*sigma_u(j,k)-9.81*cos(Mtheta(j,k))*dt*MANNING*((u_temp(j,k))^2+(v_temp(j,k-1))^2)^(0.5)*u_temp(j,k)*sigma_u(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        u(j,k)=u_temp(j,k)-dt/dxb*u_temp(j,k)*(u_temp(j,k)-u_temp(j,k-1))*sigma_u(j,k)-dt/dyb*v_temp(j+1,k-1)*(u_temp(j+1,k)-u_temp(j,k))*sigma_u(j,k)-9.81*cos(Mtheta(j,k))*dt/dxb*(etat_bb(j,k)-etat_bb(j,k-1))*sigma_u(j,k)-9.81*cos(Mtheta(j,k))*dt*MANNING*((u_temp(j,k))^2+(v_temp(j+1,k-1))^2)^(0.5)*u_temp(j,k)*sigma_u(j,k);
                     elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        u(j,k)=u_temp(j,k)-dt/dxb*u_temp(j,k)*(u_temp(j,k+1)-u_temp(j,k))*sigma_u(j,k)-dt/dyb*v_temp(j+1,k)*(u_temp(j+1,k)-u_temp(j,k))*sigma_u(j,k)-9.81*cos(Mtheta(j,k))*dt/dxb*(etat_bb(j,k)-etat_bb(j,k-1))*sigma_u(j,k)-9.81*cos(Mtheta(j,k))*dt*MANNING*((u_temp(j,k))^2+(v_temp(j+1,k))^2)^(0.5)*u_temp(j,k)*sigma_u(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        u(j,k)=u_temp(j,k)-dt/dxb*u_temp(j,k)*(u_temp(j,k+1)-u_temp(j,k))*sigma_u(j,k)-dt/dyb*v_temp(j,k-1)*(u_temp(j,k)-u_temp(j-1,k))*sigma_u(j,k)-9.81*cos(Mtheta(j,k))*dt/dxb*(etat_bb(j,k)-etat_bb(j,k-1))*sigma_u(j,k)-9.81*cos(Mtheta(j,k))*dt*MANNING*((u_temp(j,k))^2+(v_temp(j,k))^2)^(0.5)*u_temp(j,k)*sigma_u(j,k);
                    end
                    %inondation
                    %if bathyb(j,k-1)+etat(j,k-1)>EPSHD && bathyb(j,k)+etat(j,k)<EPSHD
                    if bathyb_bis(j,k-1)+etat(j,k-1)>EPSHD && bathyb_bis(j,k)+etat(j,k)<EPSHD && bathyb(j,k)<0 %&& bathyb(j,k-1)-bathyb(j,k)>0
                        u(j,k)=0;
                        if k>2
%                             hextra=2*etat(j,k-1)-etat(j,k-2);
%                             uextra=2*u_temp(j,k-1)-u_temp(j,k-2);
                            hextra=etat(j,k-1)-bathyb(j,k-1);
                            uextra=u(j,k-1);
                        else
                            hextra=etat(j,k-1)-bathyb(j,k-1);
                            uextra=u(j,k-1);
                        end
                        if uextra>epsu && etat(j,k)-bathyb(j,k)+epsh<hextra && test(j,k)==0
                            u(j,k)=uextra;
                        end
                    end
                    %if bathyb(j,k-1)+etat(j,k-1)<EPSHD && bathyb(j,k)+etat(j,k)>EPSHD
                    if bathyb_bis(j,k)+etat(j,k)>EPSHD && bathyb_bis(j,k-1)+etat(j,k-1)<EPSHD && bathyb(j,k)<0 %&& bathyb(j,k-1)-bathyb(j,k)<0                  
                        u(j,k)=0;
                        if k<SXb
%                             hextra=2*etat(j,k)-etat(j,k+1);
%                             uextra=2*u_temp(j,k+1)-u_temp(j,k+2);
                            hextra=etat(j,k)-bathyb(j,k);
                            uextra=u(j,k+1);
                        else
                            hextra=etat(j,k)-bathyb(j,k);
                            uextra=u(j,k+1);
                        end
                        if uextra<-epsu && etat(j,k-1)-bathyb(j,k-1)+epsh<hextra && test(j,k)==0
                            u(j,k)=uextra;
                        end
                    end
                end
            end
        end
        u(:,1)=0;
        u(:,SXb+1)=0;
        u(1,:)=u(2,:);
        u(SYb,:)=u(SYb-1,:);
        for j=2:SYb-1
            for k=2:SXb
                for l=1:N
                    if BCu_bis(j,k,l)==1
                        u(j,k)=0;
                    end
                end
            end
        end
        etat(1,1)=etat(2,1);
        etat(1,SXb)=etat(2,SXb);
        etat(SYb,1)=etat(SYb-1,1);
        etat(SYb,SXb)=etat(SYb-1,SXb);
%         for j=2:SYb-1
%             for k=2:SXb-1
%                 for l=1:N
%                     if BC_bis(j,k,l)==1 && theta(j,k,l)==3*pi/4
%                         etat(j,k)=etat(j-1,k);
%                     elseif BC_bis(j,k,l)==1 && theta(j,k,l)==pi/4
%                         etat(j,k)=etat(j-1,k);
%                     elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-pi/4
%                         etat(j,k)=etat(j+1,k);
%                     elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-3*pi/4
%                         etat(j,k)=etat(j+1,k);
%                     end
%                 end
%             end
%         end
        for j=2:SYb
            for k=2:SXb-1
                DH3=max(ifrict,((etat(j-1,k)+bathyb_bis(j-1,k))+(etat(j,k)+bathyb_bis(j,k)))/2);
                if DH3>0.001
                    %MANNING=n*n*((etat(j,k-1)+bathyb_bis(j,k-1))+(etat(j,k)+bathyb_bis(j,k)))/2/DH3^(4/3);
                    MANNING=0;
                else
                    MANNING=0;
                end
                if ind(j,k)==1 || BCv(j,k)==1
                else
                    if bathyb(j,k)<0 && etat(j,k)>epsh
                        etat_bb(j,k)=etat(j,k)-bathyb(j,k);
                    else
                        etat_bb(j,k)=etat(j,k);
                    end
                    if bathyb(j-1,k)<0 && etat(j-1,k)>epsh
                        etat_bb(j-1,k)=etat(j-1,k)-bathyb(j-1,k);
                    else
                        etat_bb(j-1,k)=etat(j-1,k);
                    end
                    if (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        v(j,k)=v_temp(j,k)-dt/dxb*u_temp(j-1,k)*(v_temp(j,k)-v_temp(j,k-1))*sigma_v(j,k)-dt/dyb*v_temp(j,k)*(v_temp(j,k)-v_temp(j-1,k))*sigma_v(j,k)-9.81*cos(Mtheta(j,k))*dt/dyb*(etat_bb(j,k)-etat_bb(j-1,k))*sigma_v(j,k)-9.81*cos(Mtheta(j,k))*dt*MANNING*((u_temp(j-1,k))^2+(v_temp(j,k))^2)^(0.5)*v_temp(j,k)*sigma_v(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        v(j,k)=v_temp(j,k)-dt/dxb*u_temp(j,k)*(v_temp(j,k)-v_temp(j,k-1))*sigma_v(j,k)-dt/dyb*v_temp(j,k)*(v_temp(j+1,k)-v_temp(j,k))*sigma_v(j,k)-9.81*cos(Mtheta(j,k))*dt/dyb*(etat_bb(j,k)-etat_bb(j-1,k))*sigma_v(j,k)-9.81*cos(Mtheta(j,k))*dt*MANNING*((u_temp(j,k))^2+(v_temp(j,k))^2)^(0.5)*v_temp(j,k)*sigma_v(j,k);
                     elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        v(j,k)=v_temp(j,k)-dt/dxb*u_temp(j,k+1)*(v_temp(j,k+1)-v_temp(j,k))*sigma_v(j,k)-dt/dyb*v_temp(j,k)*(v_temp(j+1,k)-v_temp(j,k))*sigma_v(j,k)-9.81*cos(Mtheta(j,k))*dt/dyb*(etat_bb(j,k)-etat_bb(j-1,k))*sigma_v(j,k)-9.81*cos(Mtheta(j,k))*dt*MANNING*((u_temp(j,k+1))^2+(v_temp(j,k))^2)^(0.5)*v_temp(j,k)*sigma_v(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        v(j,k)=v_temp(j,k)-dt/dxb*u_temp(j-1,k+1)*(v_temp(j,k+1)-v_temp(j,k))*sigma_v(j,k)-dt/dyb*v_temp(j,k)*(v_temp(j,k)-v_temp(j-1,k))*sigma_v(j,k)-9.81*cos(Mtheta(j,k))*dt/dyb*(etat_bb(j,k)-etat_bb(j-1,k))*sigma_v(j,k)-9.81*cos(Mtheta(j,k))*dt*MANNING*((u_temp(j-1,k+1))^2+(v_temp(j,k))^2)^(0.5)*v_temp(j,k)*sigma_v(j,k);
                    end
                    %inondation
%                     if bathyb(j,k)==0
%                         if v(j,k)==0 && v_temp(j-1,k)>0 && etat(j-1,k)>0 && j>2 && j<SYb
%                             v(j,k)=v_temp(j-1,k);
%                         elseif v(j,k)==0 && v_temp(j+1,k)<0 && etat(j,k)>0 && j>2 && j<SYb
%                             v(j,k)=v_temp(j+1,k);
%                         end
%                     end
                    %inondation
                    if bathyb_bis(j-1,k)+etat(j-1,k)>EPSHD && bathyb_bis(j,k)+etat(j,k)<EPSHD && bathyb(j,k)<0 %&& bathyb(j-1,k)-bathyb(j,k)>0
                        v(j,k)=0;
                        if j>2
%                             hextra=2*etat(j-1,k)-etat(j-2,k);
%                             vextra=2*v_temp(j-1,k)-v_temp(j-2,k);
                            vextra=v_temp(j-1,k);
                            hextra=etat(j-1,k)-bathyb(j-1,k);
                        else

                            hextra=etat(j-1,k)-bathyb(j-1,k);
                            vextra=v_temp(j-1,k);
                        end
                        if vextra>epsu && etat(j,k)-bathyb(j,k)+epsh<hextra && test(j,k)==0
                            v(j,k)=vextra;
                        end
                    end
                    if bathyb_bis(j-1,k)+etat(j-1,k)<EPSHD && bathyb_bis(j,k)+etat(j,k)>EPSHD && bathyb(j,k)<0 %&& bathyb(j-1,k)-bathyb(j,k)<0
                        v(j,k)=0;
                        if j<SYb
%                             hextra=2*etat(j,k)-etat(j+1,k);
%                             vextra=2*v_temp(j+1,k)-v_temp(j+2,k);
                            hextra=etat(j,k)-bathyb(j,k);
                            vextra=v_temp(j+1,k);
                        else
                            hextra=etat(j,k)-bathyb(j,k);
                            vextra=v_temp(j+1,k);
                        end
                        if vextra<-epsu && etat(j-1,k)-bathyb(j-1,k)+epsh<hextra && test(j,k)==0
                            v(j,k)=vextra;
                        end
                    end
                end
            end
        end
        v(:,1)=v(:,2);
        v(:,SXb)=v(:,SXb-1);
        v(1,:)=0;
        v(SYb+1,:)=0;
        for j=2:SYb
            for k=2:SXb-1
                for l=1:N
                    if BCv_bis(j,k,l)==1
                        v(j,k)=0;
                    end
                end
            end
        end
        compt=0;
        for j=1:ss
            if abs(tout(j)-t(i))<dt
                compt=1;
                t(i)
                etatout(:,:,j)=etat(:,:);
                uout(:,:,j)=u(:,:);
                vout(:,:,j)=v(:,:);
                RR=mat2gray(etat(:,1:SXb));
%                 imwrite(RR,'test.png');
                imwrite (RR,strcat ('test',num2str (tout(j)),'.png'));
            end
        end
    else %RK2
        etat_temp=etat;
        u_temp=u;
        v_temp=v;
        for j=2:SYb-1
            for k=2:SXb-1
                if ind(j,k)==1 || BC(j,k)==1
                else
                    if (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        h(j,k)=etat_temp(j,k)-dt/2/dxb*((bathyb(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb(j,k)+etat_temp(j,k))-(bathyb(j,k-1)+etat_temp(j,k-1))))*sigma(j,k)-dt/2/dyb*((bathyb(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb(j,k)+etat_temp(j,k))-(bathyb(j-1,k)+etat_temp(j-1,k))))*sigma(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        h(j,k)=etat_temp(j,k)-dt/2/dxb*((bathyb(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k)*((bathyb(j,k)+etat_temp(j,k))-(bathyb(j,k-1)+etat_temp(j,k-1))))*sigma(j,k)-dt/2/dyb*((bathyb(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j+1,k)*((bathyb(j+1,k)+etat_temp(j+1,k))-(bathyb(j,k)+etat_temp(j,k))))*sigma(j,k);
                     elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        h(j,k)=etat_temp(j,k)-dt/2/dxb*((bathyb(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k+1)*((bathyb(j,k+1)+etat_temp(j,k+1))-(bathyb(j,k)+etat_temp(j,k))))*sigma(j,k)-dt/2/dyb*((bathyb(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j+1,k)*((bathyb(j+1,k)+etat_temp(j+1,k))-(bathyb(j,k)+etat_temp(j,k))))*sigma(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        h(j,k)=etat_temp(j,k)-dt/2/dxb*((bathyb(j,k)+etat_temp(j,k))*(u_temp(j,k+1)-u_temp(j,k))+u_temp(j,k+1)*((bathyb(j,k+1)+etat_temp(j,k+1))-(bathyb(j,k)+etat_temp(j,k))))*sigma(j,k)-dt/2/dyb*((bathyb(j,k)+etat_temp(j,k))*(v_temp(j+1,k)-v_temp(j,k))+v_temp(j,k)*((bathyb(j,k)+etat_temp(j,k))-(bathyb(j-1,k)+etat_temp(j-1,k))))*sigma(j,k);
                    end
                end
            end
        end
        for j=2:SYb-1
            for k=2:SXb
                DH3=max(ifrict,((etat_temp(j,k-1)+bathyb(j,k-1))+(etat_temp(j,k)+bathyb(j,k)))/2);
                if DH3>0.001
                    MANNING=n*n*((etat_temp(j,k-1)+bathyb(j,k-1))+(etat_temp(j,k)+bathyb(j,k)))/2/DH3^(4/3);
                    %MANNING=0;
                else
                    MANNING=0;
                end
                if ind(j,k)==1 || BCu(j,k)==1
                else
                    if (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        f(j,k)=u_temp(j,k)-dt/2/dxb*u_temp(j,k)*(u_temp(j,k)-u_temp(j,k-1))*sigma_u(j,k)-dt/2/dyb*v_temp(j,k-1)*(u_temp(j,k)-u_temp(j-1,k))*sigma_u(j,k)-9.81*dt/2/dxb*(etat_temp(j,k)-etat_temp(j,k-1))*sigma_u(j,k)-9.81*dt/2*MANNING*((u_temp(j,k))^2+(v_temp(j,k-1))^2)^(0.5)*u_temp(j,k)*sigma_u(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        f(j,k)=u_temp(j,k)-dt/2/dxb*u_temp(j,k)*(u_temp(j,k)-u_temp(j,k-1))*sigma_u(j,k)-dt/2/dyb*v_temp(j+1,k-1)*(u_temp(j+1,k)-u_temp(j,k))*sigma_u(j,k)-9.81*dt/2/dxb*(etat_temp(j,k)-etat_temp(j,k-1))*sigma_u(j,k)-9.81*dt/2*MANNING*((u_temp(j,k))^2+(v_temp(j+1,k-1))^2)^(0.5)*u_temp(j,k)*sigma_u(j,k);
                     elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        f(j,k)=u_temp(j,k)-dt/2/dxb*u_temp(j,k)*(u_temp(j,k+1)-u_temp(j,k))*sigma_u(j,k)-dt/2/dyb*v_temp(j+1,k)*(u_temp(j+1,k)-u_temp(j,k))*sigma_u(j,k)-9.81*dt/2/dxb*(etat_temp(j,k)-etat_temp(j,k-1))*sigma_u(j,k)-9.81*dt/2*MANNING*((u_temp(j,k))^2+(v_temp(j+1,k))^2)^(0.5)*u_temp(j,k)*sigma_u(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        f(j,k)=u_temp(j,k)-dt/2/dxb*u_temp(j,k)*(u_temp(j,k+1)-u_temp(j,k))*sigma_u(j,k)-dt/2/dyb*v_temp(j,k-1)*(u_temp(j,k)-u_temp(j-1,k))*sigma_u(j,k)-9.81*dt/2/dxb*(etat_temp(j,k)-etat_temp(j,k-1))*sigma_u(j,k)-9.81*dt/2*MANNING*((u_temp(j,k))^2+(v_temp(j,k))^2)^(0.5)*u_temp(j,k)*sigma_u(j,k);
                    end
                    %inondation
                    % if bathyb(j,k)==0
                    %     if f(j,k)==0 && u_temp(j,k-1)>0 && etat_temp(j,k-1)>0
                    %         f(j,k)=u_temp(j,k-1);
                    %     elseif f(j,k)==0 && u_temp(j,k+1)<0 && etat_temp(j,k)>0
                    %         f(j,k)=u_temp(j,k+1);
                    %     end
                    % end
                    %inondation
                    %if bathyb(j,k-1)+h(j,k-1)>EPSHD && bathyb(j,k)+h(j,k)<EPSHD
                    if bathyb_bis(j,k-1)+h(j,k-1)>EPSHD && bathyb_bis(j,k)+h(j,k)<EPSHD && bathyb(j,k)<0
                        f(j,k)=0;
                        % if k>2
                        %     hextra=2*etat(j,k-1)-etat(j,k-2);
                        %     uextra=2*u_temp(j,k-1)-u_temp(j,k-2);
                        % else
                            hextra=h(j,k-1);
                            uextra=u_temp(j,k-1);
                        % end
                        if uextra>epsu && h(j,k)+epsh<hextra
                            f(j,k)=uextra;
                        end
                    end
                    %if bathyb(j,k-1)+h(j,k-1)<EPSHD && bathyb(j,k)+h(j,k)>EPSHD
                    if bathyb_bis(j,k)+h(j,k)>EPSHD && bathyb_bis(j,k-1)+h(j,k-1)<EPSHD && bathyb(j,k)<0
                        f(j,k)=0;
                        % if k<SXb
                        %     hextra=2*etat(j,k)-etat(j,k+1);
                        %     uextra=2*u_temp(j,k+1)-u_temp(j,k+2);
                        % else
                            hextra=h(j,k);
                            uextra=u_temp(j,k+1);
                        % end
                        if uextra<-epsu && h(j,k-1)+epsh<hextra
                            f(j,k)=uextra;
                        end
                    end
                end
            end
        end
        if i>2
            etat_temp(:,1)=etat_temp_b(:,2);
            etat_temp(:,SXb)=etat_temp_b(:,SXb-1);
            etat_temp(1,:)=etat_temp_b(2,:);
            etat_temp(SYb,:)=etat_temp_b(SYb-1,:);
            for j=2:SYb-1
                for k=2:SXb-1
                    for l=1:N
                        if BC_bis(j,k,l)==1 && theta(j,k,l)==3*pi/4
                            %etat(j,k)=etat_temp_b(j-1,k-1);
                            etat_temp(j,k)=etat_temp_b(j-1,k);
                        elseif BC_bis(j,k,l)==1 && theta(j,k,l)==pi/4
                            %etat(j,k)=etat_temp_b(j-1,k+1);
                            etat_temp(j,k)=etat_temp_b(j-1,k);
                        elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-pi/4
                            %etat(j,k)=etat_temp_b(j+1,k+1);
                            etat_temp(j,k)=etat_temp_b(j+1,k);
                        elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-3*pi/4
                            %etat(j,k)=etat_temp_b(j+1,k-1);
                            etat_temp(j,k)=etat_temp_b(j+1,k);
                        end
                    end
                end
            end
        end
        for j=2:SYb
            for k=2:SXb-1
                if ind(j,k)==1 || BCv(j,k)==1
                else
                    DH3=max(ifrict,((etat_temp(j-1,k)+bathyb(j-1,k))+(etat_temp(j,k)+bathyb(j,k)))/2);
                    if DH3>0.001
                        MANNING=n*n*((etat_temp(j-1,k)+bathyb(j-1,k))+(etat_temp(j,k)+bathyb(j,k)))/2/DH3^(4/3);
                        %MANNING=0;
                    else
                        MANNING=0;
                    end
                    if (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        g(j,k)=v_temp(j,k)-dt/2/dxb*u_temp(j-1,k)*(v_temp(j,k)-v_temp(j,k-1))*sigma_v(j,k)-dt/2/dyb*v_temp(j,k)*(v_temp(j,k)-v_temp(j-1,k))*sigma_v(j,k)-9.81*dt/2/dyb*(etat_temp(j,k)-etat_temp(j-1,k))*sigma_v(j,k)-9.81*dt/2*MANNING*((u_temp(j-1,k))^2+(v_temp(j,k))^2)^(0.5)*v_temp(j,k)*sigma_v(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        g(j,k)=v_temp(j,k)-dt/2/dxb*u_temp(j,k)*(v_temp(j,k)-v_temp(j,k-1))*sigma_v(j,k)-dt/2/dyb*v_temp(j,k)*(v_temp(j+1,k)-v_temp(j,k))*sigma_v(j,k)-9.81*dt/2/dyb*(etat_temp(j,k)-etat_temp(j-1,k))*sigma_v(j,k)-9.81*dt/2*MANNING*((u_temp(j,k))^2+(v_temp(j,k))^2)^(0.5)*v_temp(j,k)*sigma_v(j,k);
                     elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        g(j,k)=v_temp(j,k)-dt/2/dxb*u_temp(j,k+1)*(v_temp(j,k+1)-v_temp(j,k))*sigma_v(j,k)-dt/2/dyb*v_temp(j,k)*(v_temp(j+1,k)-v_temp(j,k))*sigma_v(j,k)-9.81*dt/2/dyb*(etat_temp(j,k)-etat_temp(j-1,k))*sigma_v(j,k)-9.81*dt/2*MANNING*((u_temp(j,k+1))^2+(v_temp(j,k))^2)^(0.5)*v_temp(j,k)*sigma_v(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        g(j,k)=v_temp(j,k)-dt/2/dxb*u_temp(j-1,k+1)*(v_temp(j,k+1)-v_temp(j,k))*sigma_v(j,k)-dt/2/dyb*v_temp(j,k)*(v_temp(j,k)-v_temp(j-1,k))*sigma_v(j,k)-9.81*dt/2/dyb*(etat_temp(j,k)-etat_temp(j-1,k))*sigma_v(j,k)-9.81*dt/2*MANNING*((u_temp(j-1,k+1))^2+(v_temp(j,k))^2)^(0.5)*v_temp(j,k)*sigma_v(j,k);
                    end
                    %inondation
                    % if bathyb(j,k)==0
                    %     if g(j,k)==0 && v_temp(j-1,k)>0 && etat_temp(j-1,k)>0 && j>2 && j<SYb
                    %         g(j,k)=v_temp(j-1,k);
                    %     elseif g(j,k)==0 && v_temp(j+1,k)<0 && etat_temp(j,k)>0 && j>2 && j<SYb
                    %         g(j,k)=v_temp(j+1,k);
                    %     end
                    % end
                    %if bathyb(j-1,k)+h(j-1,k)>EPSHD && bathyb(j,k)+h(j,k)<EPSHD
                    if bathyb_bis(j-1,k)+h(j-1,k)>EPSHD && bathyb_bis(j,k)+h(j,k)<EPSHD && bathyb(j,k)<0
                        g(j,k)=0;
                        % if j>2
                        %     hextra=2*etat(j-1,k)-etat(j-2,k);
                        %     vextra=2*v_temp(j-1,k)-v_temp(j-2,k);
                        % else
                            hextra=h(j-1,k);
                            vextra=v_temp(j-1,k);
                        % end
                        if vextra>epsu && h(j,k)+epsh<hextra
                            g(j,k)=vextra;
                        end
                    end
                    %if bathyb(j-1,k)+h(j-1,k)<EPSHD && bathyb(j,k)+h(j,k)>EPSHD
                    if bathyb_bis(j-1,k)+h(j-1,k)<EPSHD && bathyb_bis(j,k)+h(j,k)>EPSHD && bathyb(j,k)<0
                        g(j,k)=0;
                        % if j<SYb
                        %     hextra=2*etat(j,k)-etat(j+1,k);
                        %     vextra=2*v_temp(j+1,k)-v_temp(j+2,k);
                        % else
                            hextra=h(j,k);
                            vextra=v_temp(j+1,k);
                        % end
                        if vextra<-epsu && h(j-1,k)+epsh<hextra
                            g(j,k)=vextra;
                        end
                    end
                end
            end
        end
        htemp=h;
        h(1,:)=htemp(2,:);
        h(SYb,:)=htemp(SYb-1,:);
        h(:,1)=htemp(:,2);
        h(:,SXb)=htemp(:,SXb-1);
        for j=2:SYb-1
            for k=2:SXb-1
                for l=1:N
                    if BC_bis(j,k,l)==1 && theta(j,k,l)==pi
                        h(j,k)=htemp(j,k-1);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==3*pi/4
                        %h(j,k)=htemp(j-1,k-1);
                        h(j,k)=htemp(j,k-1);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==pi/2
                        h(j,k)=htemp(j-1,k);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==pi/4
                        %h(j,k)=htemp(j-1,k+1);
                        h(j,k)=htemp(j,k+1);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==0
                        h(j,k)=htemp(j,k+1);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-pi/4
                        %h(j,k)=htemp(j+1,k+1);
                        h(j,k)=htemp(j,k+1);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-pi/2
                        h(j,k)=htemp(j+1,k);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-3*pi/4
                        %h(j,k)=htemp(j+1,k-1);
                        h(j,k)=htemp(j,k-1);
                    end
                end
            end
        end
        f(:,1)=0;
        f(:,SXb+1)=0;
        f(1,:)=f(2,:);
        f(SYb,:)=f(SYb-1,:);
        for j=2:SYb-1
            for k=2:SXb
                for l=1:N
                    if BCu_bis(j,k,l)==1
                        f(j,k)=0;
                    end
                end
            end
        end
        g(:,1)=g(:,2);
        g(:,SXb)=g(:,SXb-1);
        g(1,:)=0;
        g(SYb+1,:)=0;
        for j=2:SYb
            for k=2:SXb-1
                for l=1:N
                    if BCv_bis(j,k,l)==1
                        g(j,k)=0;
                    end
                end
            end
        end
        %2nd étape
        for j=2:SYb-1
            for k=2:SXb-1
                if ind(j,k)==1 || BC(j,k)==1
                else
                    if (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        etat(j,k)=etat_temp(j,k)-dt/dxb*((h(j,k)+bathyb(j,k))*(f(j,k+1)-f(j,k))+f(j,k)*((h(j,k)+bathyb(j,k)-h(j,k-1)-bathyb(j,k-1))))*sigma(j,k)-dt/dyb*((h(j,k)+bathyb(j,k))*(g(j+1,k)-g(j,k))+g(j,k)*((h(j,k)+bathyb(j,k))-(h(j-1,k)+bathyb(j-1,k))))*sigma(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        etat(j,k)=etat_temp(j,k)-dt/dxb*((h(j,k)+bathyb(j,k))*(f(j,k+1)-f(j,k))+f(j,k)*((h(j,k)+bathyb(j,k))-(h(j,k-1)+bathyb(j,k-1))))*sigma(j,k)-dt/dyb*((h(j,k)+bathyb(j,k))*(g(j+1,k)-g(j,k))+g(j+1,k)*((h(j+1,k)+bathyb(j+1,k))-(h(j,k)+bathyb(j,k))))*sigma(j,k);
                     elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        etat(j,k)=etat_temp(j,k)-dt/dxb*((h(j,k)+bathyb(j,k))*(f(j,k+1)-f(j,k))+f(j,k+1)*((h(j,k+1)+bathyb(j,k+1))-(h(j,k)+bathyb(j,k))))*sigma(j,k)-dt/dyb*((h(j,k)+bathyb(j,k))*(g(j+1,k)-g(j,k))+g(j+1,k)*((h(j+1,k)+bathyb(j+1,k))-(h(j,k)+bathyb(j,k))))*sigma(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        etat(j,k)=etat_temp(j,k)-dt/dxb*((h(j,k)+bathyb(j,k))*(f(j,k+1)-f(j,k))+f(j,k+1)*((h(j,k+1)+bathyb(j,k+1))-(h(j,k)+bathyb(j,k))))*sigma(j,k)-dt/dyb*((h(j,k)+bathyb(j,k))*(g(j+1,k)-g(j,k))+g(j,k)*((h(j,k)+bathyb(j,k))-(h(j-1,k)+bathyb(j-1,k))))*sigma(j,k);
                    end
                end
            end
        end
        for j=2:SYb-1
            for k=2:SXb
                if ind(j,k)==1 || BCu(j,k)==1
                else
                    DH3=max(((h(j,k-1)+bathyb(j,k-1))+(h(j,k)+bathyb(j,k)))/2,ifrict);
                    if DH3>0.001
                        MANNING=n*n*((h(j,k-1)+bathyb(j,k-1))+(h(j,k)+bathyb(j,k)))/2/DH3^(4/3);
                        %MANNING=0;
                    else
                        MANNING=0;
                    end
                    if (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        u(j,k)=u_temp(j,k)-dt/dxb*f(j,k)*(f(j,k)-f(j,k-1))*sigma_u(j,k)-dt/dyb*g(j,k-1)*(f(j,k)-f(j-1,k))*sigma_u(j,k)-9.81*dt/dxb*((h(j,k))-(h(j,k-1)))*sigma_u(j,k)-9.81*dt*MANNING*((f(j,k))^2+(g(j,k-1))^2)^(0.5)*f(j,k)*sigma_u(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        u(j,k)=u_temp(j,k)-dt/dxb*f(j,k)*(f(j,k)-f(j,k-1))*sigma_u(j,k)-dt/dyb*g(j+1,k-1)*(f(j+1,k)-f(j,k))*sigma_u(j,k)-9.81*dt/dxb*((h(j,k))-(h(j,k-1)))*sigma_u(j,k)-9.81*dt*MANNING*((f(j,k))^2+(g(j+1,k-1))^2)^(0.5)*f(j,k)*sigma_u(j,k);
                     elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        u(j,k)=u_temp(j,k)-dt/dxb*f(j,k)*(f(j,k+1)-f(j,k))*sigma_u(j,k)-dt/dyb*g(j+1,k)*(f(j+1,k)-f(j,k))*sigma_u(j,k)-9.81*dt/dxb*((h(j,k))-(h(j,k-1)))*sigma_u(j,k)-9.81*dt*MANNING*((f(j,k))^2+(g(j+1,k))^2)^(0.5)*f(j,k)*sigma_u(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        u(j,k)=u_temp(j,k)-dt/dxb*f(j,k)*(f(j,k+1)-f(j,k))*sigma_u(j,k)-dt/dyb*g(j,k-1)*(f(j,k)-f(j-1,k))*sigma_u(j,k)-9.81*dt/dxb*((h(j,k))-(h(j,k-1)))*sigma_u(j,k)-9.81*dt*MANNING^(4/3)*((f(j,k))^2+(g(j,k))^2)^(0.5)*f(j,k)*sigma_u(j,k);
                    end
                end
            end
        end
        %inondation
        % if bathyb(j,k)==0
        %     if u(j,k)==0 && u_temp(j,k-1)>0 && etat_temp(j,k-1)>0
        %         u(j,k)=f(j,k-1);
        %     elseif u(j,k)==0 && u_temp(j,k+1)<0 && etat_temp(j,k)>0
        %         u(j,k)=f(j,k+1);
        %     end
        % end
        %if bathyb(j,k-1)+etat(j,k-1)>EPSHD && bathyb(j,k)+etat(j,k)<EPSHD
        if bathyb_bis(j,k-1)+etat(j,k-1)>EPSHD && bathyb_bis(j,k)+etat(j,k)<EPSHD && bathyb(j,k)<0
            u(j,k)=0;
            % if k>2
            %     hextra=2*etat(j,k-1)-etat(j,k-2);
            %     uextra=2*u_temp(j,k-1)-u_temp(j,k-2);
            % else
                hextra=etat(j,k-1);
                uextra=f(j,k-1);
            % end
            if uextra>epsu && etat(j,k)+epsh<hextra
                u(j,k)=uextra;
            end
        end
        if bathyb_bis(j,k-1)+etat(j,k-1)<EPSHD && bathyb_bis(j,k)+etat(j,k)>EPSHD && bathyb(j,k)<0
            u(j,k)=0;
%             if k<SXb
            %     hextra=2*etat(j,k)-etat(j,k+1);
            %     uextra=2*u_temp(j,k+1)-u_temp(j,k+2);
            % else
                hextra=etat(j,k);
                uextra=f(j,k+1);
%             end
            if uextra<-epsu && etat(j,k-1)+epsh<hextra
                u(j,k)=uextra;
            end
        end
        h(:,1)=htemp(:,2);
        h(:,SXb)=htemp(:,SXb-1);
        h(1,:)=htemp(2,:);
        h(SYb,:)=htemp(SYb-1,:);
        for j=2:SYb-1
            for k=2:SXb-1
                for l=1:N
                    if BC_bis(j,k,l)==1 && theta(j,k,l)==3*pi/4
                        %h(j,k)=htemp(j-1,k-1);
                        h(j,k)=htemp(j-1,k);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==pi/4
                        %h(j,k)=htemp(j-1,k+1);
                        h(j,k)=htemp(j-1,k);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-pi/4
                        %h(j,k)=htemp(j+1,k+1);
                        h(j,k)=htemp(j+1,k);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-3*pi/4
                        %h(j,k)=htemp(j+1,k-1);
                        h(j,k)=htemp(j+1,k);
                    end
                end
            end
        end
        for j=2:SYb
            for k=2:SXb-1
                DH3=max(((h(j-1,k)+bathyb(j-1,k))+(h(j,k)+bathyb(j,k)))/2,ifrict);
                if DH3>0.001
                    MANNING=n*n*((h(j,k)+bathyb(j,k))+(h(j-1,k)+bathyb(j-1,k)))/2/DH3^(4/3);
                    %MANNING=0;
                else
                    MANNING=0;
                end
                if ind(j,k)==1 || BCv(j,k)==1
                else
                    if (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        v(j,k)=v_temp(j,k)-dt/dxb*f(j-1,k)*(g(j,k)-g(j,k-1))*sigma_v(j,k)-dt/dyb*g(j,k)*(g(j,k)-g(j-1,k))*sigma_v(j,k)-9.81*dt/dyb*((h(j,k))-(h(j-1,k)))*sigma_v(j,k)-9.81*dt*MANNING*((f(j-1,k))^2+(g(j,k))^2)^(0.5)*g(j,k)*sigma_v(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2>=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        v(j,k)=v_temp(j,k)-dt/dxb*f(j,k)*(g(j,k)-g(j,k-1))*sigma_v(j,k)-dt/dyb*g(j,k)*(g(j+1,k)-g(j,k))*sigma_v(j,k)-9.81*dt/dyb*((h(j,k))-(h(j-1,k)))*sigma_v(j,k)-9.81*dt*MANNING*((f(j,k))^2+(g(j,k))^2)^(0.5)*g(j,k)*sigma_v(j,k);
                     elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2<=0
                        v(j,k)=v_temp(j,k)-dt/dxb*f(j,k+1)*(g(j,k+1)-g(j,k))*sigma_v(j,k)-dt/dyb*g(j,k)*(g(j+1,k)-g(j,k))*sigma_v(j,k)-9.81*dt/dyb*((h(j,k))-(h(j-1,k)))*sigma_v(j,k)-9.81*dt*MANNING*((f(j,k+1))^2+(g(j,k))^2)^(0.5)*g(j,k)*sigma_v(j,k);
                    elseif (u_temp(j,k)+u_temp(j,k+1))/2<=0 && (v_temp(j,k)+v_temp(j+1,k))/2>=0
                        v(j,k)=v_temp(j,k)-dt/dxb*f(j-1,k+1)*(g(j,k+1)-g(j,k))*sigma_v(j,k)-dt/dyb*g(j,k)*(g(j,k)-g(j-1,k))*sigma_v(j,k)-9.81*dt/dyb*((h(j,k))-(h(j-1,k)))*sigma_v(j,k)-9.81*dt*MANNING*((f(j-1,k+1))^2+(g(j,k))^2)^(0.5)*g(j,k)*sigma_v(j,k);
                    end
                end
            end
        end
        %inondation
        % if bathyb(j,k)==0
        %     if v(j,k)==0 && v_temp(j-1,k)>0 && etat_temp(j-1,k)>0 && j>2 && j<SYb
        %         v(j,k)=g(j-1,k);
        %     elseif v(j,k)==0 && v_temp(j+1,k)<0 && etat_temp(j,k)>0 && j>2 && j<SYb
        %         v(j,k)=g(j+1,k);
        %     end
        % end
        if bathyb_bis(j-1,k)+etat(j-1,k)>EPSHD && bathyb_bis(j,k)+etat(j,k)<EPSHD && bathyb(j,k)<0
            v(j,k)=0;
            % if j>2
            %     hextra=2*etat(j-1,k)-etat(j-2,k);
            %     vextra=2*v_temp(j-1,k)-v_temp(j-2,k);
            % else
                hextra=etat(j-1,k);
                vextra=g(j-1,k);
            % end
            if vextra>epsu && etat(j,k)+epsh<hextra
                v(j,k)=vextra;
            end
        elseif bathyb_bis(j-1,k)+etat(j-1,k)<EPSHD && bathyb_bis(j,k)+etat(j,k)>EPSHD && bathyb(j,k)<0
            v(j,k)=0;
%             if j<SYb
            %     hextra=2*etat(j,k)-etat(j+1,k);
            %     vextra=2*v_temp(j+1,k)-v_temp(j+2,k);
            % else
                hextra=etat(j,k);
                vextra=g(j+1,k);
%             end
            if vextra<-epsu && etat(j-1,k)+epsh<hextra
                v(j,k)=vextra;
            end
        end
        etat_temp_b=etat;
        etat(1,:)=etat_temp_b(2,:);
        etat(SYb,:)=etat_temp_b(SYb-1,:);
        etat(:,1)=etat_temp_b(:,2);
        etat(:,SXb)=etat_temp_b(:,SXb-1);
        for j=2:SYb-1
            for k=2:SXb-1
                for l=1:N
                    if BC_bis(j,k,l)==1 && theta(j,k,l)==pi
                        etat(j,k)=etat_temp_b(j,k-1);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==3*pi/4
                        %etat(j,k)=etat_temp_b(j-1,k-1);
                        etat(j,k)=etat_temp_b(j,k-1);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==pi/2
                        etat(j,k)=etat_temp_b(j-1,k);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==pi/4
                        %etat(j,k)=etat_temp_b(j-1,k+1);
                        etat(j,k)=etat_temp_b(j,k+1);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==0
                        etat(j,k)=etat_temp_b(j,k+1);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-pi/4
                        %etat(j,k)=etat_temp_b(j+1,k+1);
                        etat(j,k)=etat_temp_b(j,k+1);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-pi/2
                        etat(j,k)=etat_temp_b(j+1,k);
                    elseif BC_bis(j,k,l)==1 && theta(j,k,l)==-3*pi/4
                        %etat(j,k)=etat_temp_b(j+1,k-1);
                        etat(j,k)=etat_temp_b(j,k-1);
                    end
                end
            end
        end
        u(:,1)=0;
        u(:,SXb+1)=0;
        u(1,:)=u(2,:);
        u(SYb,:)=u(SYb-1,:);
        for j=2:SYb-1
            for k=2:SXb
                for l=1:N
                    if BCu_bis(j,k,l)==1
                        u(j,k)=0;
                    end
                end
            end
        end
        v(:,1)=v(:,2);
        v(:,SXb)=v(:,SXb-1);
        v(1,:)=0;
        v(SYb+1,:)=0;
        for j=2:SYb
            for k=2:SXb-1
                for l=1:N
                    if BCv_bis(j,k,l)==1
                        v(j,k)=0;
                    end
                end
            end
        end
        compt=0;
        for j=1:ss
            if abs(tout(j)-t(i))<dt
                t(i)
                compt=1;
                etatout(:,:,j)=etat(:,:);
                uout(:,:,j)=u(:,:);
                vout(:,:,j)=v(:,:);
                RR=mat2gray(etat(:,1:SXb));
%                 imwrite(RR,'test.png');
                imwrite (RR,strcat ('test',num2str (tout(j)),'.png'));
            end
        end
    end
    c(i,1)=etat(Y(1),XX(1));
    c_u(i,1)=u(Y(1),XX(1));
    c_v(i,1)=v(Y(1),XX(1));
    c(i,2)=etat(Y(1),XX(2));
    c_u(i,2)=u(Y(1),XX(2));
    c_v(i,2)=v(Y(1),XX(2));
    c(i,3)=etat(Y(1),XX(3));
    c_u(i,3)=u(Y(1),XX(3));
    c_v(i,3)=v(Y(1),XX(3));
    c(i,4)=etat(Y(1),XX(4));
    c_u(i,4)=u(Y(1),XX(4));
    c_v(i,4)=v(Y(1),XX(4));
    c(i,5)=etat(Y(1),XX(5));
    c_u(i,5)=u(Y(1),XX(5));
    c_v(i,5)=v(Y(1),XX(5));
    c(i,6)=etat(Y(1),XX(6));
    c_u(i,6)=u(Y(1),XX(6));
    c_v(i,6)=v(Y(1),XX(6));
    c(i,7)=etat(Y(1),XX(7));
    c_u(i,7)=u(Y(1),XX(7));
    c_v(i,7)=v(Y(1),XX(7));
    c(i,8)=etat(Y(1),XX(8));
    c_u(i,8)=u(Y(1),XX(8));
    c_v(i,8)=v(Y(1),XX(8));
    c(i,9)=etat(Y(1),XX(9));
    c_u(i,9)=u(Y(1),XX(9));
    c_v(i,9)=v(Y(1),XX(9));
    c(i,10)=etat(Y(1),XX(10));
    c_u(i,10)=u(Y(1),XX(10));
    c_v(i,10)=v(Y(1),XX(10));
%     c1(i,1)=(u(Y1,X1)-u(Y1-1,X1))/dx-(v(Y1,X1)-v(Y1,X1-1))/dy;
end
% etat_without_CL_uv=etat;
% u_without_CL_uv=u;
% v_without_CL_uv=v;

save etatout_25_gages_L_9m_init_4_dH_10cm_ter etatout
save uout_25_gages_L_9m_init_4_dH_10cm_ter uout
save vout_25_gages_L_9m_init_4_dH_10cm_ter vout
save gages_25_gages_L_9m_init_4_dH_10cm_ter c

% save('etatout_dH_0_0005m_res_0_5mm_obs_reseau_cyl_D_0_032_fd_humide_with_sponge_layer.mat','etatout')
% save('uout_dH_0_0005m_res_0_5mm_obs_reseau_cyl_D_0_032_fd_humide_with_sponge_layer.mat','uout')
% save('vout_dH_0_0005m_res_0_5mm_obs_reseau_cyl_D_0_032_fd_humide_with_sponge_layer.mat','vout')
% save('etat_temporal_dH_0_0005m_res_0_5mm_obs_reseau_cyl_D_0_032_fd_humide_with_sponge_layer.mat','c')
% save('u_temporal_dH_0_0005m_res_0_5mm_obs_reseau_cyl_D_0_032_fd_humide_with_sponge_layer.mat','c_u')
% save('v_temporal_dH_0_0005m_res_0_5mm_obs_reseau_cyl_D_0_032_fd_humide_with_sponge_layer.mat','c_v')

% xx=0:0.001:Lx; %Définition de x, une liste qui va de 0 à (SX-1)*0.01 avec un pas de dx
% yy=0:0.001:Ly; %Définition de y, une liste qui va de 0 à (SY-1)*0.01 avec un pas de dy
% SXX=Lx/0.001+1;
% SYY=Ly/0.001+1;
% [XX,YY]=meshgrid(xx,yy);
% [mat_x,mat_y]=meshgrid(x,y);
% vect_x=reshape(mat_x,SX*SY,1);
% vect_y=reshape(mat_y,SX*SY,1);
% vect_z=reshape(etat,SX*SY,1);
% zz=griddata(vect_x,vect_y,vect_z,XX,YY);

% for i=2:7:s
%     c1(i,1) = etat(ycapts/d,round(capt1/d),i)+0.17;
%     c2(i,1) = etat(ycapts/d,round(capt2/d),i)+0.17;
%     c3(i,1) = etat(ycapts/d,round(capt3/d),i)+0.17;
%     c4(i,1) = etat(ycapts/d,round(capt4/d),i)+0.17-0.15;
%     c5(i,1) = etat(ycapts/d,round(capt5/d),i)+0.17-0.15;
%     c6(i,1) = etat(ycapts/d,round(capt6/d),i)+0.17;
% end
close all;
for i=1:ss
    figure;hold on;imagesc(xb,yb,etatout(:,1:SXb,i))
%     caxis([-0.001 0.001])µ%etatout
    caxis([-0.1 0.1])
    axis equal     
    xlabel('x (in m)')                                          %On place les titres des axes                        
    ylabel('y (in m)')
    zlabel('z (in m)')
    cb = colorbar;
    pos = get(cb,'Position');
    set(cb,'Position',pos - [0,0,0,0]);
    dim = [0.2 0.5 0.3 0.3];
    annotation('textbox',dim,'String',['time t =',num2str(tout(i)),'s'] ,'FitBoxToText','on');
    dim2 = [0.2 0.5 0.38 0.38];
    annotation('textbox',dim2,'String','Water elevation [m]' ,'FitBoxToText','on');
    F = getframe;
    images{i}=frame2im(F);
    close all
end
writerObj = VideoWriter('SV_mangrove.avi');
writerObj.FrameRate = 1;
secsPerImage = ones(1,length(images));
open(writerObj);
[r,s]=size(images{1});
for k=1:ss%length(images)
   frame = im2frame(images{k});
   for r=1:secsPerImage(k) 
       writeVideo(writerObj, frame);      % "écrit" les images sur la video
   end
end
close(writerObj);

figure;hold on;plot(x,-bathyb(10,:))
for i=15:5:ss
    for j=2:SYb-1
        for k=2:SXb-1
            if bathy(j,k)>0
                free_surface_out(k)=etatout(10,k,i)*10;
            else
                free_surface_out(k)=etatout(10,k,i)*10-bathy(j,k);
            end
        end
    end
    plot(x(1:SX-1),free_surface_out)
end
axis equal
legend('bathy',num2str(tout(15)), num2str(tout(20)),num2str(tout(25)),num2str(tout(30)),num2str(tout(35)),num2str(tout(40)),num2str(tout(45)))
% legend(transpose(num2str(tout(10:3:ss))))
figure;hold on;plot(x,-bathyb(10,:))
for i=10:3:ss
    for j=2:SYb-1
        for k=2:SXb-1
            if bathy(j,k)>0
                free_surface_out(k)=uout(10,k,i);
            else
                free_surface_out(k)=uout(10,k,i);
            end
        end
    end
    plot(x(1:SX-1),free_surface_out)
end
axis equal
legend('bathy',num2str(tout(10)), num2str(tout(13)),num2str(tout(16)))

F=zeros(ss,2);
for i=1:ss
    for j=2:SYb-1
        F(i,1)=F(i,1)+1000*dy/2*(etatout(j,676,i)*uout(j,676,i)*((uout(j,676,i)^2+vout(j,676,i)^2)+9.81*etatout(j,676,i)));
        F(i,2)=F(i,2)+1000*dy/2*(etatout(j,826,i)*uout(j,826,i)*((uout(j,826,i)^2+vout(j,826,i)^2)+9.81*etatout(j,826,i)));
    end
end


% 
% uout=zeros(SYb,SXb+1,ss);
% vout=zeros(SYb+1,SXb,ss);
if ghost==1
    vort=zeros(SYb+1,round(SXb*4/3)+1,ss);
else
    vort=zeros(SYb+1,SXb+1,ss);
end
for i=1:ss
    for j=2:SYb-1
        %for k=2:round(SXb*4/3)-1
        for k=2:SXb-1
            if ind(j,k)==1 || BC(j,k)==1
                vort(j,k,i)=NaN;
            else
                vort(j,k,i)=(uout(j,k,i)-uout(j-1,k,i))/dx-(vout(j,k,i)-vout(j,k-1,i))/dy;
            end
        end
    end
end
figure;imagesc(xb,yb,vort(:,:,5/0.2+1))
xlabel('x (in m)')                                          %On place les titres des axes
ylabel('y (in m)')
axis equal
colorbar
caxis([-30 30])
% 
% uout_prime=zeros(SYb,round(SXb*4/3)+1,17);
% vout_prime=zeros(SYb+1,round(SXb*4/3),17);
% for i=1:SYb
%     for j=1:round(SXb*4/3)+1
%         Muout=mean(uout(i,j,:));
%         for k=1:17
%             uout_prime(i,j,k)=uout(i,j,k)-Muout;
%         end
%     end
% end
% for i=1:SYb+1
%     for j=1:round(SXb*4/3)
%         Mvout=mean(vout(i,j,:));
%         for k=1:17
%             vout_prime(i,j,k)=vout(i,j,k)-Mvout;
%         end
%     end
% end
% uout_prime_b=zeros(SYb,round(SXb*4/3),17);
% vout_prime_b=zeros(SYb,round(SXb*4/3),17);
% for i=1:SYb
%     for j=1:round(SXb*4/3)
%         for k=1:17
%             uout_prime_b(i,j,k)=(uout_prime(i,j,k)+uout_prime(i,j+1,k))/2;
%             vout_prime_b(i,j,k)=(vout_prime(i,j,k)+vout_prime(i+1,j,k))/2;
%         end
%     end
% end
% MEANuout_prime_b_vout_prime_b=zeros(SYb,round(SXb*4/3));
% for i=1:SYb
%     for j=1:round(SXb*4/3)
%         MEANuout_prime_b_vout_prime_b(i,j)=1000*mean(uout_prime_b(i,j,:).*vout_prime_b(i,j,:));
%     end
% end
% figure;imagesc(x,y,MEANuout_prime_b_vout_prime_b(1:SYb,1:SXb))
% axis equal

% verif=zeros(SYb,SXb+1,ss);
% for i=1:ss
%     for j=2:SYb-1
%         for k=2:SXb-1
%             if abs((uout(j,k,i)-uout(j,k-1,i)))<0.02
%             else
%                verif(j,k,i)=1;
%             end
%         end
%     end
% end
% figure;imagesc(xb,yb,verif)         
% axis equal         
% xlabel('x (in m)')                                          %On place les titres des axes                        
% ylabel('y (in m)')
% zlabel('z (in m)')
% colorbar

% MM=0;
% l=0;
% for j=2:SYb-1
%     for k=670:1123%dx=0.0003
% %     for k=400:676%dx=0.0005
%         if vort(j,k,17)==0
%         else
%             l=l+1;
%             MM=MM+abs(vort(j,k,17));
%         end
%     end
% end
% MM=MM/l;
% STD_W=0;
% for j=2:SYb-1
% %     for k=670:1123%dx=0.0003
%     for k=400:676%dx=0.0005
%         if vort(j,k,17)==0
%         else
%             STD_W=STD_W+(MM-abs(vort(j,k,17)))^2;
%         end
%     end
% end
% STD_W=sqrt(STD_W/l);

% figure
% plot(t,c1)
% hold on
% plot(t,c2)
% plot(t,c3)
% plot(t,c4)
% plot(t,c5)
% plot(t,c6)
% hold off
% legend('capteur1','capteur2','capteur3','capteur4','capteur5','capteur6')

%Code capteurs : on va demander l'affichage à chaque instant de la valeur de etat pour chaque point de coordonnée (capti,ycapt)

% animation_vue_dessus_9