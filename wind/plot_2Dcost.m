function plot_2Dcost(ws, rheo, pitch, cost)

    allpoints = [ws,rheo,cost];
    points_neg1 = allpoints(pitch==-1,:);
    points_neg1
    points_3 = allpoints(pitch==3,:);
    points_5 = allpoints(pitch==5,:);
    points_7 = allpoints(pitch==7,:);
    points_9 = allpoints(pitch==9,:);
    
    close all
    figure
    scatter(points_neg1(:,1),points_neg1(:,3),(points_neg1(:,2)/100+1)*5,'r')
    hold on
    % scatter3(points_3(:,1),points_3(:,2),points_3(:,3),'b')
    % scatter3(points_5(:,1),points_5(:,2),points_5(:,3),'g')
    % hold on
    % scatter3(points_7(:,1),points_7(:,2),points_7(:,3),'m')
    % scatter3(points_9(:,1),points_9(:,2),points_9(:,3),'k')
    xlabel('wind speed')
    ylabel('cost')
    % legend('-1','3','5','7','9')

end