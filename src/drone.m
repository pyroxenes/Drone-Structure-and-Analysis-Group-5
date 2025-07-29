function drone
TR = stlread('drone.stl');
tiledlayout(1,2)
colormap colorcube
nexttile
trisurf(TR,"Linestyle","none")
axis equal
grid off
axis off
view([-3 3 2])
nexttile
trisurf(TR,"Linestyle","none")
axis equal
grid off
axis off
view([0 0 2])
end