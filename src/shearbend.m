function shearbend(Fmotor)

Fbatterymass = -24.5839; % N
batterycentroid = 0.070; % m
batdistval = 175.599285714; % N/m;
batrange = [0 .140];

Fescmass = -.8829; % N
esccentroid = 0.185; % m
escdistval = 11.0917085427; % N/m;
escrange = [.1452 .2248];

Farmmass = -27.854678199; % N
armcentroid = .241718333333; % m
armrange1 = [.140 .1452];
armrange2 = [.2248 .725155];

motorcentroid = 0.725155; % m

Reactiony = (-1)*(Fmotor + Fbatterymass + Fescmass + Farmmass);
Reactionmoment = motorcentroid*Fmotor + batterycentroid*Fbatterymass + esccentroid*Fescmass + armcentroid*Farmmass;

batshear = batrange(1,1):0.00001:batrange(1,2);
armshear1 = armrange1(1,1):0.00001:armrange1(1,2);
escshear = escrange(1,1):0.00001:escrange(1,2);
armshear2 = armrange2(1,1):0.00001:armrange2(1,2);

batshear(2,:) = -38.4120335639*(batshear(1,:).^2) - batdistval*batshear(1,:) + Reactiony;
c = (-1)*(-38.4120335639*(batshear(1,length(batshear)).^2) - batshear(2,length(batshear)));
armshear1(2,:) = -38.4120335639*(armshear1(1,:).^2) + c;
c = (-1)*(-38.4120335639*(armshear1(1,length(armshear1)).^2) - escdistval*armshear1(1,length(armshear1)) - armshear1(2,length(armshear1)));
escshear(2,:) = -38.4120335639*(escshear(1,:).^2) - escdistval*escshear(1,:) + c;
c = (-1)*(-38.4120335639*(escshear(1,length(escshear)).^2) - escshear(2,length(escshear)));
armshear2(2,:) = -38.4120335639*(armshear2(1,:).^2) + c;
hold off
shear = cat(2,batshear,armshear1);
shear = cat(2,shear,escshear);
shear = cat(2,shear,armshear2);
a = [shear(1,length(shear));0];
shear = cat(2,shear,a);
plot(shear(1,:),shear(2,:),'b')

batmome = batrange(1,1):0.00001:batrange(1,2);
armmome1 = armrange1(1,1):0.00001:armrange1(1,2);
escmome = escrange(1,1):0.00001:escrange(1,2);
armmome2 = armrange2(1,1):0.00001:armrange2(1,2);

batmome(2,:) = -38.4120335639*(batmome(1,:).^3)*(1/3) - batdistval*(batmome(1,:).^2)*(1/2) + Reactionmoment;
c = (-1)*(-38.4120335639*(batmome(1,length(batmome)).^3)*(1/3) - batmome(2,length(batmome)));
armmome1(2,:) = -38.4120335639*(armmome1(1,:).^3)*(1/3) + c;
c = (-1)*(-38.4120335639*(armmome1(1,length(armmome1)).^3)*(1/3) - (escdistval*armmome1(1,length(armmome1)).^2)*(1/2) - armmome1(2,length(armmome1)));
escmome(2,:) = -38.4120335639*(escmome(1,:).^3)*(1/3) - (escdistval*escmome(1,:).^2)*(1/2) + c;
c = (-1)*(-38.4120335639*(escmome(1,length(escmome)).^3)*(1/3) - escmome(2,length(escmome)));
armmome2(2,:) = -38.4120335639*(armmome2(1,:).^3)*(1/3) + c;

mome = cat(2,batmome,armmome1);
mome = cat(2,mome,escmome);
mome = cat(2,mome,armmome2);
a = [mome(1,length(mome));0];
mome = cat(2,mome,a);
hold on
plot(mome(1,:),mome(2,:),'r');
rectangle('Position',[0 -0.0075 .725155 .015])

end