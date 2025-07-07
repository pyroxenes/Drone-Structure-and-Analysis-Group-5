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

% data digestion
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

% understand smallest double length in the set
u = 1;
poscount = numel(datreformat{1,2}(:,1));
hopscotch = size(datreformat);
while u < hopscotch(1,1)
    u = u + 1;
    if poscount > numel(datreformat{u,2}(:,1))
        poscount = numel(datreformat{u,2}(:,1));
    end
end

% graph pretty stuff setup
newcolors = jet(poscount);
colororder(newcolors)
hold on
zlabel("lifting force, lbf")
ylabel("incoming airstream velocity, mph")
xlabel("prop rotational speed, rpm")

% plot from data
g = 1;
n = 1;
plotstore = [];
while g < poscount
    plotstore = [];
    while n <= numel(datreformat(:,1))
        plotstore(n,:) = [datreformat{n,1} datreformat{n,2}(g,2) datreformat{1,2}(g,1)];
       n = n + 1;
    end
    n = 1;
    plot3(plotstore(:,1),plotstore(:,3),plotstore(:,2))
    g = g + 1;
end

%output currently garbles datastructure on read after export,
% either need to rethink how I am structuing this fundementally to a more
% exportable structure (3D array if exportable?)

%outdir = input("specify output directory: ", "s")
%outputname = split(fpath,"/");
%outputname = split(outputname{numel(outputname)},".");
%outputname = outputname{1};
%outputname = strcat(outdir,"/",outputname,".dat")
%writetable(datreformat,outputname)
 
