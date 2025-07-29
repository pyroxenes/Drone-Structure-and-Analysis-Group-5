function arm
TR = stlread('arm.stl');
colormap abyss
trisurf(TR,"Linestyle","none")
axis equal
grid off
axis off
view([3 3 2])
end