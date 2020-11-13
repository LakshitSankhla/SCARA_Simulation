close all
clear all
clc

x = [1,5;2,4;3,3;4,2;5,1];    #alternate initial and final X-coordinate of the object
y = [1,8;1,8;1,8;1,8;1,8];    #alternate initial and final Y-coordinate of the object

l1 = 5.65;l2 = 5.65;	      #lenght of link 1 and link 2


theta2 = acosd((x.*2+y.*2-(l1*2) - (l2*2)) / (2 * l1*l2));
theta1 = atand(y./x) - atand((l2 * sind(theta2)) ./ (l1 + l2*cosd(theta2)));

alpha=[theta1(1,:),theta1(2,:),theta1(3,:),theta1(4,:),theta1(5,:)];
beta=[theta2(1,:),theta2(2,:),theta2(3,:),theta2(4,:),theta2(5,:)];


u=[x(1,:),x(2,:),x(3,:),x(4,:),x(5,:)];
v=[y(1,:),y(2,:),y(3,:),y(4,:),y(5,:)];

for i = 1:length(u)
    	  
    x2 = l1*cosd(alpha(i)); 
    y2 = l1*sind(alpha(i)); 
    axis([0,8,-3,8])			
    cla
    hold on    
    for j = i:length(u)
      if (mod(j,2) == 1)
        plot(u(j),v(j) , 'bd', 'MarkerSize', 30) 
	grid on 
      endif        
    endfor  
    for j = 1:i
      if (mod(j,2) == 0)
        plot(u(j),v(j) , 'bd', 'MarkerSize', 30)  
      endif        
    endfor
    plot([1,x2],[1,y2],'LineWidth',5,[u(i),x2],[v(i),y2],'LineWidth',5)
    grid on
    plot(u(i),v(i) , 'bd', 'MarkerSize', 30)
    grid on
    axis([0,8,-3,8])
    hold off
    pause(1)          
endfor
