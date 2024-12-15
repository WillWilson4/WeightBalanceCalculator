clear, clc

%{

William Wilson, AERE 161, Project 1, Script 1
This project will involve using variables and performing simple arithmetic.
You will obtain values from the user using the “input” function and check
that the aircraft is within the weight and balance as specified from the man-
ufacture.

%}

x = 1;%Inititates the while loop
while x == 1 
    clear, clc%Clears all vars so that new ones can be entered and window is clean
    x = 1; %Sets the loop back to being active after vars have been cleared
    %Constants
    EmptyW = 1471; % Empty weight in lbs
    CoG = 85.9; %Center of Gravity in inches
    FrontStMA = 85.5; %Front Seat Moment Arm in inches
    FuelTankMA = 95; %Fule Tanks Moment Arm in inches
    RearStMA = 118.1; %Rear seat moment arm in inches
    MaxRweight = 2400; %Max Ramp Weight in lbs
    MaxFuel = 50; %Max fuel in Gallons
    fprintf('Welcome to the W&B aviation calculator presented by Wilson integrations!\n')%Welcome message to user
    y = 1;%Initiates next while loop
    while y == 1 %While loop that runs the majority of code, repeates until user enters weight low enough to fly
        [fuelW, PW, CPW, P1, P2] = userweightvars; %Obatins user data for weight variables through a function
        FuelWlbs = fuelW * 6; %Converts the fuel that we had in Gallons into lbs of fuel
        RampW = FuelWlbs + EmptyW + PW + CPW + P1 + P2; %Calculates total weight of the aircraft once loaded
        
        if RampW <= MaxRweight %Checks if ramp weight is less then total weight allowed
            y = 2;%Changes y value ending the while loop
            disp('Nice!')%Applouds the user for setting weight right

            Mfront = (PW+CPW)*FrontStMA; %Calculates moment for the front seats
            Mrear = (P1+P2)*RearStMA; %Calculates moment for the rear seats
            Mfuel = FuelWlbs*FuelTankMA; %Calculates moment for the fuel tanks
            Mempty = EmptyW * CoG;%Calculates moment for the craft when empty

            TotalM = Mempty+Mfront+Mrear+Mfuel;%Adds up the total Moment from user imputs and calcuations

            NewCoG = TotalM/RampW; %Calculates new CoG
            fprintf('\nYour new Center of Gravity is %0.2f inches\n', NewCoG)%Prints CoG to user with a message
            if NewCoG >= 86.8 && NewCoG <= 95.8
                fprintf("The aircraft is within the weight and balance. It should be able to have a stable takeoff and fly normally!\n")
            else
                fprintf("The aircraft is not within the weight and balance. It will be unstable if flown and should remain grounded until its W&B is in the correct range. ")
            end
        else %Runs if the weight was too heavy and more then max allowed
            fprintf('\nTotal weight was too heavy, please enter again with new weights. Total weight must be under 2400\n')%Tells the user to try again
        end%Ends the if statment
    end%Ends the while loop
    loopbreak = input('\nEnter 1 if you would like to close out of the program \nand any other number to do it again. -->');%checks if user wants to go again
    if loopbreak == 1 %Checks if user said no
        x = 2;%Changes x value to break out of the loop
        fprintf('\n')%Creates a space so it is easier to read
        disp('Thanks for using the W&B aviation calculator, see you next time!')%Prints and exit message
    end %Ends the for loop
end%Ends the while loop and program

