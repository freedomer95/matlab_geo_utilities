% DISCLAIMER:
% before running this script you need the "Mapping Toolbox" of MATLAB, you can install it if you don't have.
% This should be running for versions later than 2016 (tested on 2019), don't know for before.

%% INPUT SECTION
% Write here the borders' coordinates of your map
LAN=47; % Latitude north
LAS=35; % Latitude south
LOW=3; % Longitude west
LOE=20; % Longitude east

%% IMPORTING SHORELINES
% You are importing here the shorelines of a FULL RESOLUTION (really detailed).
% This will take a while depending on your harware. You don't have to run this part every time!
% Just run it a first time and then keep variables on the whorkspace.
if exist('shorelines','var')
    disp('>> Shorelines alredy imported - RUNNING SCRIPT...')
else
    disp('>> Importing shorelines...')
    filename = 'C:\Program Files\MATLAB\R2019b\toolbox\m_map\private\gshhg-bin-2.3.6\gshhs_f.b' ;
    shorelines = gshhs(filename,[LAS LAN],[LOW LOE]);
    disp('> shorelines imported, RUNNING SCRIPT...')
end

%% MAKING THE MAP
% Setting the general map
latlim=([LAS LAN]);
lonlim=([LOW LOE]);
worldmap(latlim,lonlim)
% Now you plot the shorelines through the gshhg file you have already imported

continent_color=[0.8 0.7 0.4]; % you can switch the color of the continent: light brown[0.8 0.6 0.4] - grey [0.7 0.7 0.7]
geoshow([shorelines.Lat],[shorelines.Lon],'DisplayType','Polygon',...
    'FaceColor',continent_color) 

sea_color=[0.7 1 1]; % Here you can color the sea (ligth blue in this example)
setm(gca, 'FFaceColor',sea_color) 

disp('All done! <')