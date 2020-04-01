function [fitresult, gof] = createFit(Masses, Spans, Spar_Masses)
%CREATEFIT1(MASSES,SPANS,SPAR_MASSES)
%  Create a fit.
%
%  Data for 'Spar Mass Fit' fit:
%      X Input : Masses
%      Y Input : Spans
%      Z Output: Spar_Masses
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 29-Mar-2020 12:42:21


%% Fit: 'Spar Mass Fit'.
[xData, yData, zData] = prepareSurfaceData( Masses, Spans, Spar_Masses );

% Set up fittype and options.
ft = fittype( 'c*x^m*y^n', 'independent', {'x', 'y'}, 'dependent', 'z' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.275758914920589 0.750141068562642 0.959492426392903];

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, opts );

% Plot fit with data.
figure();
plot(fitresult);
hold on
scatter3(xData, yData, zData, '.k')
% legend('Model', 'Data' );
% Label axes
xlabel( 'Supported Mass [kg]', 'Interpreter', 'none' );
ylabel( 'Wingspan [m]', 'Interpreter', 'none' );
zlabel( 'Spar Mass [kg]', 'Interpreter', 'none' );
grid on


