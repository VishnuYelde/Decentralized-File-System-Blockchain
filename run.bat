@echo off
echo Starting project setup...

echo Cleaning Hardhat environment...
call npx hardhat clean

echo Starting Hardhat node in a new window...
start cmd /k "cd %cd% && npx hardhat node"

echo Waiting for node to start...
timeout /t 5 /nobreak > nul

echo Compiling contracts...
call npx hardhat compile --force

echo Deploying contracts...
call npx hardhat run scripts/deploy.js --network localhost

echo Starting React client...
cd client
call npm start

echo Setup complete!