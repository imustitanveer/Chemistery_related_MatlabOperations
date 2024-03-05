% Given data
CAo = [0.01, 0.02, 0.04, 0.06, 0.2, 0.2]; % Concentrations of A [mol/L]
CBo = [0.20, 0.20, 0.20, 0.0202, 0.0404, 0.0808]; % Concentrations of B [mol/L]
Rate = [3.2e-5, 6.5e-5, 1.3e-4, 6.5e-5, 1.3e-4, 2.6e-4]; % Reaction rates [mol/L/min]

% to begin, we assume that the reaction is first-order with respect to A and B
% This will then be replaced by the calculated values of initial rates method
order_A = 1; 
order_B = 1;

% Determining the reaction order with respect to A
% while only CAo changes, we compare the rates of experiments 1,2 and 3
% the goal is to look for a pattern in the change of rate
% For the sake of simplicity, we make an assumption that the order is either 0, 1, or 2
if Rate(2)/Rate(1) == CAo(2)/CAo(1)
    order_A = 1;
elseif Rate(3)/Rate(1) == (CAo(3)/CAo(1))^2
    order_A = 2;
else
    order_A = 0;
end

% Determining the reaction order with respect to B
% While only CBo changes, we compare the rates of experiments 4,5, and 6
if Rate(5)/Rate(4) == CBo(5)/CBo(4)
    order_B = 1;
elseif Rate(6)/Rate(4) == (CBo(6)/CBo(4))^2
    order_B = 2;
else
    order_B = 0;
end

% Calculating the rate constant k
k = Rate(1) / (CAo(1)^order_A * CBo(1)^order_B);

% Given Constants
FA0 = 10; % mol/min (given)
v_CSTR = 200; % volume of CSTR in liters (given)

% Taking User input
reaction_order = input('Enter the reaction order (1 or 2): ');

% Solving for conversion X
syms X
if reaction_order == 1
    % For First order reaction
    eqn = (FA0 + k*CAo(1)*v_CSTR)*X - k*CAo(1)*v_CSTR == 0;
    X = double(solve(eqn, X));
elseif reaction_order == 2
    % For Second order reaction
    eqn = k*CAo(1)^2*v_CSTR*X^2 - (2.5*k*CAo(1)^2*v_CSTR/FA0 + 1)*X + k*CAo(1)^2*v_CSTR/FA0 == 0;
    X = double(solve(eqn, X));
else
    error('Invalid reaction order. Please enter 1 or 2.');
end

% Displaying the calculated reaction orders and rate of k
fprintf('Determined reaction order with respect to A: %d\n', order_A);
fprintf('Determined reaction order with respect to B: %d\n', order_B);
fprintf('Calculated rate constant k: %e\n', k);

% Displaying the result of the conversion
fprintf('The conversion X for a reaction order of %d is: %f\n', reaction_order, X);
