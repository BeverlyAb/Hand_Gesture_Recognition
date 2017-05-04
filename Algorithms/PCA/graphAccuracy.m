function [accuracyPlot ] = graphAccuracy( accuracy_rate )
% Creates curve graph of accuracy rate with respect to subject basis size
figure 
accuracyPlot = plot(accuracy_rate);
accuracyPlot.Marker = '*';
title('Accuracy v. Basis Subject Size');
xlabel('Basis Size(n)');
ylabel('Accuracy Rate');
end

