% Creating the vector
x = 0:5:50;

% Computing the function
y = (4 * x .^ 2 .* (log(6) + 5 * x) .^ 2) ./ sqrt(cos(x) .^ 2 + 1);

% Plotting the function
plot(x, y, 'r--o');  % red dash line with circle markers
xlabel('x');
ylabel('y');
title('Plot of y against x');
