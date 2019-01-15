function [intersection, y1,y2] = lab5drawlines(lines,L1,L2)
   
     tetha1 = lines(L1).theta;
     tetha2 = lines(L2).theta; 
     
     if tetha1 == 0
         tetha1 = 0.001;
     end
     
     if tetha2 == 0
         tetha2 = 0.001;  
     end

     rho = [lines(L1).rho; lines(L2).rho];
     A = [cosd(tetha1) sind(tetha1); cosd(tetha2) sind(tetha2)];
     intersection = inv(A)*rho;

     x1 = 0:0.1:2000;
     x2 = 0:0.1:2000;
     y1 = (rho(1)-x1*cosd(tetha1))/sind(tetha1);
     y2 = (rho(2)-x2*cosd(tetha2))/sind(tetha2);

     plot(x1(1,:), y1(1,:), 'm','LineWidth',1);
     plot(x2(1,:), y2(1,:), 'm','LineWidth',1);
     plot(intersection(1),intersection(2),'-o')

end
