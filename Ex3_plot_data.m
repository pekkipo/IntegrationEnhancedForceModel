close all;
clear all;
clc;

% ESPACE: Orbit Mechanics
% Exercise 3: Integration of Satellite Orbits with Different Force Models


% Solution to plot:
fsol = 'U';

% Solution to compare, use [] for no comparison
fcom = 'A';


%% LOAD DATA
data = load(['SolutionA1' fsol '.txt']);
tim = data(:,1);
pos = data(:,2:4);
vel = data(:,5:7);
kep = data(:,8:13);     
clear data;

ftitle = ['<' fsol '>'];

if isempty(fcom) == 0
    data = load(['SolutionA1' fcom '.txt']);
    pos2 = data(:,2:4);
    vel2 = data(:,5:7);
    kep2 = data(:,8:13);     
    clear data;
    
    pos = pos - pos2;
    vel = vel - vel2;
    kep = kep - kep2;
    ftitle = ['<' fsol '> - ' fcom ];
    
    for t = 1:length(tim)
        if kep(t,5) > 300
            kep(t,5) = kep(t,5) - 360;
        end
        if kep(t,5) < -300
            kep(t,5) = kep(t,5) + 360;
        end
        if kep(t,6) > 300
            kep(t,6) = kep(t,6) - 360;
        end
        if kep(t,6) < -300
            kep(t,6) = kep(t,6) + 360;
        end        
    end
else
    kep(:,5) = mod(kep(:,5),360);
end


%% PLOT DATA
figure
subplot(211)
plot(tim,pos)
xlabel('Time [s]')
legend('R_x','R_y','R_z')
title(['Solution ' ftitle ', Position [m]'])

subplot(212)
plot(tim,vel)
xlabel('Time [s]')
legend('V_x','V_y','V_z')
title(['Solution ' ftitle ', Velocity [m/s]'])

kep_title = ['Seminajor Axis [m]   '
             'Eccentricity         '
             'Inclination [deg]    '
             'RAAN [deg]           '
             'Arg. of Perigee [deg]'
             'True Anomaly [deg]   '];

figure
for k = 1:6
    subplot(['32' num2str(k)])
    plot(tim,kep(:,k))
    title(['Solution ' ftitle ', ' kep_title(k,:)])
end






