## Drone Structure and Analysis - Engineering Pathways Program MathWorks Internship Group 5 Project Submission
### Group 5
- Jade Porter
- Alexander Astorga
- Thomas Li
- Sharlize Lumos
- Anthony Santos
___
### Project Description
The purpose of this project is to optimize drone delivery by establishing a design that can carry heavier packages, up to 70 lbs. Our objective is to minimize the weight of the airframe.

Some of the concepts and tools used were:
- CAD modeling (Fusion360)
- MATLAB livescripts

___
### Project Limitations and Future Work

___
### Using this Project
#### Requirements
- MATLAB R2023b or later

### Running this Project
1. **Clone the repository:**
    - **Ensure all relevant functions and files are downloaded with the livescript**
2. **Open The Matlab Livescript:**
  MainProjectFile.mlx
3. **Run the matlab live script:**

### File Structure
```bash
┌    Drone-Structure-and-Analysis-Group-5
├── src
│   ├── MainProjectFile.mlx
│   ├── propplot.m
│   ├── thrustvproplen.m*
│   ├── armvprop.m
│   ├── arm.m
│   ├── shearbend.m
│   ├── drone.m
│   ├── arm.stl
│   ├── drone.stl
│   └── PER3_27x13E.dat
├── media
│   ├── drone.f3d
│   └── drone render.png
├── LICENSE
└── README.md
```

#### File Descriptions   
   - **MainProjectFile.mlx**: Main Livescript file
   - **propplot.m**: Plots propellor performance data
   - **thrustvproplen.m**: Plots thrust performance for motor with various propellor lengths
   - **armvprop.m**: Plots minimum arm length vs propellor diameter
   - **arm.m**: Plots drone arm STL
   - **shearbend.m**: calculates and plots shear force and bending moment diagrams for the drone arm
   - **drone.m**: Plots two views of the whole drone STL
   - **arm.stl**: STL file for arm.m
   - **drone.stl**: STL file for drone.m
   - **PER3_27x13E.dat**: Propellor performance data
   - **Drone.f3d**: Fusion 360 Project file of the drone model
___

## Individual Contributions
The main livescript was compiled from code written by Alexander Astorga and Jade Porter. The compliation and writing of this livescript was done by Jade Porter.

## Acknowledgements
This project was made during and for the Engineering Pathways Program MathWorks Summer 2025 Internship.
We are extremely grateful for both this opportunity and the guidance provided by the Mathworks and EPP Team.
