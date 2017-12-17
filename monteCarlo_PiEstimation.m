clc
close all
clear all

%% Plot Circle
figure(1)
subplot(2,1,1)
tCircle = 0:0.01:2*pi;
xCircle = cos(tCircle);
yCircle = sin(tCircle);
plot(xCircle,yCircle)
axis([-1.5 1.5 -1.5 1.5])
grid on
hold on

%% Create Random Points

radius = 1;

a = -1;
b = 1;
r = (b-a).*rand(250,2) + a;
Xi = r(:,1);
Yi = r(:,2);

% LHS Design
% doeOutput = lhsdesign(100,2);
% doeOutput = (b-a).*doeOutput + a;
% Xi = doeOutput(:,1);
% Yi = doeOutput(:,2);

inCircle =((Xi.^2+Yi.^2)<=radius);


numInCircle = 0;
piEstimation = zeros(size(Xi));
for i=1:size(Xi,1)
    
    if inCircle(i)==1
        colorString = 'b';
        numInCircle = numInCircle +1;
    else
        colorString = 'r';
    end
    
    subplot(2,1,1)
    hold on
    scatter(Xi(i),Yi(i),colorString,'filled')

    
    piEstimation(i) = 4*numInCircle/i;
    
    subplot(2,1,2)
    plot(1:i,piEstimation(1:i),'k')
    hold on
    title(['Pi Estimation: ', num2str(piEstimation(i)),' Iteration: ',num2str(i)])
    
    pause(0.5/i^2)
    
    
end

