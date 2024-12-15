function [fuelW, PW, CPW, P1, P2] = userweightvars %Creates a function with no inputs and 5 outputs
%William Wilson, AERE 161, Project 1, Problem 1, Function 1
%   Write a function that obtains and returns information on weight
%   variables entered by the user. Ensure the weight meets certain criteria
%   like fuel being in correct range. 
x = 1;%Sets the while loop to active
while x == 1 %Creates a loop that will run until the x value is changed
    fuelW = input('How much fuel is onboard? (in US Gallons) --> '); %Asks the user for the fuel in gallons
    if fuelW > 50 %Checks if more than 50 gallons were entered
        disp("The entered fuel is greater then the plane can store. Please enter a value below 50 Gallons") %Displays that the valye entered was too much
    elseif fuelW <= 0 %Checks if enough fuel was entered to run the plane at all
        disp("The entered fuel is not enough to fly please enter a number greater than 0 Gallons") %Tells the user more fuel is needed
    else %Runs if the correct amount of fuel was entered
        x = 2; %Changed x value to exit loop
        PW = input('What is the weight of the pilot (in lbs)? --> '); %Asks for the pilot weight in lbs
        CPW = input('What is the weight of the co-pilot (in lbs)? --> '); %Asks for the co-pilot weight in lbs
        P1 = input('What is the weight of passenger one? (if no passenger enter 0) --> '); %Asks for the passenger 1 weight in lbs
        P2 = input('What is the weight of passenger two? (if no passenger enter 0) --> '); %Asks for the passenger 2 weight in lbs
    end%Ends the if statment
end%Ends the while loop
end%Ends the function