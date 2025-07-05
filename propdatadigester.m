% takes in APC prop .dat files to extract and plot the thrust-rpm relationship
fpath = input("enter file pathname: ", "s");
fdat = readtable(fpath);
fdat = cat(2,fdat(:,1),fdat(:,4));
fdat(1:13,:) = [];
datreformat = {};
a = fdat.(1);
tempstore = [];
i = 1;
j = 1;
while i <= numel(a)
    pogo = split(string(cell2mat(a(i))));
    if numel(pogo) == 4
        datreformat{j,1} = pogo(4);
        j = j + 1;
    else 
        tempstore(i,1) = pogo(1);
    end
    i = i + 1;
end
tempstore(:,2) = fdat.(2);
k = 1;
l = 0;
v = 1;
temptempstore = [];
while k < numel(tempstore(:,2))
    if isnan(tempstore(k+1,2)) ~= isnan(tempstore(k,2)) && ~isnan(tempstore(k+1,2))
        l = l + 1;
    end
    if ~isnan(tempstore(k,2))
        temptempstore(v,:) = tempstore(k,:);
        v = v + 1;
            if l > 0
                datreformat{l,2} = temptempstore;
            end
    else
        v = 1;
        temptempstore = [];
    end
    k = k + 1;
end


vcond = input("input velocity table position (integer value): ");
n = 1;
plotstore = [];

while n <= numel(datreformat(:,1))
    plotstore(n,:) = [datreformat{n,1} datreformat{n,2}(vcond,2)];
    n = n + 1;
end

plot(plotstore(:,1),plotstore(:,2))
guh = num2str(datreformat{1,2}(vcond,1));
walnut = strcat("lifting force rpm relation for ", guh," mph condition");
title(walnut)
ylabel("lifting force, lbf")
xlabel("prop rpm")